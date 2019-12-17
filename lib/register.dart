import 'package:flutter/material.dart';
import 'package:validate/validate.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() {
    return _RegisterPageState();
  }
}

class _RegisterData {
  String email = '';
  String password = '';
  String passwordConfirmation = '';
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  _RegisterData _data = new _RegisterData();

  String _validateEmail(String value) {
    try {
      Validate.isEmail(value);
    } catch (e) {
      return 'The E-mail Address must be a valid email address.';
    }

    return null;
  }

  String _validatePassword(String value) {
    if (value.length < 8) {
      return 'The Password must be at least 8 characters.';
    }

    return null;
  }

  void submit() {
    // First validate form.
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save(); // Save our form now.

//      Navigator.push(
//        context,
//        MaterialPageRoute(builder: (context) => SecondRoute()),
//      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('회원 가입', textAlign: TextAlign.center),
      ),
      body: new Container(
          padding: new EdgeInsets.all(20.0),
          child: new Form(
            key: this._formKey,
            child: new ListView(
              children: <Widget>[
                new TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    // Use email input type for emails.
                    decoration: new InputDecoration(labelText: 'E-mail'),
                    validator: this._validateEmail,
                    onSaved: (String value) {
                      this._data.email = value;
                    }),
                new TextFormField(
                    obscureText: true, // Use secure text for passwords.
                    decoration: new InputDecoration(labelText: 'Password'),
                    validator: this._validatePassword,
                    onSaved: (String value) {
                      this._data.password = value;
                    }),
                new TextFormField(
                    obscureText: true, // Use secure text for passwords.
                    decoration:
                    new InputDecoration(labelText: 'Password Confirmation'),
                    validator: this._validatePassword,
                    onSaved: (String value) {
                      this._data.password = value;
                    }),
                new Container(
                  width: screenSize.width,
                  child: new RaisedButton(
                    child: new Text(
                      '회원 가입',
                      style: new TextStyle(color: Colors.white),
                    ),
                    onPressed: this.submit,
                    color: Colors.blue,
                  ),
                  margin: new EdgeInsets.only(top: 20.0),
                ),
              ],
            ),
          )),
    );
  }
}
