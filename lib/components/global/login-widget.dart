import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_app/services/http-calls.dart';
import 'package:plant_app/services/validator.dart';
import 'package:plant_app/templates/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:plant_app/components/account/account-component.dart';

class LoginSignUp extends StatefulWidget {
  final refreshParent;

  const LoginSignUp({Key key, this.refreshParent}) : super(key: key);
  @override
  _LoginSignUpState createState() => _LoginSignUpState();
}

class _LoginSignUpState extends State<LoginSignUp> {
  final formKey = GlobalKey<FormState>();
  TextEditingController phoneNumberController;
  TextEditingController passwordController;
  TextEditingController firstNameController;
  TextEditingController lastNameController;
  TextEditingController emailController;
  bool hidePassword = true;
  bool loggingIn = false;

  String header = 'Login';
  bool isSignUp = false;

  @override
  void initState() {
    super.initState();
    phoneNumberController = TextEditingController();
    passwordController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Size window = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: window.width * 0.1),
        child: Column(
          children: [
            Text(
              header,
              style: TextStyle(fontSize: 25.0, fontFamily: 'Poppins'),
            ),
            isSignUp? Padding(padding: EdgeInsets.only(bottom: 30.0)) : Container(),
            Form(
              key: formKey,
              autovalidate: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  isSignUp? Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: TextFormField(
                      validator: (value) {
                        return Validator.validateName(value, context);
                      },
                      controller: firstNameController,
                      decoration: InputDecoration(
                        labelText: "First Name",
                        hintText: "Jane",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ) : Container(),
                  Padding(padding: EdgeInsets.only(bottom: 25.0)),
                  isSignUp? Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: TextFormField(
                      validator: (value) {
                        return Validator.validateName(value, context);
                      },
                      controller: lastNameController,
                      decoration: InputDecoration(
                        labelText: "Last Name",
                        hintText: "Doe",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ) : Container(),
                  Padding(padding: EdgeInsets.only(bottom: 25.0)),
                  isSignUp? Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: TextFormField(
                      validator: (value) {
                        return Validator.validateOptionalEmail(value, context);
                      },
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        hintText: "janedoe@example.com",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ) : Container(),
                  Padding(padding: EdgeInsets.only(bottom: 25.0)),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: TextFormField(
                      validator: (value) {
                        return Validator.validatePhone(value, context);
                      },
                      keyboardType: TextInputType.phone,
                      controller: phoneNumberController,
                      decoration: InputDecoration(
                        labelText: "Phone Number",
                        hintText: "0912345678",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 25.0)),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: TextFormField(
                      validator: (value) {
                        return Validator.validatePassword(value, context);
                      },
                      obscureText: hidePassword,
                      controller: passwordController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            icon: hidePassword
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                            onPressed: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            }),
                        labelText: "Password",
                        hintText: "********",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 25.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Material(
                        borderRadius: BorderRadius.circular(50.0),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(50.0),
                          child: Container(
                            width: 130.0,
                            height: 50.0,
                            child: Center(
                              child: Text(
                                "Sign Up",
                                style:
                                TextStyle(fontSize: 16.0),
                              ),
                            ),
                          ),
                          onTap: () {
                            if(header == 'Login') {
                              setState(() {
                                header = 'Sign Up';
                                isSignUp = true;
                              });
                            }

                            var val;

                            if(formKey.currentState.validate()) {
                              var password = md5.convert(utf8.encode(passwordController.text)).toString();
                              HTTPCalls.addUser(firstNameController.text, lastNameController.text, emailController.text, password, phoneNumberController.text).then((value) =>
                              {
                                  if(value[0] == null) {
                                    HTTPCalls.authenticateUser(phoneNumberController.text, password).then((value2) =>
                                    {
                                      if(value2[0] != null) {
                                        Get.find<SharedPreferences>().setBool('isLoggedIn', true),

                                        Get.find<SharedPreferences>().setInt('userId', value2[0]['id']),
                                        Get.find<SharedPreferences>().setString('userRole', value2[0]['role']),
                                        Get.find<SharedPreferences>().setString('userFName', value2[0]['first_name']),
                                        Get.find<SharedPreferences>().setString('userLName', value2[0]['last_name']),
                                        Get.find<SharedPreferences>().setString('userPhone', value2[0]['phone_number']),

                                        widget.refreshParent(),
                                      } else {
                                        Scaffold.of(context).showSnackBar(SnackBar(
                                          content: Text("Unable to authenticate. Please check credentials and try again."),
                                        ))
                                      }
                                    })
                                  } else {
                                    Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text("Unable to authenticate. Please check credentials and try again."),
                                    ))
                                  }
                              });
                            }
                          },
                        ),
                      ),
                      Material(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(50.0),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(50.0),
                          child: Container(
                            width: 130.0,
                            height: 50.0,
                            child: Center(
                              child: Text(
                                "Login",
                                style:
                                TextStyle(fontSize: 16.0, color: Colors.white),
                              ),
                            ),
                          ),
                          onTap: () {
                            if(header == 'Sign Up') {
                              setState(() {
                                header = 'Login';
                                isSignUp = false;
                              });
                            }

                            if(formKey.currentState.validate()) {
                              var password = md5.convert(utf8.encode(passwordController.text)).toString();
                              HTTPCalls.authenticateUser(phoneNumberController.text, password).then((value) =>
                              {
                                print(value[0]),
                                if(value[0] != null) {
                                  Get.find<SharedPreferences>().setBool('isLoggedIn', true),

                                  Get.find<SharedPreferences>().setInt('userId', value[0]['id']),
                                  Get.find<SharedPreferences>().setString('userRole', value[0]['role']),
                                  Get.find<SharedPreferences>().setString('userFName', value[0]['first_name']),
                                  Get.find<SharedPreferences>().setString('userLName', value[0]['last_name']),
                                  Get.find<SharedPreferences>().setString('userPhone', value[0]['phone_number']),

                                  widget.refreshParent(),
                                } else {
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text("Unable to authenticate. Please check credentials and try again."),
                                  ))
                                }
                              });
                            }
                          },
                        ),
                      ),

                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
