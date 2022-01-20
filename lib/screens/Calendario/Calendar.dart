import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  TimeOfDay _time = TimeOfDay.now();
  DateTime _dateTime = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (_time.minute != TimeOfDay.now().minute) {
        setState(() {
          _time = TimeOfDay.now();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Color getColor(
        int horaInicio, int minutoInicio, int horaFinal, int minutoFinal) {
      if (horaInicio * 60 + minutoInicio <= _time.hour * 60 + _time.minute &&
          horaFinal * 60 + minutoFinal > _time.hour * 60 + _time.minute) {
        return Colors.red;
      }
      return Colors.black;
    }

    Color getdayColor(int day) {
      if (_dateTime.weekday == day) {
        return Colors.green;
      }
      return Colors.black;
    }

    Color getassigColor(int horaInicio, int minutoInicio, int horaFinal,
        int minutoFinal, int day) {
      if (horaInicio * 60 + minutoInicio <= _time.hour * 60 + _time.minute &&
          horaFinal * 60 + minutoFinal > _time.hour * 60 + _time.minute &&
          _dateTime.weekday == day) {
        return Colors.red;
      }
      return Colors.black;
    }

    void prueba() {
      int I = 10;
      bool sigo = true;
      while (sigo) {
        // AQUI LLMAS A LAS FILAS

        I--;
        if (I == 0) {
          sigo = false;
        }
      }
    }

    ;

    return Container(
      child: Scaffold(
        appBar: AppBar(
            title: Text(
              'My Calendar',
            ),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushNamed(context, '1erLapso');
              },
            )),
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: DataTable(
                  columnSpacing: 0.1,
                  dataRowHeight: 53.5,
                  //sortColumnIndex: 5,
                  dividerThickness: 4,
                  horizontalMargin: 20,
                  showCheckboxColumn: false,
                  columns: [
                    DataColumn(label: Text('Hora')),
                    DataColumn(
                        label: Text('Lunes',
                            style: TextStyle(color: getdayColor(1)))),
                    DataColumn(
                        label: Text('Martes',
                            style: TextStyle(color: getdayColor(2)))),
                    DataColumn(
                        label: Text('Miercoles',
                            style: TextStyle(color: getdayColor(3)))),
                    DataColumn(
                        label: Text('Jueves',
                            style: TextStyle(color: getdayColor(4)))),
                    DataColumn(
                        label: Text('Viernes',
                            style: TextStyle(color: getdayColor(5)))),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Container(
                          //decoration: BoxDecoration(color: Colors.red),
                          //width: 20, //SET width
                          child: Text(
                        '7:30-8:15',
                        style: TextStyle(
                            fontSize: 12, color: getColor(7, 30, 8, 15)),
                      ))),
                      DataCell(Container(
                          //width: 20, //SET width
                          child: Text(
                        'Ingles',
                        style: TextStyle(
                            fontSize: 12,
                            color: getassigColor(7, 30, 8, 15, 1)),
                      ))),
                      DataCell(Container(
                          //width: 50, //SET width
                          child: Text(
                        'Orientacion',
                        style: TextStyle(
                            fontSize: 12,
                            color: getassigColor(7, 30, 8, 15, 2)),
                      ))),
                      DataCell(Container(
                          //width: 50, //SET width
                          child: Text(
                        'Venezuela',
                        style: TextStyle(
                            fontSize: 12,
                            color: getassigColor(7, 30, 8, 15, 3)),
                      ))),
                      DataCell(Container(
                          // width: 50, //SET width
                          child: Text(
                        'Ingles',
                        style: TextStyle(
                            fontSize: 12,
                            color: getassigColor(7, 30, 8, 15, 4)),
                      ))),
                      DataCell(Container(
                          // width: 50, //SET width
                          child: Text(
                        'Math',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12,
                            color: getassigColor(7, 30, 8, 15, 5)),
                      ))),
                    ]),
                    DataRow(cells: [
                      DataCell(Container(
                          //width: 20, //SET width
                          child: Text(
                        '8:15-9:00',
                        style: TextStyle(
                            fontSize: 12, color: getColor(8, 15, 9, 0)),
                      ))),
                      DataCell(Container(
                          //width: 20, //SET width
                          child: Text(
                        'Ingles',
                        style: TextStyle(
                            fontSize: 12, color: getassigColor(8, 15, 9, 0, 1)),
                      ))),
                      DataCell(Container(
                          //width: 50, //SET width
                          child: Text(
                        'Orientacion',
                        style: TextStyle(
                            fontSize: 12, color: getassigColor(8, 15, 9, 0, 2)),
                      ))),
                      DataCell(Container(
                          //width: 50, //SET width
                          child: Text(
                        'Venezuela',
                        style: TextStyle(
                            fontSize: 12, color: getassigColor(8, 15, 9, 0, 3)),
                      ))),
                      DataCell(Container(
                          // width: 50, //SET width
                          child: Text(
                        'Ingles',
                        style: TextStyle(
                            fontSize: 12, color: getassigColor(8, 15, 9, 0, 4)),
                      ))),
                      DataCell(Container(
                          // width: 50, //SET width
                          child: Text(
                        'Math',
                        style: TextStyle(
                            fontSize: 12, color: getassigColor(8, 15, 9, 0, 5)),
                      ))),
                    ]),
                    DataRow(cells: [
                      DataCell(Container(
                          //width: 20, //SET width
                          child: Text(
                        '9:00-9:45',
                        style: TextStyle(
                            fontSize: 12, color: getColor(9, 0, 9, 45)),
                      ))),
                      DataCell(Container(
                          //width: 20, //SET width
                          child: Text(
                        'Quimica',
                        style: TextStyle(
                            fontSize: 12, color: getassigColor(9, 0, 9, 45, 1)),
                      ))),
                      DataCell(Container(
                          //width: 50, //SET width
                          child: Text(
                        'Historia',
                        style: TextStyle(
                            fontSize: 12, color: getassigColor(9, 0, 9, 45, 2)),
                      ))),
                      DataCell(Container(
                          //width: 50, //SET width
                          child: Text(
                        'Ingles',
                        style: TextStyle(
                            fontSize: 12, color: getassigColor(9, 0, 9, 45, 3)),
                      ))),
                      DataCell(Container(
                          // width: 50, //SET width
                          child: Text(
                        'Historia',
                        style: TextStyle(
                            fontSize: 12, color: getassigColor(9, 0, 9, 45, 4)),
                      ))),
                      DataCell(Container(
                          // width: 50, //SET width
                          child: Text(
                        'Castellano',
                        style: TextStyle(
                            fontSize: 12, color: getassigColor(9, 0, 9, 45, 5)),
                      ))),
                    ]),
                    DataRow(cells: [
                      DataCell(Container(
                          //width: 20, //SET width
                          child: Text(
                        '9:45-10:00',
                        style: TextStyle(
                            fontSize: 12, color: getColor(9, 45, 10, 0)),
                      ))),
                      DataCell(Container(
                          //width: 20, //SET width
                          child: Text(
                        'Receso',
                        style: TextStyle(
                            fontSize: 12,
                            color: getassigColor(9, 45, 10, 0, 1)),
                      ))),
                      DataCell(Container(
                          //width: 50, //SET width
                          child: Text(
                        'Receso',
                        style: TextStyle(
                            fontSize: 12,
                            color: getassigColor(9, 45, 10, 0, 2)),
                      ))),
                      DataCell(Container(
                          //width: 50, //SET width
                          child: Text(
                        'Receso',
                        style: TextStyle(
                            fontSize: 12,
                            color: getassigColor(9, 45, 10, 0, 3)),
                      ))),
                      DataCell(Container(
                          // width: 50, //SET width
                          child: Text(
                        'Receso',
                        style: TextStyle(
                            fontSize: 12,
                            color: getassigColor(9, 45, 10, 0, 4)),
                      ))),
                      DataCell(Container(
                          // width: 50, //SET width
                          child: Text(
                        'Receso',
                        style: TextStyle(
                            fontSize: 12,
                            color: getassigColor(9, 45, 10, 0, 5)),
                      ))),
                    ]),
                    DataRow(cells: [
                      DataCell(Container(
                          //width: 20, //SET width
                          child: Text(
                        '10:00-10:45',
                        style: TextStyle(
                            fontSize: 12, color: getColor(10, 0, 10, 45)),
                      ))),
                      DataCell(Container(
                          //width: 20, //SET width
                          child: Text(
                        'Quimica',
                        style: TextStyle(
                            fontSize: 12,
                            color: getassigColor(10, 0, 10, 45, 1)),
                      ))),
                      DataCell(Container(
                          //width: 50, //SET width
                          child: Text(
                        'Castellano',
                        style: TextStyle(
                            fontSize: 12,
                            color: getassigColor(10, 0, 10, 45, 2)),
                      ))),
                      DataCell(Container(
                          //width: 50, //SET width
                          child: Text(
                        'Ingles',
                        style: TextStyle(
                            fontSize: 12,
                            color: getassigColor(10, 0, 10, 45, 3)),
                      ))),
                      DataCell(Container(
                          // width: 50, //SET width
                          child: Text(
                        'Historia',
                        style: TextStyle(
                            fontSize: 12,
                            color: getassigColor(10, 0, 10, 45, 4)),
                      ))),
                      DataCell(Container(
                          // width: 50, //SET width
                          child: Text(
                        'Fisica',
                        style: TextStyle(
                            fontSize: 12,
                            color: getassigColor(10, 0, 10, 45, 5)),
                      ))),
                    ]),
                    DataRow(cells: [
                      DataCell(Container(
                          //width: 20, //SET width
                          child: Text(
                        '10:45-11:30',
                        style: TextStyle(
                            fontSize: 12, color: getColor(10, 45, 11, 30)),
                      ))),
                      DataCell(Container(
                          //width: 20, //SET width
                          child: Text(
                        'Castellan',
                        style: TextStyle(
                            fontSize: 12,
                            color: getassigColor(10, 45, 11, 30, 1)),
                      ))),
                      DataCell(Container(
                          //width: 50, //SET width
                          child: Text(
                        'Ingles',
                        style: TextStyle(
                            fontSize: 12,
                            color: getassigColor(10, 45, 11, 30, 2)),
                      ))),
                      DataCell(Container(
                          //width: 50, //SET width
                          child: Text(
                        'Math',
                        style: TextStyle(
                            fontSize: 12,
                            color: getassigColor(10, 45, 11, 30, 3)),
                      ))),
                      DataCell(Container(
                          // width: 50, //SET width
                          child: Text(
                        'Biologia',
                        style: TextStyle(
                            fontSize: 12,
                            color: getassigColor(10, 45, 11, 30, 4)),
                      ))),
                      DataCell(Container(
                          // width: 50, //SET width
                          child: Text(
                        'Fisica',
                        style: TextStyle(
                            fontSize: 12,
                            color: getassigColor(10, 45, 11, 30, 5)),
                      ))),
                    ]),
                    DataRow(cells: [
                      DataCell(Container(
                          //width: 20, //SET width
                          child: Text(
                        '11:30-12:15',
                        style: TextStyle(
                            fontSize: 12, color: getColor(11, 30, 12, 15)),
                      ))),
                      DataCell(Container(
                          //width: 20, //SET width
                          child: Text(
                        'Castellano',
                        style: TextStyle(
                            fontSize: 12,
                            color: getassigColor(11, 30, 12, 15, 1)),
                      ))),
                      DataCell(Container(
                          //width: 50, //SET width
                          child: Text(
                        'Ingles',
                        style: TextStyle(
                            fontSize: 12,
                            color: getassigColor(11, 30, 12, 15, 2)),
                      ))),
                      DataCell(Container(
                          //width: 50, //SET width
                          child: Text(
                        'Math',
                        style: TextStyle(
                            fontSize: 12,
                            color: getassigColor(11, 30, 12, 15, 3)),
                      ))),
                      DataCell(Container(
                          // width: 50, //SET width
                          child: Text(
                        'Biologia',
                        style: TextStyle(
                            fontSize: 12,
                            color: getassigColor(11, 30, 12, 15, 4)),
                      ))),
                      DataCell(Container(
                          // width: 50, //SET width
                          child: Text(
                        'Quimica',
                        style: TextStyle(
                            fontSize: 12,
                            color: getassigColor(11, 30, 12, 15, 5)),
                      ))),
                    ]),
                    DataRow(cells: [
                      DataCell(Container(
                          //width: 20, //SET width
                          child: Text(
                        '12:15-12:45',
                        style: TextStyle(
                            fontSize: 12, color: getColor(12, 15, 12, 45)),
                      ))),
                      DataCell(Container(
                          //width: 20, //SET width
                          child: Text(
                        'Receso',
                        style: TextStyle(
                            fontSize: 12,
                            color: getassigColor(12, 15, 12, 45, 1)),
                      ))),
                      DataCell(Container(
                          //width: 50, //SET width
                          child: Text(
                        'Receso',
                        style: TextStyle(
                            fontSize: 12,
                            color: getassigColor(12, 15, 12, 45, 2)),
                      ))),
                      DataCell(Container(
                          //width: 50, //SET width
                          child: Text(
                        'Receso',
                        style: TextStyle(
                            fontSize: 12,
                            color: getassigColor(12, 15, 12, 45, 3)),
                      ))),
                      DataCell(Container(
                          // width: 50, //SET width
                          child: Text(
                        'Receso',
                        style: TextStyle(
                            fontSize: 12,
                            color: getassigColor(12, 15, 12, 45, 4)),
                      ))),
                      DataCell(Container(
                          // width: 50, //SET width
                          child: Text(
                        'Receso',
                        style: TextStyle(
                            fontSize: 12,
                            color: getassigColor(12, 15, 12, 45, 5)),
                      ))),
                    ]),
                    DataRow(cells: [
                      DataCell(Container(
                          //width: 20, //SET width
                          child: Text(
                        '12:45-1:30',
                        style: TextStyle(
                            fontSize: 12, color: getColor(12, 45, 13, 30)),
                      ))),
                      DataCell(Container(
                          //width: 20, //SET width
                          child: Text(
                        'Fisica',
                        style: TextStyle(
                            fontSize: 12,
                            color: getassigColor(12, 45, 13, 30, 1)),
                      ))),
                      DataCell(Container(
                          //width: 50, //SET width
                          child: Text(
                        'Math',
                        style: TextStyle(
                            fontSize: 12,
                            color: getassigColor(12, 45, 13, 30, 2)),
                      ))),
                      DataCell(Container(
                          //width: 50, //SET width
                          child: Text(
                        'Biologia',
                        style: TextStyle(
                            fontSize: 12,
                            color: getassigColor(12, 45, 13, 30, 3)),
                      ))),
                      DataCell(Container(
                          // width: 50, //SET width
                          child: Text(
                        'Laboratorio',
                        style: TextStyle(
                            fontSize: 12,
                            color: getassigColor(12, 45, 13, 30, 4)),
                      ))),
                      DataCell(Container(
                          // width: 50, //SET width
                          child: Text(
                        'Quimica',
                        style: TextStyle(
                            fontSize: 12,
                            color: getassigColor(12, 45, 13, 30, 5)),
                      ))),
                    ]),
                    DataRow(cells: [
                      DataCell(Container(
                          //width: 20, //SET width
                          child: Text(
                        '1:30-2:10',
                        style: TextStyle(
                            fontSize: 12, color: getColor(13, 30, 14, 10)),
                      ))),
                      DataCell(Container(
                          //width: 20, //SET width
                          child: Text(
                        'Fisica',
                        style: TextStyle(
                            fontSize: 12,
                            color: getassigColor(13, 30, 14, 10, 1)),
                      ))),
                      DataCell(Container(
                          //width: 50, //SET width
                          child: Text(
                        'Math',
                        style: TextStyle(
                            fontSize: 12,
                            color: getassigColor(13, 30, 14, 10, 2)),
                      ))),
                      DataCell(Container(
                          //width: 50, //SET width
                          child: Text(
                        'Biologia',
                        style: TextStyle(
                            fontSize: 12,
                            color: getassigColor(13, 30, 14, 10, 3)),
                      ))),
                      DataCell(Container(
                          // width: 50, //SET width
                          child: Text(
                        'Laboratorio',
                        style: TextStyle(
                            fontSize: 12,
                            color: getassigColor(13, 30, 14, 10, 4)),
                      ))),
                      DataCell(Container(
                          // width: 50, //SET width
                          child: Text(
                        'Deporte',
                        style: TextStyle(
                            fontSize: 12,
                            color: getassigColor(13, 30, 14, 10, 5)),
                      ))),
                    ])
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}





