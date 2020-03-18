import 'package:flutter/material.dart';

class StatContainer extends StatelessWidget {

  final IconData iconData;
  final String statTitle,stat;
  final Color statColor;

  const StatContainer({Key key, this.iconData, this.statTitle, this.stat,this.statColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: statColor,
        border: Border.all(
          color: Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(12.0)
      ),
      child: ListTile(
        leading: Icon(iconData,size: 40,),
        title: Text(statTitle),
        subtitle: Text(stat),
      )
    );
  }
}