import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  List<Map<String, dynamic>> get datos => [
        {
          "cantidad": 1,
          "producto": "Arbol",
          "descripcion": "Arbol frutal",
          "color": "0xff32a852",
          "altura": 3.5
        },
        {
          "cantidad": 6,
          "producto": "Plantas",
          "descripcion": "Rosa",
          "color": "0xffeb0e49",
          "altura": 0.5
        },
        {
          "cantidad": 1,
          "producto": "Moras",
          "descripcion": "Arbusto de Blue berry",
          "color": "0xff6532a8",
          "altura": 3.1
        },
        {
          "cantidad": 3,
          "producto": "Cilantro",
          "descripcion": "Kg",
          "color": "0xff4ea832",
          "altura": 0.2
        },
        {
          "cantidad": 3,
          "producto": "Flores",
          "descripcion": "Girasol",
          "color": "0xfff7db68",
          "altura": 1.5
        },
        {
          "cantidad": 2,
          "producto": "Naranja",
          "descripcion": "Arbol de naranjas",
          "color": "0xfff07b0e",
          "altura": 3.0
        }
      ];
  @override
  HomeState get initialState => HomeInitial();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is ShowDataTableEvent) {
      yield DataTableState(listaDatos: datos);
    } else if (event is ShowChartsEvent) {
      yield ChartsState(
        listaDatos: datos,
        showAsBarChart: event.showAsBarChart,
      );
    }
  }
}
