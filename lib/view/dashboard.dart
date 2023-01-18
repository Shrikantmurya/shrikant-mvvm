import 'package:flutter/material.dart';
import 'package:wepora/utils/color.dart';
import 'package:wepora/view_model/dashboard_view_model.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'dart:async';
import 'dart:math';

/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';

import '../res/widget/circlechart_widget.dart';
import '../res/widget/progressline_widget.dart';
import '../view_model/dashboard_view_model.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildSplineAreaChart(),
          SizedBox(height: 20,),
           Text(
            'Consumption',
            style: Theme.of(context).textTheme.headline1,
          ),
          //title, progcolor, value1, value2
          Padding(
            padding: EdgeInsets.all(20),
             child: Column(
              children: [
                ProgressLineWidget(title: 'Lights & Fixtures', progcolor: Color.fromARGB(255, 125, 137, 217), value: 160, total: 200),
                ProgressLineWidget(title: 'Lights & Fixtures', progcolor: Color.fromARGB(255, 225, 96, 99), value: 310, total: 400),
                ProgressLineWidget(title: 'Lights & Fixtures', progcolor: Color.fromARGB(255, 125, 217, 157), value: 800, total: 800),
                
              ],
             ),
            ),
           Stack(
            children: [
            //  ExportCircle()
            ],
           )
          ],
      ),
    );
  }

  /// Returns the cartesian spline are chart.
  SfCartesianChart _buildSplineAreaChart() {
    return SfCartesianChart(
      legend: Legend(isVisible: true, opacity: 0.7),
      title: ChartTitle(text: 'Generation And consumption Report', textStyle: Theme.of(context).textTheme.headline1) 
      ,
      plotAreaBorderWidth: 0,
      primaryXAxis: NumericAxis(
          interval: 1,
          majorGridLines: const MajorGridLines(width: 0),
          edgeLabelPlacement: EdgeLabelPlacement.shift),
      primaryYAxis: NumericAxis(
          labelFormat: '{value}%',
          axisLine: const AxisLine(width: 0),
          majorTickLines: const MajorTickLines(size: 0)),
      series: _getSplieAreaSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  List<_SplineAreaData>? chartData;

  @override
  void initState() {
    chartData = <_SplineAreaData>[
      _SplineAreaData(2010, 10.53, 3.3),
      _SplineAreaData(2011, 9.5, 5.4),
      _SplineAreaData(2012, 10, 2.65),
      _SplineAreaData(2013, 9.4, 2.62),
      _SplineAreaData(2014, 5.8, 1.99),
      _SplineAreaData(2015, 4.9, 1.44),
      _SplineAreaData(2016, 4.5, 2),
      _SplineAreaData(2017, 3.6, 1.56),
      _SplineAreaData(2018, 3.43, 2.1),
    ];
    super.initState();
  }

  /// Returns the list of chart series
  /// which need to render on the spline area chart.
  List<ChartSeries<_SplineAreaData, double>> _getSplieAreaSeries() {
    return <ChartSeries<_SplineAreaData, double>>[
      SplineAreaSeries<_SplineAreaData, double>(
        dataSource: chartData!,
        color: const Color.fromRGBO(75, 135, 185, 0.6),
        borderColor: const Color.fromRGBO(75, 135, 185, 1),
        borderWidth: 2,
        name: 'India',
        xValueMapper: (_SplineAreaData sales, _) => sales.year,
        yValueMapper: (_SplineAreaData sales, _) => sales.y1,
      ),
      SplineAreaSeries<_SplineAreaData, double>(
        dataSource: chartData!,
        borderColor: const Color.fromRGBO(192, 108, 132, 1),
        color: const Color.fromRGBO(192, 108, 132, 0.6),
        borderWidth: 2,
        name: 'China',
        xValueMapper: (_SplineAreaData sales, _) => sales.year,
        yValueMapper: (_SplineAreaData sales, _) => sales.y2,
      )
    ];
  }

  @override
  void dispose() {
    chartData!.clear();
    super.dispose();
  }
}

/// Private class for storing the spline area chart datapoints.
class _SplineAreaData {
  _SplineAreaData(this.year, this.y1, this.y2);
  final double year;
  final double y1;
  final double y2;
}
