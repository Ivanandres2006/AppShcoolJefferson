import 'package:app_jefferson/models/user.dart';
import 'package:app_jefferson/screens/root/root.dart';
import 'package:app_jefferson/service/currentUser.dart';
import 'package:app_jefferson/service/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Colegio Jefferson App',
          ),
          leading: IconButton(
            onPressed: () async {
              CurrentUser _currentUser =
                  Provider.of<CurrentUser>(context, listen: false);
              String _returnString = await _currentUser.SignOut();
              if (_returnString == "Success") {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => OurRoot()),
                    (route) => false);
              }
            },
            icon: Icon(Icons.logout_outlined),
          ),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.menu))],
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Stack(
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.only(top: 281),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '1erLapso');
                      },
                      child: Text(
                        '1er',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '1erLapso');
                      },
                      child: Text(
                        '2er',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '1erLapso');
                      },
                      child: Text(
                        '3er',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
