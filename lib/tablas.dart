import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Tablas extends StatefulWidget {
  final List<Map<String, dynamic>> listadoDeDatos;
  Tablas({Key key, @required this.listadoDeDatos}) : super(key: key);

  @override
  _TablasState createState() => _TablasState();
}

class _TablasState extends State<Tablas> {
  var _columnas = List<DataColumn>();
  var _renglones = List<DataRow>();
  @override
  void initState() {
    _fillColumns();
    _fillRows();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: _columnas,
        rows: _renglones,
      ),
    );
  }

  // obtener nombre de columnas
  void _fillColumns() {
    // TODO
  }

  // obtener datos de renglones
  void _fillRows() {
    // TODO
  }
}
