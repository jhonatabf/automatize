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
        primarySwatch: Colors.blue,
      ),
      //home: Scaffold(),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/register': (context) => MyRegisterPage(),
        '/reset': (context) => MyInitPage(),
        '/list': (context) => MyListPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FirebaseAuth _fireAuth = FirebaseAuth.instance;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _userName = new TextEditingController();
  TextEditingController _passWord = new TextEditingController();
  bool _buttonDisabled;

  @override
  void initState() {
    super.initState();
    _buttonDisabled = false;
  }

  void snack(String texto, Color cor) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(
        texto,
      ),
      backgroundColor: cor,
    ));
  }

  void resetPassword(BuildContext context) async {
    try {
      await _fireAuth.sendPasswordResetEmail(email: _userName.text);
      snack(envioEmail, Colors.lightGreen);
    } catch (e) {
      snack(erroEnvioEmail, Colors.red);
    }
  }

  void userLogin(BuildContext context) async {
    try {
      setState(() {
        _buttonDisabled = true;
      });
      FirebaseUser user = (await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: _userName.text, password: _passWord.text))
          .user;
      if (_userName != null && _passWord != null) {
        Navigator.pushNamedAndRemoveUntil(context, '/reset', (_) => false);
        setState(() {
          _buttonDisabled = false;
        });
      }
    } catch (e) {
      snack(erroLogin, Colors.red);
      setState(() {
        _buttonDisabled = false;
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteBase,
      key: _scaffoldKey,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: new Center(
          child: RichText(
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
        ),
        elevation: 0.0,
        backgroundColor: whiteBase,
      ),
      body: login(),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget login() {
    return SingleChildScrollView(
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(15, 20, 20, 15),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: TextField(
                    controller: _userName,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: mail,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: TextField(
                    obscureText: true,
                    controller: _passWord,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: senha,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 70,
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
                  child: RaisedButton(
                    elevation: 0,
                    color: orangeInput,
                    onPressed: _buttonDisabled
                        ? null
                        : () {
                            userLogin(context);
                          },
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                    ),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            entrar,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900),
                          ),
                        ],
                      ), //Text
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: GestureDetector(
                    onTap: () {
                      resetPassword(context);
                    },
                    child: Container(
                      child: Text(
                        semSenha,
                        textAlign: TextAlign.left,
                        style: TextStyle(color: darkBluekBase),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
