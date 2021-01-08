import 'package:automatize_plus/screen/register.dart';
import 'package:automatize_plus/screen/home.dart';
import 'package:automatize_plus/screen/list.dart';
import 'package:flutter/material.dart';
import 'package:automatize_plus/color/colors.dart';
import 'package:automatize_plus/string/strings.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: tituloApp,
      theme: ThemeData(
        primarySwatch: whiteBase,
      ),
      //home: Scaffold(),
      initialRoute: '/',
      routes: {
        '/': (context) => MyInitPage(),
      },
    );
  }
}

class MyInitPage extends StatefulWidget {
  MyInitPage();

  @override
  _MyInitPageState createState() => _MyInitPageState();
}

class _MyInitPageState extends State<MyInitPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  void snack(String texto, Color cor) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(
        texto,
      ),
      backgroundColor: cor,
    ));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteBase,
      key: _scaffoldKey,
      resizeToAvoidBottomInset: true,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            ListTile(
              leading: Icon(Icons.supervised_user_circle),
              title: Text('Trocar usuário'),
            )
          ],
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: blueBase),
        title: RichText(
          text: TextSpan(
            text: nomeApp,
            style: TextStyle(
                color: blueBase, fontWeight: FontWeight.bold, fontSize: 24),
            children: <TextSpan>[
              TextSpan(
                  text: '+',
                  style: TextStyle(
                      color: orangeBase,
                      fontWeight: FontWeight.bold,
                      fontSize: 24))
            ],
          ),
        ),
        elevation: 0.0,
        backgroundColor: whiteBase,
      ),
      body: home(),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget home() {
    return SingleChildScrollView(
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(15, 20, 20, 15),
            child: Column(
              children: <Widget>[],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(15, 20, 20, 15),
            child: Column(
              children: <Widget>[],
            ),
          ),
        ],
      ),
    );
  }
}
