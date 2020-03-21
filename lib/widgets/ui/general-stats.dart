import 'package:corona/services/provider.dart';
import 'package:corona/widgets/ui/grayed-out.dart';
import 'package:corona/widgets/ui/stat-widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
              : SizedBox(height: 0, width: 0),
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
