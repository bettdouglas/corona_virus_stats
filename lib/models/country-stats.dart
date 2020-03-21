import 'package:corona/models/models.dart';
import 'package:country_code_picker/country_code_picker.dart' as cc;
import 'package:flutter_map/flutter_map.dart';

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
        if(province == null ) {
          print('Found a null object');
        }
      confirmed += province.confirmed ?? 0;
      deaths += province.deaths ?? 0;
      recovered += province.recovered ?? 0;
    });
  }

  @override
  String toString() => '''
    CountryStats(Name: ${country.name},Deaths: $deaths,Confirmed: $confirmed,Recovered: $recovered)
  ''';
}