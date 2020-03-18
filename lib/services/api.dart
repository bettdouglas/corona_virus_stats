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
      return (response.data as List).map((e) => Province.fromJson(e)).toList();
    } else {
      return null;
    }
  }
}