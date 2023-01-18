import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as dart_ui;

///Package imports
import 'package:flutter/material.dart';


/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';
class ExportCircle extends StatefulWidget {
  const ExportCircle({super.key});

  @override
  State<ExportCircle> createState() => _ExportCircleState();
}

class _ExportCircleState extends State<ExportCircle> {
 late GlobalKey<SfCircularChartState> _circularChartKey;

  @override
  void initState() {
    _circularChartKey = GlobalKey();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
          Expanded(child: _buildCircularChart()),
          Container(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: <Widget>[
                  const Spacer(),
                  Container(
                      decoration: BoxDecoration(boxShadow: const <BoxShadow>[
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 4.0),
                          blurRadius: 4.0,
                        ),
                      ], ),
                      alignment: Alignment.center,
                      child: IconButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            behavior: SnackBarBehavior.floating,
                            duration: Duration(milliseconds: 100),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            content:
                                Text('Chart has been exported as PNG image'),
                          ));
                  
                        },
                        icon: const Icon(Icons.image, color: Colors.white),
                      )),
                  Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(boxShadow: const <BoxShadow>[
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 4.0),
                          blurRadius: 4.0,
                        ),
                      ], ),
                      alignment: Alignment.center,
                      child: IconButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            behavior: SnackBarBehavior.floating,
                            duration: Duration(milliseconds: 2000),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            content:
                                Text('Chart is being exported as PDF document'),
                          ));
                        
                        },
                        icon: const Icon(Icons.picture_as_pdf,
                            color: Colors.white),
                      )),
                ],
              ))
        ]));
  }

  /// Get default circular chart
  SfCircularChart _buildCircularChart() {
    return SfCircularChart(
      key: _circularChartKey,
      legend: Legend(
        isVisible: true,
        position: LegendPosition.bottom,
        overflowMode: LegendItemOverflowMode.wrap,
        iconBorderWidth: 1,
        iconBorderColor: Colors.black,
      ),
      title: ChartTitle(text: 'Online shopping frequency'),
      annotations: <CircularChartAnnotation>[
        CircularChartAnnotation(
            height: '55%',
            width: '55%',
            widget: SizedBox(
              height: 20,
              width: 20,
              child: Text('logo'),
            ))
      ],
      series: _getDefaultCircularSeries(),
    );
  }

  /// Get default circular series
  List<CircularSeries<ChartSampleData, String>> _getDefaultCircularSeries() {
    return <CircularSeries<ChartSampleData, String>>[
      DoughnutSeries<ChartSampleData, String>(
          dataSource: <ChartSampleData>[
            ChartSampleData(x: 'Once a month', y: 25, text: '25%'),
            ChartSampleData(x: 'Everyday', y: 4, text: '4%'),
            ChartSampleData(x: 'At least once a week', y: 14, text: '14%'),
            ChartSampleData(x: 'Once every 2-3 months', y: 10, text: '10%'),
            ChartSampleData(x: 'A few times a year', y: 15, text: '15%'),
            ChartSampleData(x: 'Less often than that', y: 7, text: '7%'),
            ChartSampleData(x: 'Never', y: 25, text: '25%'),
          ],
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          strokeColor:
              Colors.white
                 ,
          explode: true,
          strokeWidth: 1,
          legendIconType: LegendIconType.rectangle,
          dataLabelMapper: (ChartSampleData sales, _) => sales.text,
          dataLabelSettings: const DataLabelSettings(isVisible: true))
    ];
  }

}
///Chart sample data
class ChartSampleData {
  /// Holds the datapoint values like x, y, etc.,
  ChartSampleData(
      {this.x,
      this.y,
      this.xValue,
      this.yValue,
      this.secondSeriesYValue,
      this.thirdSeriesYValue,
      this.pointColor,
      this.size,
      this.text,
      this.open,
      this.close,
      this.low,
      this.high,
      this.volume});

  /// Holds x value of the datapoint
  final dynamic x;

  /// Holds y value of the datapoint
  final num? y;

  /// Holds x value of the datapoint
  final dynamic xValue;

  /// Holds y value of the datapoint
  final num? yValue;

  /// Holds y value of the datapoint(for 2nd series)
  final num? secondSeriesYValue;

  /// Holds y value of the datapoint(for 3nd series)
  final num? thirdSeriesYValue;

  /// Holds point color of the datapoint
  final Color? pointColor;

  /// Holds size of the datapoint
  final num? size;

  /// Holds datalabel/text value mapper of the datapoint
  final String? text;

  /// Holds open value of the datapoint
  final num? open;

  /// Holds close value of the datapoint
  final num? close;

  /// Holds low value of the datapoint
  final num? low;

  /// Holds high value of the datapoint
  final num? high;

  /// Holds open value of the datapoint
  final num? volume;
}