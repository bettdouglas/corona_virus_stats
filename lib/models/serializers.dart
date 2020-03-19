library serializers;

import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:corona/models/countrycode.dart';
import 'package:corona/models/models.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  Countrycode,
  Location,
  Province
])
final Serializers serializers = (
    _$serializers.toBuilder()..addPlugin(new StandardJsonPlugin())
).build();