// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CoronaDataStore on _CoronaDataStore, Store {
  Computed<CountryStats> _$countryStatsComputed;

  @override
  CountryStats get countryStats => (_$countryStatsComputed ??=
          Computed<CountryStats>(() => super.countryStats))
      .value;

  final _$countryCodeAtom = Atom(name: '_CoronaDataStore.countryCode');

  @override
  cc.CountryCode get countryCode {
    _$countryCodeAtom.context.enforceReadPolicy(_$countryCodeAtom);
    _$countryCodeAtom.reportObserved();
    return super.countryCode;
  }

  @override
  set countryCode(cc.CountryCode value) {
    _$countryCodeAtom.context.conditionallyRunInAction(() {
      super.countryCode = value;
      _$countryCodeAtom.reportChanged();
    }, _$countryCodeAtom, name: '${_$countryCodeAtom.name}_set');
  }

  final _$isFetchingAtom = Atom(name: '_CoronaDataStore.isFetching');

  @override
  bool get isFetching {
    _$isFetchingAtom.context.enforceReadPolicy(_$isFetchingAtom);
    _$isFetchingAtom.reportObserved();
    return super.isFetching;
  }

  @override
  set isFetching(bool value) {
    _$isFetchingAtom.context.conditionallyRunInAction(() {
      super.isFetching = value;
      _$isFetchingAtom.reportChanged();
    }, _$isFetchingAtom, name: '${_$isFetchingAtom.name}_set');
  }

  final _$provincesAtom = Atom(name: '_CoronaDataStore.provinces');

  @override
  List<Province> get provinces {
    _$provincesAtom.context.enforceReadPolicy(_$provincesAtom);
    _$provincesAtom.reportObserved();
    return super.provinces;
  }

  @override
  set provinces(List<Province> value) {
    _$provincesAtom.context.conditionallyRunInAction(() {
      super.provinces = value;
      _$provincesAtom.reportChanged();
    }, _$provincesAtom, name: '${_$provincesAtom.name}_set');
  }

  final _$fetchLatestAsyncAction = AsyncAction('fetchLatest');

  @override
  Future<dynamic> fetchLatest() {
    return _$fetchLatestAsyncAction.run(() => super.fetchLatest());
  }

  final _$_CoronaDataStoreActionController =
      ActionController(name: '_CoronaDataStore');

  @override
  void changeCountry(cc.CountryCode code) {
    final _$actionInfo = _$_CoronaDataStoreActionController.startAction();
    try {
      return super.changeCountry(code);
    } finally {
      _$_CoronaDataStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'countryCode: ${countryCode.toString()},isFetching: ${isFetching.toString()},provinces: ${provinces.toString()},countryStats: ${countryStats.toString()}';
    return '{$string}';
  }
}
