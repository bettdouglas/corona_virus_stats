import 'package:corona/widgets/ui/grayed-out.dart';
import 'package:corona/widgets/ui/stat-widget.dart';
import 'package:flutter/material.dart';

class NoStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
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
                          stat: 'Updating stats',
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
                          stat: 'Updating stats',
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
                          stat: 'Updating stats',
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
                          stat: 'Updating stats',
                          statColor: Color.fromRGBO(136, 14, 79, 1.0),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            grayedOut: true,
          ),
        ],
      ),
    );
  }
}