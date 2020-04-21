import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visualizar_datos/graficas.dart';
import 'package:visualizar_datos/tablas.dart';

import 'bloc/home_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => HomeBloc()..add(ShowDataTableEvent()),
        child: MyHomePage(title: 'Visualizar datos Flutter'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            tooltip: "Tabla",
            icon: Icon(Icons.table_chart),
            onPressed: () =>
                BlocProvider.of<HomeBloc>(context).add(ShowDataTableEvent()),
          ),
          IconButton(
            tooltip: "Barras",
            icon: Icon(Icons.insert_chart),
            onPressed: () {
              BlocProvider.of<HomeBloc>(context).add(
                ShowChartsEvent(showAsBarChart: true),
              );
            },
          ),
          IconButton(
            tooltip: "Pay",
            icon: Icon(Icons.pie_chart),
            onPressed: () {
              BlocProvider.of<HomeBloc>(context).add(
                ShowChartsEvent(showAsBarChart: false),
              );
            },
          )
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is DataTableState)
            return Tablas(listadoDeDatos: state.listaDatos);
          else if (state is ChartsState)
            return Graficas(
              listadoDeDatos: state.listaDatos,
              showBarChart: state.showAsBarChart,
            );

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
