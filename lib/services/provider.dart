import 'package:corona/models/models.dart';
import 'package:corona/services/api.dart';
import 'package:country_code_picker/country_code.dart' as cc;
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

class DataStore with ChangeNotifier {
  static Logger logger = Logger('DataStore');
  static cc.CountryCode countryCode = cc.CountryCode.fromCode('KE');
  final _api = NetCalls();

  CountryStats countryStats;
  List<Province> provinces;
  bool isFetching = false;

  DataStore() {
    fetchLatest();
  }

  Future fetchLatest() async {
    isFetching=true;
    notifyListeners();
    provinces = await _api.getWorldCases();
    logger.info('Fetched ${provinces.length} provinces');
    countryStats = await compute<List<Province>,CountryStats>(computeStats,provinces);
    isFetching = false;
    notifyListeners();
  }

  static CountryStats computeStats(List<Province> provinces) {
    var stats =  CountryStats(provinces, countryCode.code);
    logger.info(stats);
    return stats;
  }

  void changeCountry(cc.CountryCode code) {
    countryCode = code;
    fetchLatest();
  }
}