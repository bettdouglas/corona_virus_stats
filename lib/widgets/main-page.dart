import 'package:corona/services/store.dart';
import 'package:corona/utils/utils.dart';
import 'package:corona/widgets/stat-widget.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  final store = CoronaDataStore();

  @override
  Widget build(BuildContext context) {
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
          CountryCodePicker(
            showFlag: true,
            builder: (country) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(Icons.search,color: Colors.black,),
            ),
            enabled: true,
            showCountryOnly: false,
          ),
        ],
      ),
      backgroundColor: AppTheme.whitish,
      body: Container(
          color: AppTheme.whitish,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: StatContainer(
                  iconData: Icons.person,
                  statTitle: 'Confirmed Cases',
                  stat: '1000',
                  statColor: Color.fromRGBO(81, 45, 168, 1.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: StatContainer(
                  iconData: Icons.person,
                  statTitle: 'Recovered Cases',
                  stat: '1000',
                  statColor: Color.fromRGBO(0, 121, 107, 1.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: StatContainer(
                  iconData: Icons.person,
                  statTitle: 'Death Cases',
                  stat: '1000',
                  statColor: Color.fromRGBO(194, 24, 91, 1.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: StatContainer(
                  iconData: Icons.person,
                  statTitle: 'Confirmed Cases',
                  stat: '1000',
                  statColor: Color.fromRGBO(136, 14, 79, 1.0),
                ),
              )
            ],
          )),
    );
  }
}
