import 'package:corona/models/country-stats.dart';
import 'package:corona/models/models.dart';
import 'package:corona/services/api.dart';
import 'package:mobx/mobx.dart';
import 'package:country_code_picker/country_code_picker.dart' as cc;

part 'store.g.dart';

class CoronaDataStore = _CoronaDataStore with _$CoronaDataStore;

abstract class _CoronaDataStore with Store {
  final _api = NetCalls();

  // _$CoronaDataStore() {
  //   fetchLatest();
  // }

  @observable
  cc.CountryCode countryCode = cc.CountryCode.fromCode('KE');

  @computed
  CountryStats get countryStats => CountryStats(provinces, countryCode.code);

  @observable
  bool isFetching = false;

  @observable
  List<Province> provinces = [];

  @action
  Future fetchLatest() async {
    isFetching = true;
    provinces = await _api.getCountryCases(countryCode.code);
    isFetching = false;
  }

  @action
  void changeCountry(cc.CountryCode code) {
    countryCode = code;
    fetchLatest();
  }
}

// flutter packages pub run build_runner watch --delete-conflicting-outputs



class WorldStats {}
