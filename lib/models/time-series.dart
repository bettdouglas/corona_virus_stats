import 'package:corona/models/country-stats.dart';

class TimeSeries {
  CountryStats countryStats;
  TimeSeries({
    this.countryStats,
    this.day,
    this.confirmed,
    this.deaths,
    this.recovered
  });

  DateTime day;
  int confirmed, deaths, recovered;

  @override
  String toString() => 'TimeSeries($countryStats,$day,$confirmed,$deaths,$recovered)';
}
