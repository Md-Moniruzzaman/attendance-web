import 'package:attendance_app/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  String? _name;
  String? _user;
  String? _password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Company Id',
        labelStyle: TextStyle(
          color: Colors.teal,
        ),
        prefixIcon: Icon(
          FontAwesomeIcons.idCard,
          size: 18.0,
          color: Colors.teal,
        ),
      ),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String? value) {
        _name = value;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'User Id',
        prefixIcon: Icon(
          FontAwesomeIcons.user,
          size: 18.0,
          color: Colors.teal,
        ),
        labelStyle: TextStyle(
          color: Colors.teal,
        ),
      ),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'UserId is Required';
        }

        return null;
      },
      onSaved: (String? value) {
        _user = value;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: TextStyle(
          color: Colors.teal,
        ),
        prefixIcon: Icon(
          FontAwesomeIcons.key,
          size: 18.0,
          color: Colors.teal,
        ),
      ),
      keyboardType: TextInputType.visiblePassword,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Password is Required';
        }

        return null;
      },
      onSaved: (String? value) {
        _password = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(24),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildName(),
            _buildEmail(),
            _buildPassword(),
            SizedBox(height: 60),
            RaisedButton(
              color: Colors.teal,
              child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              onPressed: () {
                if (!_formKey.currentState!.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DashboardPage(),
                    ),
                  );
                }

                _formKey.currentState!.save();

                print(_name);
                print(_user);
                print(_password);

                //Send to API
              },
            )
          ],
        ),
      ),
    );
  }
}
