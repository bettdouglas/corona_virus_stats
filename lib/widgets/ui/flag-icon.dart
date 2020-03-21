
import 'package:country_code_picker/country_code.dart';
import 'package:flutter/material.dart';

class FlagIcon extends StatelessWidget {
  final CountryCode countryCode;

  const FlagIcon({Key key, this.countryCode}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(countryCode.flagUri,
          package: 'country_code_picker', width: 50),
    );
  }
}