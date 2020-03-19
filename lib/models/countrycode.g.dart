// GENERATED CODE - DO NOT MODIFY BY HAND

part of countrycode;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Countrycode> _$countrycodeSerializer = new _$CountrycodeSerializer();

class _$CountrycodeSerializer implements StructuredSerializer<Countrycode> {
  @override
  final Iterable<Type> types = const [Countrycode, _$Countrycode];
  @override
  final String wireName = 'Countrycode';

  @override
  Iterable<Object> serialize(Serializers serializers, Countrycode object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.iso2 != null) {
      result
        ..add('iso2')
        ..add(serializers.serialize(object.iso2,
            specifiedType: const FullType(String)));
    }
    if (object.iso3 != null) {
      result
        ..add('iso3')
        ..add(serializers.serialize(object.iso3,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Countrycode deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CountrycodeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'iso2':
          result.iso2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'iso3':
          result.iso3 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Countrycode extends Countrycode {
  @override
  final String iso2;
  @override
  final String iso3;

  factory _$Countrycode([void Function(CountrycodeBuilder) updates]) =>
      (new CountrycodeBuilder()..update(updates)).build();

  _$Countrycode._({this.iso2, this.iso3}) : super._();

  @override
  Countrycode rebuild(void Function(CountrycodeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CountrycodeBuilder toBuilder() => new CountrycodeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Countrycode && iso2 == other.iso2 && iso3 == other.iso3;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, iso2.hashCode), iso3.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Countrycode')
          ..add('iso2', iso2)
          ..add('iso3', iso3))
        .toString();
  }
}

class CountrycodeBuilder implements Builder<Countrycode, CountrycodeBuilder> {
  _$Countrycode _$v;

  String _iso2;
  String get iso2 => _$this._iso2;
  set iso2(String iso2) => _$this._iso2 = iso2;

  String _iso3;
  String get iso3 => _$this._iso3;
  set iso3(String iso3) => _$this._iso3 = iso3;

  CountrycodeBuilder();

  CountrycodeBuilder get _$this {
    if (_$v != null) {
      _iso2 = _$v.iso2;
      _iso3 = _$v.iso3;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Countrycode other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Countrycode;
  }

  @override
  void update(void Function(CountrycodeBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Countrycode build() {
    final _$result = _$v ?? new _$Countrycode._(iso2: iso2, iso3: iso3);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
