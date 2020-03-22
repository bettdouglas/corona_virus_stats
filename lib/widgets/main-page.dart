import 'package:corona/models/models.dart';
import 'package:corona/services/provider.dart';
import 'package:corona/utils/utils.dart';
import 'package:corona/widgets/ui/flag-icon.dart';
import 'package:corona/widgets/ui/general-stats.dart';
import 'package:corona/widgets/ui/no-stats.dart';
import 'package:corona/widgets/ui/stats-graph.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong/latlong.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  // final store = CoronaDataStore();
  final MapController controller = MapController();
  @override
  Widget build(BuildContext context) {
    var dataStore = Provider.of<DataStore>(context);

    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.white,
          elevation: 0,
          title: Text(
            'Corona Virus Stats',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: dataStore.isCountrySelected ? FlagIcon(
                countryCode: DataStore.countryCode,
              ) : Image.asset('assets/icon.png',width: 50,),
            ),
            CountryCodePicker(
              showFlag: true,
              builder: (country) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
              onChanged: (cde) => updateCountry(cde, dataStore),
              enabled: true,
              showCountryOnly: false,
            ),
          ],
        ),
        backgroundColor: AppTheme.whitish,
        body: Container(
          color: AppTheme.whitish,
          child: Column(
            children: <Widget>[
              Container(
                child: dataStore.isFetching ? NoStats() : GeneralStats(),
              ),
              Expanded(
                child: FlutterMap(
                  mapController: controller,
                  options: MapOptions(
                      center: LatLng(43, 12.8),
                      zoom: 2,
                      onPositionChanged: (position, hasGesture) {
                        print(position.zoom);
                      },
                      plugins: [MarkerClusterPlugin()]),
                  layers: [
                    TileLayerOptions(
                      urlTemplate:
                          "https://api.mapbox.com/styles/v1/mapbox/dark-v10/tiles/512/{z}/{x}/{y}?access_token={accessToken}",
                      additionalOptions: {
                        'accessToken':
                            'pk.eyJ1IjoiYmV0dGRvdWdpZSIsImEiOiJjaml4MzlieGcyM25yM3JvM3JjMWs0bzB3In0.o339es_Y4jOFIjIH_n38Lg',
                      },
                      tileProvider: CachedNetworkTileProvider()
                    ),
                    // MarkerLayerOptions(
                    //   markers: dataStore.isFetching
                    //       ? []
                    //       : dataStore.provinces
                    //           .map((e) => showPlaceMarker(e))
                    //           .toList(),
                    // ),
                    MarkerClusterLayerOptions(
                      maxClusterRadius: 60,
                      size: Size(40, 40),
                      fitBoundsOptions: FitBoundsOptions(
                        padding: EdgeInsets.all(50),
                      ),
                      markers: dataStore.isFetching
                          ? []
                          : dataStore.provinces
                              .map((e) => showPlaceMarker(e))
                              .toList(),
                      builder: (context, markers) => FloatingActionButton(
                        onPressed: null,
                        backgroundColor: Colors.cyanAccent.withOpacity(0.3),
                        child: Text(markers.length.toString()),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await dataStore.fetchLatest();
          },
          child: Icon(Icons.public),
        ),
      ),
    );
  }

  void zoomToCountry(
      CountryCode country, MapController controller, DataStore store) async {
    var province = store.provinces
        .where((e) => e.countrycode != null)
        .firstWhere((element) => element.countrycode.iso2 == country.code,
            orElse: () => null);
    if (province != null) {
      controller.move(LatLng(province.location.lat, province.location.lng), 5);
    }
    // } else {
    //   await store.changeCountry(country);
    // }
  }

  void updateCountry(CountryCode country, DataStore store) {
    store.changeCountry(country);
    zoomToCountry(country, controller, store);
  }

  Marker showPlaceMarker(Province province) {
    return Marker(
      point: LatLng(province.location.lat, province.location.lng),
      builder: (context) => InkWell(
        child: Icon(
          Icons.details,
          color: Colors.white,
        ),
        onTap: () {
          showCountryGraph(province, context);
        },
      ),
      height: 150,
      width: 100,
    );
  }

  CircleMarker showCircleMarker(Province province) {
    return CircleMarker(
      borderColor: Colors.redAccent,
      borderStrokeWidth: 1,
      color: Colors.white54,
      point: LatLng(province.location.lat, province.location.lng),
      radius: 50,
    );
  }

  void showCountryGraph(Province province, BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ChangeNotifierProvider<CountryStore>(
          create: (_) => CountryStore(province),
          child: Consumer<CountryStore>(
            builder: (context, store, _) => BottomSheet(
              elevation: 20,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              clipBehavior: Clip.hardEdge,
              builder: (context) => GraphStats(store.series, province),
              onClosing: () {
                store.dispose();
              },
            ),
          ),
        );
      },
    );
  }
}
