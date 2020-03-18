library serializers;

import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:corona/models/country_code.dart';
import 'package:corona/models/location.dart';
import 'package:corona/models/province.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  CountryCode,
  Location,
  Province
])
final Serializers serializers = (
    _$serializers.toBuilder()..addPlugin(new StandardJsonPlugin())
).build();