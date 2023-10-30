import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/login/login&Signup.dart';
import 'package:todo_app/my_theme_data.dart';
import 'package:todo_app/network/firebase/firebase_manger.dart';
import 'package:todo_app/provider/my_provider.dart';

class signUp_view extends StatelessWidget {
 var _formKey=GlobalKey<FormState>();
 var emailController=TextEditingController();
 var passwordController=TextEditingController();
 var nameController=TextEditingController();
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
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name',
                  labelStyle:TextStyle(
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
                  return 'Please enter your name';
                }

                return null;
              },
            ),
            TextFormField(
              style: TextStyle(
                fontSize: 20,
                color:Theme.of(context).colorScheme.primary,
              ),
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email',
              labelStyle:TextStyle(
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
                final bool emailValid =
                RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value);
                if(!emailValid){
                  return "Please enter valid email";
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
                  labelStyle:TextStyle(
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
                  backgroundColor:my_theme_data.primaryblue
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  firebaseManager.createAccount(nameController.text,emailController.text, passwordController.text,
                          (){
                        Navigator.pushNamedAndRemoveUntil(context, login_screen.RouteName, (route) => false);
                      },
                          (error){
                        showDialog(context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Error!"),
                              content: Text(error.toString()),
                              actions: [
                                ElevatedButton(onPressed: () {
                                  Navigator.pop(context);
                                }, child: Text("OKAY"))
                              ],
                            );
                          },
                        );
                      });
                }

              },
              child: const Text('Sign Up',style: TextStyle(
                fontSize: 20
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