/*
padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 130),
              child: Table(columnWidths: {
                0: FractionColumnWidth(.25),
              }, children: [
                //Primer linea
                TableRow(children: [
                  TableCell(
                      child: Text(
                    'Hora',
                    textAlign: TextAlign.center,
                  )),
                  TableCell(
                    child: Text(
                      'Lunes',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  TableCell(
                      child: Text(
                    'Martes',
                    textAlign: TextAlign.center,
                  )),
                  TableCell(
                      child: Text(
                    'Miercoles',
                    textAlign: TextAlign.center,
                  )),
                  TableCell(
                      child: Text(
                    'Jueves',
                    textAlign: TextAlign.center,
                  )),
                  TableCell(
                      child: Text(
                    'Viernes',
                    textAlign: TextAlign.center,
                  )),
                ]),
                //Segunda linea
                TableRow(children: [
                  TableCell(
                      child: Text(
                    '7:30 - 8:15',
                    textAlign: TextAlign.center,
                  )),
                  TableCell(
                    child: Container(
                      decoration: BoxDecoration(color: Colors.green),
                      child: Text(
                        'Ingles',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  TableCell(
                      child: Text(
                    'Orientacion',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13, color: Colors.black),
                  )),
                  TableCell(
                      child: Text(
                    'Miercoles',
                    textAlign: TextAlign.center,
                  )),
                  TableCell(
                      child: Text(
                    'Jueves',
                    textAlign: TextAlign.center,
                  )),
                  TableCell(
                      child: Text(
                    'Viernes',
                    textAlign: TextAlign.center,
                  )),
                ]),
                //Tercera Linea
                TableRow(children: [
                  TableCell(
                      child: Text(
                    '8:15 - 9',
                    textAlign: TextAlign.center,
                  )),
                  TableCell(
                    child: Text(
                      'Lunes',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  TableCell(
                      child: Text(
                    'Martes',
                    textAlign: TextAlign.center,
                  )),
                  TableCell(
                      child: Text(
                    'Miercoles',
                    textAlign: TextAlign.center,
                  )),
                  TableCell(
                      child: Text(
                    'Jueves',
                    textAlign: TextAlign.center,
                  )),
                  TableCell(
                      child: Text(
                    'Viernes',
                    textAlign: TextAlign.center,
                  )),
                ]),
                //Cuarta linea
                TableRow(children: [
                  TableCell(
                      child: Text(
                    '9 - 9:45',
                    textAlign: TextAlign.center,
                  )),
                  TableCell(
                    child: Text(
                      'Lunes',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  TableCell(
                      child: Text(
                    'Martes',
                    textAlign: TextAlign.center,
                  )),
                  TableCell(
                      child: Text(
                    'Miercoles',
                    textAlign: TextAlign.center,
                  )),
                  TableCell(
                      child: Text(
                    'Jueves',
                    textAlign: TextAlign.center,
                  )),
                  TableCell(
                      child: Text(
                    'Viernes',
                    textAlign: TextAlign.center,
                  )),
                ]),
                //Quinta linea
                TableRow(children: [
                  TableCell(
                      child: Text(
                    '9:45-10',
                    textAlign: TextAlign.center,
                  )),
                  TableCell(
                    child: Text(
                      'Receso',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  TableCell(
                      child: Text(
                    'Receso',
                    textAlign: TextAlign.center,
                  )),
                  TableCell(
                      child: Text(
                    'Receso',
                    textAlign: TextAlign.center,
                  )),
                  TableCell(
                      child: Text(
                    'Receso',
                    textAlign: TextAlign.center,
                  )),
                  TableCell(
                      child: Text(
                    'Receso',
                    textAlign: TextAlign.center,
                  )),
                ]),
                //Sexta linea
                TableRow(children: [
                  TableCell(
                      child: Text(
                    '10 - 10:45',
                    textAlign: TextAlign.center,
                  )),
                  TableCell(
                    child: Text(
                      'Receso',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  TableCell(
                      child: Text(
                    'Receso',
                    textAlign: TextAlign.center,
                  )),
                  TableCell(
                      child: Text(
                    'Receso',
                    textAlign: TextAlign.center,
                  )),
                  TableCell(
                      child: Text(
                    'Receso',
                    textAlign: TextAlign.center,
                  )),
                  TableCell(
                      child: Text(
                    'Receso',
                    textAlign: TextAlign.center,
                  )),
                ]),
                //Septima Linea
                TableRow(children: [
                  TableCell(
                      child: Text(
                    '10:45-11:30',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  )),
                  TableCell(
                    child: Text(
                      'Lunes',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  TableCell(
                      child: Text(
                    'Martes',
                    textAlign: TextAlign.center,
                  )),
                  TableCell(
                      child: Text(
                    'Miercoles',
                    textAlign: TextAlign.center,
                  )),
                  TableCell(
                      child: Text(
                    'Jueves',
                    textAlign: TextAlign.center,
                  )),
                  TableCell(
                      child: Text(
                    'Viernes',
                    textAlign: TextAlign.center,
                  )),
                ]),
                //Octava Linea
                TableRow(children: [
                  TableCell(
                      child: Text(
                    '11:30-12:15',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  )),
                  TableCell(
                    child: Text(
                      'Lunes',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  TableCell(
                      child: Text(
                    'Martes',
                    textAlign: TextAlign.center,
                  )),
                  TableCell(
                      child: Text(
                    'Miercoles',
                    textAlign: TextAlign.center,
                  )),
                  TableCell(
                      child: Text(
                    'Jueves',
                    textAlign: TextAlign.center,
                  )),
                  TableCell(
                      child: Text(
                    'Viernes',
                    textAlign: TextAlign.center,
                  )),
                ]),
                //Novena linea
                TableRow(children: [
                  TableCell(
                      child: Text(
                    '12:15-12:45',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  )),
                  TableCell(
                    child: Text(
                      'Receso',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  TableCell(
                      child: Text(
                    'Receso',
                    textAlign: TextAlign.center,
                  )),
                  TableCell(
                      child: Text(
                    'Receso',
                    textAlign: TextAlign.center,
                  )),
                  TableCell(
                      child: Text(
                    'Receso',
                    textAlign: TextAlign.center,
                  )),
                  TableCell(
                      child: Text(
                    'Receso',
                    textAlign: TextAlign.center,
                  )),
                ]),
                //Decima linea
                TableRow(children: [
                  TableCell(
                      child: Text(
                    '12:45-1:30',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  )),
                  TableCell(
                    child: Text(
                      'Lunes',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  TableCell(
                      child: Text(
                    'Martes',
                    textAlign: TextAlign.center,
                  )),
                  TableCell(
                      child: Text(
                    'Miercoles',
                    textAlign: TextAlign.center,
                  )),
                  TableCell(
                      child: Text(
                    'Jueves',
                    textAlign: TextAlign.center,
                  )),
                  TableCell(
                      child: Text(
                    'Viernes',
                    textAlign: TextAlign.center,
                  )),
                ]),
                //Ultima linea
                TableRow(children: [
                  TableCell(
                      child: Text(
                    '1:30-2:10',
                    textAlign: TextAlign.center,
                  )),
                  TableCell(
                    child: Text(
                      'Lunes',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  TableCell(
                      child: Text(
                    'Martes',
                    textAlign: TextAlign.center,
                  )),
                  TableCell(
                      child: Text(
                    'Miercoles',
                    textAlign: TextAlign.center,
                  )),
                  TableCell(
                      child: Text(
                    'Jueves',
                    textAlign: TextAlign.center,
                  )),
                  TableCell(
                      child: Text(
                    'Viernes',
                    textAlign: TextAlign.center,
                  )),
                ]),
              ], border: TableBorder.all(width: 1, style: BorderStyle.solid)),
*/