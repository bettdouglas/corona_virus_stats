// GENERATED CODE - DO NOT MODIFY BY HAND

part of country_code;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CountryCode> _$countryCodeSerializer = new _$CountryCodeSerializer();

class _$CountryCodeSerializer implements StructuredSerializer<CountryCode> {
  @override
  final Iterable<Type> types = const [CountryCode, _$CountryCode];
  @override
  final String wireName = 'CountryCode';

  @override
  Iterable<Object> serialize(Serializers serializers, CountryCode object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'iso2',
      serializers.serialize(object.iso2, specifiedType: const FullType(String)),
      'iso3',
      serializers.serialize(object.iso3, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  CountryCode deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CountryCodeBuilder();

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

class _$CountryCode extends CountryCode {
  @override
  final String iso2;
  @override
  final String iso3;

  factory _$CountryCode([void Function(CountryCodeBuilder) updates]) =>
      (new CountryCodeBuilder()..update(updates)).build();

  _$CountryCode._({this.iso2, this.iso3}) : super._() {
    if (iso2 == null) {
      throw new BuiltValueNullFieldError('CountryCode', 'iso2');
    }
    if (iso3 == null) {
      throw new BuiltValueNullFieldError('CountryCode', 'iso3');
    }
  }

  @override
  CountryCode rebuild(void Function(CountryCodeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CountryCodeBuilder toBuilder() => new CountryCodeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CountryCode && iso2 == other.iso2 && iso3 == other.iso3;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, iso2.hashCode), iso3.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CountryCode')
          ..add('iso2', iso2)
          ..add('iso3', iso3))
        .toString();
  }
}

class CountryCodeBuilder implements Builder<CountryCode, CountryCodeBuilder> {
  _$CountryCode _$v;

  String _iso2;
  String get iso2 => _$this._iso2;
  set iso2(String iso2) => _$this._iso2 = iso2;

  String _iso3;
  String get iso3 => _$this._iso3;
  set iso3(String iso3) => _$this._iso3 = iso3;

  CountryCodeBuilder();

  CountryCodeBuilder get _$this {
    if (_$v != null) {
      _iso2 = _$v.iso2;
      _iso3 = _$v.iso3;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CountryCode other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CountryCode;
  }

  @override
  void update(void Function(CountryCodeBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CountryCode build() {
    final _$result = _$v ?? new _$CountryCode._(iso2: iso2, iso3: iso3);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
