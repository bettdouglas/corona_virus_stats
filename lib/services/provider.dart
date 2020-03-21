import 'package:corona/models/models.dart';
import 'package:corona/services/api.dart';
import 'package:country_code_picker/country_code.dart' as cc;
import 'package:country_code_picker/country_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

class DataStore with ChangeNotifier {
  static Logger logger = Logger('DataStore');
  static cc.CountryCode countryCode;
  final _api = NetCalls();

  CountryStats countryStats;
  List<Province> provinces;
  bool isFetching = false;

  DataStore(BuildContext context) {
    countryCode = cc.CountryCode.fromCode(CountryLocalizations.of(context).locale.countryCode);
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
    fetchLatest();
  }
}

class CountryStore with ChangeNotifier {
  static Logger logger = Logger('DataStore');

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
