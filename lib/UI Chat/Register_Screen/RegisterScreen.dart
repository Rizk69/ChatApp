import 'package:chat_app/Componant/Componant.dart';
import 'package:chat_app/UI%20Chat/Home/Home_Screen.dart';
import 'package:chat_app/UI%20Chat/Register_Screen/RegisterViewModel.dart';
import 'package:chat_app/validation/ValidationUtils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Base/Base.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'Login';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends BaseState<RegisterScreen, RegisterViewModel>
    implements RegisterNavigator {
  bool securpassword = true;
  var formKey = GlobalKey<FormState>();
  var emailControl = TextEditingController();
  var passwordControl = TextEditingController();
  var userNameControl = TextEditingController();
  var fullNameControl = TextEditingController();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return viewModel;
      },
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage('images/background.png'), fit: BoxFit.fill)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            toolbarHeight: 120,
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: const Text(
              'Create Account',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          body: Form(
            key: formKey,
            child: Container(
              padding: const EdgeInsets.all(12),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: size.height * 0.18,
                    ),
                    TextFormField(
                      controller: userNameControl,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please Enter Your First Name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'First Name',
                          labelStyle: TextStyle(color: Color(0XFF797979))),
                    ),
                    TextFormField(
                      controller: fullNameControl,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please Enter Your Last Name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'Last Name',
                          labelStyle: TextStyle(color: Color(0XFF797979))),
                    ),
                    TextFormField(
                      controller: emailControl,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please Enter Your Email Address';
                        }
                        if (ValidationUtils.isValidateEmail(text) == false) {
                          return 'Please Enter Email Valid';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'Email Address',
                          labelStyle: TextStyle(color: Color(0XFF797979))),
                    ),
                    TextFormField(
                      controller: passwordControl,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please Enter Your Password';
                        }
                        if (text.length <= 8) {
                          return 'Please Password Character =8 char';
                        }
                        return null;
                      },
                      obscureText: securpassword,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  securpassword = !securpassword;
                                });
                              },
                              child: Icon(securpassword
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                          labelStyle: TextStyle(color: Color(0XFF797979))),
                    ),
                    SizedBox(height: 50),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13),
                        shape: BoxShape.rectangle,
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 5,
                              color: Colors.black12,
                              spreadRadius: 0.1,
                              offset: Offset(0.4, 0.4))
                        ],
                      ),
                      padding: EdgeInsets.all(12),
                      child: TextButton(
                          onPressed: () {
                            createAccountClick();
                          },
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Create Account',
                                style: TextStyle(
                                  color: Color(0XFFBDBDBD),
                                  fontSize: 16,
                                ),
                              ),
                              Icon(
                                Icons.arrow_right_alt_sharp,
                                color: Color(0XFFBDBDBD),
                                size: 30,
                              )
                            ],
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void createAccountClick() {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    viewModel.createAccount(emailControl.text, passwordControl.text,userNameControl.text,fullNameControl.text);
  }

  @override
  RegisterViewModel initViewModel() {
    // TODO: implement initViewModel
    return RegisterViewModel();
  }

  @override
  void goToHome() {
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }
}
