library country_code;

import 'dart:convert';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'models.dart';

part 'country_code.g.dart';

abstract class CountryCode implements Built<CountryCode, CountryCodeBuilder> {
  CountryCode._();

  factory CountryCode([updates(CountryCodeBuilder b)]) = _$CountryCode;

  @BuiltValueField(wireName: 'iso2')
  String get iso2;
  @BuiltValueField(wireName: 'iso3')
  String get iso3;
  String toJson() {
    return json.encode(serializers.serializeWith(CountryCode.serializer, this));
  }

  static CountryCode fromJson(String jsonString) {
    return serializers.deserializeWith(
        CountryCode.serializer, json.decode(jsonString));
  }

  static Serializer<CountryCode> get serializer => _$countryCodeSerializer;
}