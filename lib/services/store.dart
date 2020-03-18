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
  cc.CountryCode countryCode = cc.CountryCode.fromCode('US');

  @observable
  ObservableFuture<List<Province>> provinces;

  @action 
  Future fetchLatest() => provinces = ObservableFuture(_api.getCountryCases(countryCode.code));

  @computed

}

class CountryStats {
  final List<Province> provinces;

  CountryStats(this.provinces);

  int confirmed,deaths,recovered = 0;
  cc.CountryCode country;
  LatLngBounds bounds;

  compute() {
    provinces.forEach((province) {
      confirmed += province.confirmed;
      deaths += province.deaths;
      recovered += province.recovered;
      country = cc.CountryCode.fromCode(province.countryCode.iso2);
      
    });
  }

}