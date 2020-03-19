library countrycode;

import 'dart:convert';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:corona/models/models.dart';

part 'countrycode.g.dart';

abstract class Countrycode implements Built<Countrycode, CountrycodeBuilder> {
  Countrycode._();

  factory Countrycode([updates(CountrycodeBuilder b)]) = _$Countrycode;
  @nullable
  @BuiltValueField(wireName: 'iso2')
  String get iso2;
  @nullable
  @BuiltValueField(wireName: 'iso3')
  String get iso3;
  String toJson() {
    return json.encode(serializers.serializeWith(Countrycode.serializer, this));
  }

  static Countrycode fromJson(String jsonString) {
    return serializers.deserializeWith(
        Countrycode.serializer, json.decode(jsonString));
  }

  static Serializer<Countrycode> get serializer => _$countrycodeSerializer;
}