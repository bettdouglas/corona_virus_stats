library province;

import 'dart:convert';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:corona/models/models.dart';

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
  @nullable
  @BuiltValueField(wireName: 'countrycode')
  Countrycode get countrycode;
  @nullable
  @BuiltValueField(wireName: 'confirmed')
  int get confirmed;
  @nullable
  @BuiltValueField(wireName: 'deaths')
  int get deaths;
  @BuiltValueField(wireName: 'recovered')
  int get recovered;
  String toJson() {
    return json.encode(serializers.serializeWith(Province.serializer, this));
  }

  static Province fromJson(Map jsonString) {
    return serializers.deserializeWith(
        Province.serializer, jsonString);
  }

  static Serializer<Province> get serializer => _$provinceSerializer;
}