import 'package:chat_app/model/my_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyDataBase{
  static CollectionReference<MyUser> getUsersCollection(){
    return  FirebaseFirestore.instance.collection(MyUser.collectionName).
    withConverter<MyUser>(
        fromFirestore: (doc,_)=>MyUser.fromFireStore(doc.data()!),
        toFirestore:(user, options) =>user.toFireStore()
    );
  }
  static Future<MyUser> insertUser(MyUser user)async{
    var collection=getUsersCollection();
    var docRef=collection.doc(user.id);
    var res=await docRef.set(user);
    return user;
  }
  static Future<MyUser?> getUserById(String uId)async{
    var collection=getUsersCollection();
    var docRef= collection.doc(uId);
    var res =await docRef.get();
    return res.data();
  }
}