import 'package:chat_app/Base/Base.dart';
import 'package:chat_app/data_base/My_Database.dart';
import 'package:chat_app/shared_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
abstract class LoginNavigator extends BaseNavigator{
  void goToHome();

}

class LoginViewModel extends BaseViewModel<LoginNavigator> {
  void login(String email, String password) async {
    try {
      navigator?.showLoadingDialog();
      var credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
     var retrieveUser=await MyDataBase.getUserById(credential.user?.uid ??'');
      navigator?.hideLoadingDialog();

      if(retrieveUser!=null){
        SharedData.user=retrieveUser;
        navigator?.goToHome();

     }else{
        navigator?.showMessageDialog('Something wrong user name or password');

     }
    } on FirebaseAuthException catch (e) {
      navigator?.hideLoadingDialog();
    navigator?.showMessageDialog('wrong user name or password');
    }
  }
}
