import 'package:corona/models/models.dart';
import 'package:corona/services/api.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:mobx/mobx.dart';
import 'package:country_code_picker/country_code_picker.dart' as cc;

part 'store.g.dart';

class CoronaDataStore = _CoronaDataStore with _$CoronaDataStore;

abstract class _CoronaDataStore with Store {
  final _api = NetCalls();

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
    print('Fetching latest');
    provinces = await _api.getCountryCases(countryCode.code);
    // provinces = await _api.getWorldCases();
    isFetching = false;
  }

  @action
  void changeCountry(cc.CountryCode code) {
    countryCode = code;
    fetchLatest();
  }
}

// flutter packages pub run build_runner watch --delete-conflicting-outputs

class CountryStats {
  final List<Province> provinces;

  CountryStats(this.provinces, String iso2) {
    compute(iso2);
  }

  int confirmed = 0, deaths = 0, recovered = 0;
  double fatalityRate = 0.0;
  cc.CountryCode country;
  LatLngBounds bounds;

  compute(String iso2) {
    country = cc.CountryCode.fromCode(iso2);
    provinces.forEach((province) {
      // assert(province != null, 'Provinces returned null');

      confirmed += province.confirmed;
      deaths += province.deaths;
      recovered += province.recovered;
    });
  }

  @override
  String toString() => '''
    CountryStats(Name: ${country.name},Deaths: $deaths,Confirmed: $confirmed,Recovered: $recovered)
  ''';
}

class WorldStats {}
