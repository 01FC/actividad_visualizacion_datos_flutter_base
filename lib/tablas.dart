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
    // TODO: Ordenar, en la Column indicar alguna funcion para ordenar, onSort:
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        sortColumnIndex: 0,
        columns: _columnas,
        rows: _renglones,
      ),
    );
  }

  // obtener nombre de columnas
  void _fillColumns() {
    _columnas = widget.listadoDeDatos[0].entries
        .map(
          (item) => DataColumn(
            label: Text("${item.key}"),
          ),
        )
        .toList();
  }

  // obtener datos de renglones
  void _fillRows() {
    for (var item in widget.listadoDeDatos) {
      List<DataCell> celdas = item.entries
          .map(
            (entry) => DataCell(
              entry.key == "color"
                  ? Container(
                      height: 8,
                      width: 8,
                      color: Color(int.parse("${entry.value}")),
                    )
                  : Text("${entry.value}"),
            ),
          )
          .toList();
      _renglones.add(DataRow(cells: celdas));
    }
  }
}
