import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/layout/home_layout.dart';
import 'package:todo_app/my_theme_data.dart';
import 'package:todo_app/network/firebase/firebase_manger.dart';

class logIn_view extends StatelessWidget {

  var _formKey=GlobalKey<FormState>();
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: emailController,

              decoration: const InputDecoration(labelText: 'Email',),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: my_theme_data.primaryblue
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()){
                  firebaseManager.login(emailController.text, passwordController.text,
                          (){
                    Navigator.pushNamedAndRemoveUntil(context, home_layout.RouteName,(route) => false);
                          },
                          (error){
                    showDialog(context: context,
                      barrierDismissible: false,
                      builder: (context) {
                      return AlertDialog(
                        title: Text("Error!"),
                        content: Text(error),
                        actions: [
                        ElevatedButton(onPressed:(){
                          Navigator.pop(context);
                        }
                            , child:Text("Okay"))
                      ],);
                    },);
                   });
                }
              },
              child: const Text('Login',style: TextStyle(
                fontSize: 20
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
