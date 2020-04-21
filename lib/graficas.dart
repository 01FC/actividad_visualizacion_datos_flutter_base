import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Graficas extends StatefulWidget {
  final List<Map<String, dynamic>> listadoDeDatos;
  final bool showBarChart;
  Graficas({
    Key key,
    @required this.listadoDeDatos,
    @required this.showBarChart,
  }) : super(key: key);

  @override
  _GraficasState createState() => _GraficasState();
}

class _GraficasState extends State<Graficas> {
  @override
  Widget build(BuildContext context) {
    var _colors =
        charts.MaterialPalette.getOrderedPalettes(widget.listadoDeDatos.length);
    return _simple(_colors);
  }

  Widget _simple(dynamic _colors) {
    // TODO
  }
}

class _ChartObject {
  final String xAxis;
  final int yAxis;

  _ChartObject({@required this.xAxis, @required this.yAxis});
}
