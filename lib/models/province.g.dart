// GENERATED CODE - DO NOT MODIFY BY HAND

part of province;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Province> _$provinceSerializer = new _$ProvinceSerializer();

class _$ProvinceSerializer implements StructuredSerializer<Province> {
  @override
  final Iterable<Type> types = const [Province, _$Province];
  @override
  final String wireName = 'Province';

  @override
  Iterable<Object> serialize(Serializers serializers, Province object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'provincestate',
      serializers.serialize(object.provincestate,
          specifiedType: const FullType(String)),
      'countryregion',
      serializers.serialize(object.countryregion,
          specifiedType: const FullType(String)),
      'lastupdate',
      serializers.serialize(object.lastupdate,
          specifiedType: const FullType(String)),
      'location',
      serializers.serialize(object.location,
          specifiedType: const FullType(Location)),
    ];
    if (object.countrycode != null) {
      result
        ..add('countrycode')
        ..add(serializers.serialize(object.countrycode,
            specifiedType: const FullType(Countrycode)));
    }
    if (object.confirmed != null) {
      result
        ..add('confirmed')
        ..add(serializers.serialize(object.confirmed,
            specifiedType: const FullType(int)));
    }
    if (object.deaths != null) {
      result
        ..add('deaths')
        ..add(serializers.serialize(object.deaths,
            specifiedType: const FullType(int)));
    }
    if (object.recovered != null) {
      result
        ..add('recovered')
        ..add(serializers.serialize(object.recovered,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  Province deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProvinceBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'provincestate':
          result.provincestate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'countryregion':
          result.countryregion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'lastupdate':
          result.lastupdate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'location':
          result.location.replace(serializers.deserialize(value,
              specifiedType: const FullType(Location)) as Location);
          break;
        case 'countrycode':
          result.countrycode.replace(serializers.deserialize(value,
              specifiedType: const FullType(Countrycode)) as Countrycode);
          break;
        case 'confirmed':
          result.confirmed = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'deaths':
          result.deaths = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'recovered':
          result.recovered = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$Province extends Province {
  @override
  final String provincestate;
  @override
  final String countryregion;
  @override
  final String lastupdate;
  @override
  final Location location;
  @override
  final Countrycode countrycode;
  @override
  final int confirmed;
  @override
  final int deaths;
  @override
  final int recovered;

  factory _$Province([void Function(ProvinceBuilder) updates]) =>
      (new ProvinceBuilder()..update(updates)).build();

  _$Province._(
      {this.provincestate,
      this.countryregion,
      this.lastupdate,
      this.location,
      this.countrycode,
      this.confirmed,
      this.deaths,
      this.recovered})
      : super._() {
    if (provincestate == null) {
      throw new BuiltValueNullFieldError('Province', 'provincestate');
    }
    if (countryregion == null) {
      throw new BuiltValueNullFieldError('Province', 'countryregion');
    }
    if (lastupdate == null) {
      throw new BuiltValueNullFieldError('Province', 'lastupdate');
    }
    if (location == null) {
      throw new BuiltValueNullFieldError('Province', 'location');
    }
  }

  @override
  Province rebuild(void Function(ProvinceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProvinceBuilder toBuilder() => new ProvinceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Province &&
        provincestate == other.provincestate &&
        countryregion == other.countryregion &&
        lastupdate == other.lastupdate &&
        location == other.location &&
        countrycode == other.countrycode &&
        confirmed == other.confirmed &&
        deaths == other.deaths &&
        recovered == other.recovered;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc(0, provincestate.hashCode),
                                countryregion.hashCode),
                            lastupdate.hashCode),
                        location.hashCode),
                    countrycode.hashCode),
                confirmed.hashCode),
            deaths.hashCode),
        recovered.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Province')
          ..add('provincestate', provincestate)
          ..add('countryregion', countryregion)
          ..add('lastupdate', lastupdate)
          ..add('location', location)
          ..add('countrycode', countrycode)
          ..add('confirmed', confirmed)
          ..add('deaths', deaths)
          ..add('recovered', recovered))
        .toString();
  }
}

class ProvinceBuilder implements Builder<Province, ProvinceBuilder> {
  _$Province _$v;

  String _provincestate;
  String get provincestate => _$this._provincestate;
  set provincestate(String provincestate) =>
      _$this._provincestate = provincestate;

  String _countryregion;
  String get countryregion => _$this._countryregion;
  set countryregion(String countryregion) =>
      _$this._countryregion = countryregion;

  String _lastupdate;
  String get lastupdate => _$this._lastupdate;
  set lastupdate(String lastupdate) => _$this._lastupdate = lastupdate;

  LocationBuilder _location;
  LocationBuilder get location => _$this._location ??= new LocationBuilder();
  set location(LocationBuilder location) => _$this._location = location;

  CountrycodeBuilder _countrycode;
  CountrycodeBuilder get countrycode =>
      _$this._countrycode ??= new CountrycodeBuilder();
  set countrycode(CountrycodeBuilder countrycode) =>
      _$this._countrycode = countrycode;

  int _confirmed;
  int get confirmed => _$this._confirmed;
  set confirmed(int confirmed) => _$this._confirmed = confirmed;

  int _deaths;
  int get deaths => _$this._deaths;
  set deaths(int deaths) => _$this._deaths = deaths;

  int _recovered;
  int get recovered => _$this._recovered;
  set recovered(int recovered) => _$this._recovered = recovered;

  ProvinceBuilder();

  ProvinceBuilder get _$this {
    if (_$v != null) {
      _provincestate = _$v.provincestate;
      _countryregion = _$v.countryregion;
      _lastupdate = _$v.lastupdate;
      _location = _$v.location?.toBuilder();
      _countrycode = _$v.countrycode?.toBuilder();
      _confirmed = _$v.confirmed;
      _deaths = _$v.deaths;
      _recovered = _$v.recovered;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Province other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Province;
  }

  @override
  void update(void Function(ProvinceBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Province build() {
    _$Province _$result;
    try {
      _$result = _$v ??
          new _$Province._(
              provincestate: provincestate,
              countryregion: countryregion,
              lastupdate: lastupdate,
              location: location.build(),
              countrycode: _countrycode?.build(),
              confirmed: confirmed,
              deaths: deaths,
              recovered: recovered);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'location';
        location.build();
        _$failedField = 'countrycode';
        _countrycode?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Province', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
