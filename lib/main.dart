import 'package:chat_app/UI%20Chat/Add_Room/AddRoom.dart';
import 'package:chat_app/UI%20Chat/Home/Home_Screen.dart';
import 'package:chat_app/UI%20Chat/Login_Screen/LoginScreen.dart';
import 'package:chat_app/UI%20Chat/Register_Screen/RegisterScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
          initialRoute: LoginScreen.routeName,
          routes:{
            RegisterScreen.routeName :(_)=> RegisterScreen(),
            LoginScreen.routeName : (_)=> LoginScreen(),
            HomeScreen.routeName :(_)=> HomeScreen(),
            AddRoom.routeName :(_)=>AddRoom()
          } ,
    );

  }
}

