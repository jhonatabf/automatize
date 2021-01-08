import 'package:flutter/material.dart';
import 'package:automatize_plus/color/colors.dart';
import 'package:automatize_plus/string/strings.dart';
import 'package:firebase_database/firebase_database.dart';
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
      //home: MyRegisterPage(),
      initialRoute: '/',
      routes: {
        '/': (context) => MyRegisterPage(),
        //'/list': (context) => MyListPage(),
      },
    );
  }
}

class MyRegisterPage extends StatefulWidget {
  MyRegisterPage();

  @override
  _MyRegisterPageState createState() => _MyRegisterPageState();
}

class _MyRegisterPageState extends State<MyRegisterPage> {
  final DBF = FirebaseDatabase.instance.reference();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _userName = new TextEditingController();
  TextEditingController _passWord = new TextEditingController();
  bool _buttonDisabled;

  @override
  void initState() {
    super.initState();
    _buttonDisabled = false;
  }

  void userRegister(BuildContext context) async {
    try {
      setState(() {
        _buttonDisabled = true;
      });
      FirebaseUser user = (await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: _userName.text, password: _passWord.text))
          .user;
      if (_userName != null && _passWord != null) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text(
            avisoSucessoCadastro,
          ),
          backgroundColor: Colors.lightGreen,
        ));
        setState(() {
          _buttonDisabled = false;
        });
      }
    } catch (e) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(avisoErroCadastro),
        backgroundColor: Colors.red,
      ));
      setState(() {
        _buttonDisabled = false;
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            text: nomeApp,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
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
        backgroundColor: blueBase,
      ),
      body: register(),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget register() {
    return SingleChildScrollView(
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            color: blueBase,
            padding: EdgeInsets.fromLTRB(15, 20, 20, 15),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
                  child:
                      Text(infoCadastro, style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
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
                    color: darkBluekBase,
                    onPressed: _buttonDisabled
                        ? null
                        : () {
                            userRegister(context);
                          },
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                    ),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            salvar,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900),
                          ),
                        ],
                      ), //Text
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
