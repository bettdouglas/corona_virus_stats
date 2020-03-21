import 'package:corona/models/models.dart';
import 'package:corona/services/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraphStats extends StatelessWidget {
  final List<TimeSeries> series;

  GraphStats(this.series);

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<CountryStore>(context);
    var data = series.reversed.take(30).toList();

    return Container(
      height: 300,
      padding: EdgeInsets.all(12),
      child: store.isUpdating
          ? SpinKitWanderingCubes(
              size: 90,
              color: Colors.orangeAccent,
            )
          : SfCartesianChart(
              title: ChartTitle(
                text: 'Monthly Stats',
                alignment: ChartAlignment.center,
                textStyle: ChartTextStyle(
                  fontSize: 14,
                  color: Colors.black45,
                ),
              ),
              primaryXAxis: DateTimeAxis(
                intervalType: DateTimeIntervalType.days,
                associatedAxisName: 'Day',
                name: 'Day',
              ),
              primaryYAxis: NumericAxis(
                isVisible: true,
                title: AxisTitle(
                  text: 'Deaths',
                ),
              ),
              tooltipBehavior: TooltipBehavior(
                enable: true,
                activationMode: ActivationMode.singleTap,
                color: Color(0xff46B2AE),
                header: 'Cases',
              ),
              legend: Legend(
                alignment: ChartAlignment.center,
                position: LegendPosition.bottom,
                isVisible: true,
                isResponsive: true,
                legendItemBuilder: (legendText, series, point, seriesIndex) {
                  return Chip(
                    label: Text(legendText),
                    avatar: Icon(
                      getIcon(legendText),
                      color: Colors.deepOrangeAccent,
                    ),
                    labelPadding: EdgeInsets.only(right: 3),
                    backgroundColor: Colors.transparent,
                    padding: EdgeInsets.zero,
                  );
                },
              ),
              series: <ChartSeries>[
                // ColumnSeries<TimeSeries,DateTime>(
                //   dataSource: series.reversed.take(7).toList(),
                //   xValueMapper: (TimeSeries series,_) => series.day,
                //   yValueMapper: (TimeSeries series,_) => series.confirmed,
                //   color: Colors.black,
                //   isVisible: true,
                // )
                LineSeries<TimeSeries, DateTime>(
                  dataSource: data,
                  xValueMapper: (TimeSeries series, _) => series.day,
                  yValueMapper: (TimeSeries series, _) => series.confirmed,
                  name: 'Confirmed',
                  markerSettings: MarkerSettings(
                    isVisible: true,
                    color: Color(0xffd1dded),
                  ),
                  color: getColor('Confirmed'),
                  isVisibleInLegend: true,
                ),
                LineSeries<TimeSeries, DateTime>(
                  dataSource: data,
                  xValueMapper: (TimeSeries series, _) => series.day,
                  yValueMapper: (TimeSeries series, _) => series.deaths,
                  name: 'Deaths',
                  color: getColor('Deaths'),
                ),
                LineSeries<TimeSeries, DateTime>(
                  dataSource: data,
                  xValueMapper: (TimeSeries series, _) => series.day,
                  yValueMapper: (TimeSeries series, _) => series.recovered,
                  name: 'Recovered',
                  color: getColor('Recovered'),
                )
              ],
            ),
    );
  }

  IconData getIcon(String text) {
    switch (text) {
      case 'Recovered':
        return Icons.local_hospital;
        break;
      case 'Deaths':
        return Icons.local_hotel;
        break;
      case 'Confirmed':
        return Icons.report;
        break;
      default:
        return Icons.graphic_eq;
    }
  }

  Color getColor(String text) {
    switch (text) {
      case 'Recovered':
        return Colors.orange;
        break;
      case 'Deaths':
        return Colors.red;
        break;
      case 'Confirmed':
        return Colors.teal;
        break;
      default:
        return Colors.deepOrangeAccent;
    }
  }
}
