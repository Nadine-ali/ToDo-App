import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/models/user_model.dart';

class firebaseManager{
  static CollectionReference<taskModel> getTaskCollection(){
    return FirebaseFirestore.instance.collection("Task")
        .withConverter<taskModel>(
        fromFirestore: (snapshot,_) {
          return taskModel.fromjason(snapshot.data()!);
        },
        toFirestore: (task,_) {
          return task.toJson();
        },
    );
  }

  static Future<void> addTask(taskModel task){
    var collection=getTaskCollection();
    var document=collection.doc();
    task.id=document.id;
    return document.set(task);
  }


 static Stream<QuerySnapshot<taskModel>>getTasks(DateTime date){
    return getTaskCollection()
        .where("userId",isEqualTo:FirebaseAuth.instance.currentUser!.uid)
        .where("date",isEqualTo:DateUtils.dateOnly(date).microsecondsSinceEpoch).snapshots();
}


static Future<void> deletetask(String Id){
    return getTaskCollection().doc(Id).delete();
}


static Future<void> updatetask(String taskId,bool isDone){
    return getTaskCollection().doc(taskId).update({"isDone":isDone});
}


static Future<void> createAccount(
    String name,String email,String password,Function onSuccess,Function onError)async{
  try {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    // credential.user!.sendEmailVerification();
    userModel user=userModel(name: name, email: email, userid:credential.user!.uid);
    addUserToFirestore(user);
    onSuccess();
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      onError(e.message);
    } else if (e.code == 'email-already-in-use') {
      onError(e.message);
    }
  } catch (e) {
    print(e);
  }
}

static Future<void> login(String email,String password,Function onSuccess,Function onError)async{
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
    );
    onSuccess();
    // if(credential.user!.emailVerified){
    //   onSuccess();
    // }else{
    //   onError("please veryfiy your mail");
    // }

    // credential.user.emailVerified;
  } on FirebaseAuthException catch (e) {
    onError(e.message);
    // if (e.code == 'user-not-found') {
    //   print('No user found for that email.');
    // } else if (e.code == 'wrong-password') {
    //   print('Wrong password provided for that user.');
    // }
  }
}


// -------------------------------user----------------------------------


  static CollectionReference<userModel> getuserCollection(){
    return FirebaseFirestore.instance.collection("user")
        .withConverter<userModel>(
      fromFirestore: (snapshot,_) {
        return userModel.fromjson(snapshot.data()!);
      },
      toFirestore: (user,_) {
        return user.tojson();
      },
    );
  }

  static Future<void>addUserToFirestore(userModel user){
    var collection=getuserCollection();
    var doc=collection.doc(user.userid);
    return doc.set(user);
  }



}

