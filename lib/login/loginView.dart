import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/layout/home_layout.dart';
import 'package:todo_app/my_theme_data.dart';
import 'package:todo_app/network/firebase/firebase_manger.dart';
import 'package:todo_app/provider/my_provider.dart';

class logIn_view extends StatelessWidget {

  var _formKey=GlobalKey<FormState>();
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<myProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              style: TextStyle(
                fontSize: 20,
                color:Theme.of(context).colorScheme.primary,
              ),
              controller: emailController,
              decoration:
              InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(
                  fontSize: 20,
                  color:Theme.of(context).colorScheme.secondary,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: my_theme_data.primarywhite),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color:my_theme_data.primaryblue),
                ),


              ),

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            TextFormField(
              style: TextStyle(
                fontSize: 20,
                color:Theme.of(context).colorScheme.primary,
              ),
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password',
                  labelStyle: TextStyle(
                    fontSize: 20,
                    color:Theme.of(context).colorScheme.secondary,
                  ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: my_theme_data.primarywhite),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color:my_theme_data.primaryblue),
                ),

              ),
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
