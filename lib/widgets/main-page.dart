import 'package:corona/models/models.dart';
import 'package:corona/services/provider.dart';
import 'package:corona/utils/utils.dart';
import 'package:corona/widgets/ui/flag-icon.dart';
import 'package:corona/widgets/ui/grayed-out.dart';
import 'package:corona/widgets/ui/no-stats.dart';
import 'package:corona/widgets/ui/stat-widget.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong/latlong.dart';
import 'package:map_markers/map_markers.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  // final store = CoronaDataStore();

  @override
  Widget build(BuildContext context) {
    var dataStore = Provider.of<DataStore>(context);

    return Scaffold(
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
            child: FlagIcon(
              countryCode: DataStore.countryCode,
            ),
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
                options: MapOptions(
                    center: LatLng(43, 12.8),
                    zoom: 6,
                    onPositionChanged: (position, hasGesture) {
                      // print(position.zoom);
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
    );
  }

  void updateCountry(CountryCode country, DataStore store) {
    store.changeCountry(country);
    Observable(store.isFetching).observe((changenotif) {
      print('ValueChanged: ${changenotif.newValue}');
    });
  }

  Marker showPlaceMarker(Province province) {
    return Marker(
      point: LatLng(province.location.lat, province.location.lng),
      builder: (context) => BubbleMarker(
        bubbleColor: Colors.white,
        key: UniqueKey(),
        bubbleContentWidgetBuilder: (context) => Text('Province'),
        widgetBuilder: (context) => Icon(
          Icons.details,
          color: Colors.white,
        ),
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
        radius: 50);
  }
}

class GeneralStats extends StatelessWidget {
  const GeneralStats({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dataStore = Provider.of<DataStore>(context);

    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: dataStore.isFetching
              ? CircularProgressIndicator()
              : SizedBox(
                  height: 0,
                  width: 0,
                ),
        ),
        GrayedOut(
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: StatContainer(
                        iconData: Icons.person,
                        statTitle: 'Confirmed Cases',
                        stat: dataStore.countryStats.confirmed.toString(),
                        statColor: Color.fromRGBO(81, 45, 168, 1.0),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: StatContainer(
                        iconData: Icons.person,
                        statTitle: 'Recovered Cases',
                        stat: dataStore.countryStats.recovered.toString(),
                        statColor: Color.fromRGBO(0, 121, 107, 1.0),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: StatContainer(
                        iconData: Icons.person,
                        statTitle: 'Death Cases',
                        stat: dataStore.countryStats.deaths.toString(),
                        statColor: Color.fromRGBO(194, 24, 91, 1.0),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: StatContainer(
                        iconData: Icons.person,
                        statTitle: 'Fatality Rate',
                        stat: (dataStore.countryStats.confirmed != 0 &&
                                dataStore.countryStats.confirmed != null)
                            ? (((dataStore.countryStats.deaths /
                                            dataStore.countryStats.confirmed) *
                                        100)
                                    .toStringAsPrecision(3))
                                .toString()
                            : 'No Data',
                        statColor: Color.fromRGBO(136, 14, 79, 1.0),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          grayedOut: dataStore.isFetching,
        ),
      ],
    );
  }
}
