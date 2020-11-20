import 'package:flutter/material.dart';
import 'file:///C:/Users/Public/FlutterTest/flutter_app/lib/old/personal_material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class Logging extends StatefulWidget {
  @override
  _Loggingstate createState() => _Loggingstate();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
bool _success;
String _userEmail;

class _Loggingstate extends State<Logging> {
  @override
  Widget build(BuildContext context) {
    PersonalMaterial.WIDTH = MediaQuery.of(context).size.width;
    PersonalMaterial.HEIGHT = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("asset/background/logging.jpg"),
                  fit: BoxFit.cover)),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 24),
                Image.asset("asset/Logo_Appetee.png"),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      PersonalMaterial.rectangleOutsideShadow(
                          80.0, PersonalMaterial.WIDTH - 80, 30.0),
                      const SizedBox(height: 24),
                      Container(
                        width: PersonalMaterial.WIDTH - 80,
                        decoration: PersonalMaterial.boxDecoration(),
                        child: Container(
                          margin: new EdgeInsets.all(12.0),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                TextFormField(
                                  controller: _emailController,
                                  decoration:
                                      const InputDecoration(labelText: 'Email'),
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  controller: _passwordController,
                                  decoration: const InputDecoration(
                                      labelText: 'Password'),
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(_success == null
                                      ? ''
                                      : (_success
                                          ? 'Successfully registered ' +
                                              _userEmail
                                          : 'Registration failed')),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 18.0),
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          child: Text(
                            'Connexion',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 28,
                                  color: Colors.white,
                                  decoration: TextDecoration.none,
                                  height: 1),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.redAccent,
                            padding: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 28),
                            textStyle: TextStyle(fontSize: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            side: BorderSide(color: Colors.white, width: 8),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              //_register();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class _RegisterEmailSection extends StatefulWidget {
  final String title = 'Registration';

  @override
  State<StatefulWidget> createState() => _RegisterEmailSectionState();
}

class _RegisterEmailSectionState extends State<_RegisterEmailSection> {
  void _register() async {
    final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    ))
        .user;
    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email;
      });
    } else {
      setState(() {
        _success = true;
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: PersonalMaterial.WIDTH - 50,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          boxShadow: [
            BoxShadow(
                color: Colors.white,
                offset: Offset(-4.0, -4.0),
                blurRadius: 15.0,
                spreadRadius: 1.0),
            BoxShadow(
                color: Colors.grey[600],
                offset: Offset(4.0, 4.0),
                blurRadius: 10.0,
                spreadRadius: 1.0),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: Form(
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
                decoration: const InputDecoration(labelText: 'Password'),
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
                      _register();
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(_success == null
                    ? ''
                    : (_success
                        ? 'Successfully registered ' + _userEmail
                        : 'Registration failed')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
