
//1
import 'package:flutter/material.dart';
import 'package:flutter_app/src/Controller/LogController.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:flutter_app/src/Views/HomeScreen/WelcomeScreen.dart';


class SignIn extends StatefulWidget {
  SignIn({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _SignIn createState() => _SignIn();
}

class _SignIn extends State<SignIn> {
//4
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (BuildContext context) {
//7
        return ListView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            Container(
              height : 500.0,
              width : 200.0,
              child : _RegisterEmailSection(),
            )
            ],
        );
      }),
    );
  }
}

class _RegisterEmailSection extends StatefulWidget {
  final String title = 'Registration';
  @override
  State<StatefulWidget> createState() => _RegisterEmailSectionState(title);
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

class _RegisterEmailSectionState extends StateMVC {
  _RegisterEmailSectionState(String title):super(LogController()){
    _con = LogController.con;
  }
  LogController _con;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText:
              'Password'),
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              alignment: Alignment.center,
              child: RaisedButton(
                onPressed: () async {
                  if (_formKey.currentState.validate()) {

                    //connection a la dataBase
                    _con.register(_passwordController, _emailController).then((isConnected) {
                      //if log then downloadData
                      if(isConnected)
                        {
                          Navigator
                              .of(context)
                              .pushReplacement(MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
                        }
                    }).catchError((message) {
                      Fluttertoast.showToast(msg: message,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER);
                    });
                  }
                },
                child: const Text('Submit'),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(_con.success == null
                  ? ''
                  : (_con.success
                  ? 'Successfully registered ' + _con.getEmail()
                  : 'Registration failed')),
            )
          ],
        ),
      ),
    );
  }
}