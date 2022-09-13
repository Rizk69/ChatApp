import 'package:chat_app/Base/Base.dart';
import 'package:chat_app/data_base/My_Database.dart';
import 'package:chat_app/model/my_user.dart';
import 'package:chat_app/shared_data.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class RegisterNavigator extends BaseNavigator{
  void goToHome();

}

class RegisterViewModel extends BaseViewModel<RegisterNavigator> {
  void createAccount(String email, String password,String userName,String fullName) async {
    navigator?.showLoadingDialog();
    try {
      var credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      MyUser newUser= MyUser(
        id:credential.user?.uid ,
        email:email ,
        fullName:fullName ,
        userName:userName
      );
      var insertedUser=await MyDataBase.insertUser(newUser);
      navigator?.hideLoadingDialog();

      if(insertedUser!=null){
        SharedData.user=insertedUser;
        navigator?.goToHome();
      }else{
        //show error
        navigator?.showMessageDialog('Something went wrong,error database');

      }
    } on FirebaseAuthException catch (e) {
      navigator?.hideLoadingDialog();
      if (e.code == 'weak-password') {
        navigator?.showMessageDialog('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        navigator
            ?.showMessageDialog('The account already exists for that email.');
      }
    } catch (e) {
      navigator?.hideLoadingDialog();

      navigator?.showMessageDialog('$e');
    }
  }
}
