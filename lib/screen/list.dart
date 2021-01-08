import 'package:flutter/material.dart';
import 'package:automatize_plus/color/colors.dart';
import 'package:automatize_plus/string/strings.dart';

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
      //home: MyListPage(),
      initialRoute: '/',
      routes: {
        '/': (context) => MyListPage(),
      },
    );
  }
}

class MyListPage extends StatefulWidget {
  MyListPage();

  @override
  _MyListPageState createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
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
        elevation: 0,
        backgroundColor: blueBase,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                color: blueBase,
                child: Center(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Saldo do dia',
                            style: TextStyle(color: Colors.white)),
                        Text(
                          '59,60',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                        RaisedButton(
                          elevation: 0,
                          color: blueBase,
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.white)),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.add_circle_outline,
                                  color: Colors.white,
                                ),
                                Text(
                                  " " + novoRegistro,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ), //Text
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 30,
                width: double.infinity,
                color: lightGray,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: ButtonTheme(
                  height: 40.0,
                  child: OutlineButton(
                    onPressed: () => {
                      print("pressionei o botão"),
                    },
                    borderSide: BorderSide(
                      color: darkBluekBase, //Color of the border
                      style: BorderStyle.solid, //Style of the border
                      width: 0.8, //width of the border
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.white)),
                    child: Text(
                      'entrar',
                      style: TextStyle(color: darkBluekBase),
                    ), //Text
                  ), //RaisedButton
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          print("Esqueceu senha");
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                          child: Text(
                            'esqueciSenha',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: darkBluekBase),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/cpf', (_) => true);
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                        child: Text(
                          'cadastrar',
                          textAlign: TextAlign.right,
                          style: TextStyle(color: darkBluekBase),
                        ),
                      ),
                    )),
                  ],
                ),
              )
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
