import 'package:app_jefferson/screens/Exponent/SendGmail/SendGmailScreen.dart';
import 'package:flutter/material.dart';

class PrimerLapso extends StatefulWidget {
  const PrimerLapso({Key? key}) : super(key: key);

  @override
  _PrimerLapsoState createState() => _PrimerLapsoState();
}

class _PrimerLapsoState extends State<PrimerLapso> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushNamed(context, 'Lapsos');
            },
          ),
          title: Text(
            'Materias de 1er Lapso',
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'Calendar');
                },
                icon: Icon(Icons.calendar_today)),
          ],
          elevation: 0,
          backgroundColor: Colors.blue,
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 1, top: 30),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  ListTile(
                    title: Text('Matematica'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SendGmail(
                                      "ivan.madriz@gmail.com", 'Luis')));
                            },
                            child: Text(
                              'Profesor: Luis Tabares',
                              textAlign: TextAlign.end,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
                            ))
                      ],
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text('Quimica'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          'Profesor: Aarron Tasacri',
                          textAlign: TextAlign.end,
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text('Castellano'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          'Profesor: Juan Yanez',
                          textAlign: TextAlign.end,
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text('Ingles'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          'Profesor: Mr louis',
                          textAlign: TextAlign.end,
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text('Fisica'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          'Profesor: Aarron Tasacri',
                          textAlign: TextAlign.end,
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text('Historia'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          'Profesor: Aarron Tasacri',
                          textAlign: TextAlign.end,
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text('Orientacion'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          'Profesor: Aarron Tasacri',
                          textAlign: TextAlign.end,
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text('Deporte'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          'Profesor: Aarron Tasacri',
                          textAlign: TextAlign.end,
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text('Venezuela'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          'Profesor: Aarron Tasacri',
                          textAlign: TextAlign.end,
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text('Biologia'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          'Profesor: Aarron Tasacri',
                          textAlign: TextAlign.end,
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
