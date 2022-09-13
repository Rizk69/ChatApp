import 'package:chat_app/Base/Base.dart';
import 'package:chat_app/UI%20Chat/Home/Home_Screen.dart';
import 'package:chat_app/UI%20Chat/Login_Screen/LoginViewModel.dart';
import 'package:chat_app/UI%20Chat/Register_Screen/RegisterScreen.dart';
import 'package:chat_app/validation/ValidationUtils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'Register';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseState<LoginScreen, LoginViewModel>
    implements LoginNavigator {
  bool securpassword = true;
  var formKey = GlobalKey<FormState>();
  var emailControl = TextEditingController();
  var passwordControl = TextEditingController();

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
              'Login',
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
                    Text(
                      'Welcome Back!',
                      style: TextStyle(
                          fontSize: 28,
                          color: Color(0XFF303030),
                          fontWeight: FontWeight.bold),
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
                      height: 70,
                      decoration: BoxDecoration(
                        color: Color(0XFF3598DB),
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
                            signAccountClick();
                          },
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0XFF3598DB))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              Icon(
                                Icons.arrow_right_alt_sharp,
                                color: Colors.white,
                                size: 30,
                              )
                            ],
                          )),
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, RegisterScreen.routeName);
                        },
                        child: Text(
                          'Or Create My Account..!',
                          style:
                              TextStyle(color: Color(0XFF505050), fontSize: 12),
                        ),
                      ),
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

  void signAccountClick() {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    viewModel.login(emailControl.text, passwordControl.text);
  }

  @override
  LoginViewModel initViewModel() {
    return LoginViewModel();
  }

  @override
  void goToHome() {
    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }
}
