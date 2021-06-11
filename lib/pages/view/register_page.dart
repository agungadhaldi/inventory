import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pos_flutter/services/auth_services.dart';
import 'package:pos_flutter/services/validator.dart';
import 'home_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formkey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var _userEmail = "";
    var _userPassword = "";
    var _username = "";

    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 100.0),
                      child: RichText(
                        text: TextSpan(
                          text: 'Register\n',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 60.0,
                            fontWeight: FontWeight.bold,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Account',
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text: '.',
                              style: TextStyle(color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Form(
                        key: _formkey,
                        child: Column(
                          children: [
                            Container(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Username',
                                ),
                                onSaved: (value) {
                                  _username = value;
                                },
                              ),
                            ),
                            Container(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Email Address',
                                ),
                                validator: Validator.emailValidate,
                                keyboardType: TextInputType.emailAddress,
                                onSaved: (value) {
                                  _userEmail = value;
                                },
                              ),
                            ),

                            Container(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                ),
                                validator: Validator.passwordValidate,
                                obscureText: true,
                                onSaved: (value) {
                                  _userPassword = value;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10.0, bottom: 50.0),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              left: 25.0,
                              right: 25.0,
                            ),
                            height: 50.0,
                            child: GestureDetector(
                              onTap: () async {
                                if (_formkey.currentState.validate()) {
                                  _formkey.currentState.save();
                                  dynamic result = await AuthServices.signUp(
                                    _userEmail.trim(),
                                    _userPassword.trim(),
                                    _username.trim(),
                                  );
                                  if (result != 'berhasil') {
                                    Get.snackbar(
                                      'Oops Ada yang error',
                                      result,
                                      colorText: Colors.white,
                                      backgroundColor: Colors.red,
                                    );
                                  } else {
                                    Get.to(() => HomePage());
                                  }
                                }
                              },
                              child: Material(
                                borderRadius: BorderRadius.circular(20.0),
                                shadowColor: Colors.greenAccent,
                                color: Colors.green,
                                elevation: 7.0,
                                child: Center(
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: (){
                              Get.toNamed('/login');
                            },
                            child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Login")
                            ),
                          ),
                        ],
                      ),
                    ),
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
