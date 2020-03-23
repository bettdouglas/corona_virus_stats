import 'package:corona/models/models.dart';
import 'package:corona/services/api.dart';
import 'package:corona/services/firebase-analytics.dart';
import 'package:country_code_picker/country_code.dart' as cc;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

class DataStore with ChangeNotifier {
  static Logger logger = Logger('DataStore');
  static cc.CountryCode countryCode = cc.CountryCode.fromCode('KE');
  final _api = NetCalls();

  AnalyticsObserver observer = AnalyticsObserver(); 

  CountryStats countryStats;
  List<Province> provinces;
  bool isFetching = false;
  bool isCountrySelected = false;

  DataStore() {
    fetchLatest();
  }

  Future fetchLatest() async {
    isFetching = true;
    notifyListeners();
    provinces = await _api.getWorldCases();
    logger.info('Fetched ${provinces.length} provinces');
    countryStats =
        await compute<List<Province>, CountryStats>(computeStats, provinces);
    isFetching = false;
    notifyListeners();
  }

  static CountryStats computeStats(List<Province> provinces) {
    var stats = CountryStats(provinces, countryCode.code);
    logger.info(stats);
    return stats;
  }

  void changeCountry(cc.CountryCode code) {
    countryCode = code;
    isCountrySelected = true;
    notifyListeners();
    fetchCountryData(code.code);
  }

  void fetchCountryData(String iso2) async {
    var provinces = await _api.getCountryCases(iso2);
    countryStats = computeStats(provinces);
    notifyListeners();
  }
}

class CountryStore with ChangeNotifier {
  static Logger logger = Logger('CountryStore');

  final Province province;
  final _api = NetCalls();
  List<TimeSeries> series = [];

  bool isUpdating = true;

  CountryStore(this.province) {
    get();
  }

  Future get() async {
    series = await _api.getCountryTimeSeries(province.countrycode.iso2);
    isUpdating = false;
    logger.info(series);
    notifyListeners();
  }
}
