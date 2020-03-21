import 'dart:convert';

import 'package:corona/models/models.dart';
import 'package:dio/dio.dart';

class NetCalls {

  Dio connector;

  NetCalls(){
    connector = Dio();
  }

  Future<List<Province>> getCountryCases(String iso2) async {

    var response = await connector.get('https://wuhan-coronavirus-api.laeyoung.endpoint.ainize.ai/jhu-edu/latest?iso2=$iso2');
    if(response.statusCode == 200) {
      var list = jsonDecode(response.data) as List;
      return list.map((e) => Province.fromJson(e)).toList();
    } else {
      return null;
    }
  }

  Future<List<Province>> getWorldCases() async {
    var response = await connector.get('https://wuhan-coronavirus-api.laeyoung.endpoint.ainize.ai/jhu-edu/latest');
    if(response.statusCode == 200) {
      var list = jsonDecode(response.data) as List;
      return list.map((e) => Province.fromJson(e)).toList();
    } else {
      return null;
    }
  }

    Future<List<TimeSeries>> getCountryTimeSeries(String iso2) async {
    var response = await connector.get('https://wuhan-coronavirus-api.laeyoung.endpoint.ainize.ai/jhu-edu/timeseries?iso2=$iso2');
    if(response.statusCode == 200) {
      var resp = jsonDecode(response.data) as List;
      print(resp.length);
      var dateKeys = resp[0]['timeseries'] as Map<String,dynamic>;
      List<TimeSeries> series = [];
      dateKeys.entries.forEach((element) {
        var ls = element.key.split('/');
        var year = '20' + ls[2].toString();
        var date = DateTime(int.parse(year),int.parse(ls[0]),int.parse(ls[1]));
        series.add(TimeSeries(
          day: date,
          confirmed: element.value['confirmed'],
          deaths: element.value['deaths'],
          recovered: element.value['recovered'],
          countryStats: null,
        ));
      });
      return series;
    } else {
      return null;
    }
  }
}
