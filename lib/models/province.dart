library province;

import 'dart:convert';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:corona/models/country_code.dart';
import 'package:corona/models/location.dart';
import 'models.dart';

part 'province.g.dart';

abstract class Province implements Built<Province, ProvinceBuilder> {
  Province._();

  factory Province([updates(ProvinceBuilder b)]) = _$Province;

  @BuiltValueField(wireName: 'provincestate')
  String get provincestate;
  @BuiltValueField(wireName: 'countryregion')
  String get countryregion;
  @BuiltValueField(wireName: 'lastupdate')
  String get lastupdate;
  @BuiltValueField(wireName: 'location')
  Location get location;
  @BuiltValueField(wireName: 'countrycode')
  CountryCode get countryCode;
  @BuiltValueField(wireName: 'confirmed')
  int get confirmed;
  @BuiltValueField(wireName: 'deaths')
  int get deaths;
  @BuiltValueField(wireName: 'recovered')
  int get recovered;
  String toJson() {
    return json.encode(serializers.serializeWith(Province.serializer, this));
  }

  static Province fromJson(String jsonString) {
    return serializers.deserializeWith(
        Province.serializer, json.decode(jsonString));
  }

  static Serializer<Province> get serializer => _$provinceSerializer;
}

