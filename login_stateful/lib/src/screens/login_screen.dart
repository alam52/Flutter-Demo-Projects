import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';
class LoginScreen extends StatefulWidget{
  createState(){
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin{
  
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  Widget build(context){
    return Container(
      margin: EdgeInsets.all(20.00),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            emailField(),
            passField(),
            Container(
              margin: EdgeInsets.only(top: 25.00),
            ),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField(){
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'you@example.com',
      ),
      validator: validateEmail,
      onSaved: (value){
        email = value;
      },
    );
  }
  Widget passField(){
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Password',
      ),
      validator: validatePassword,
      onSaved: (value){
        password = value;
      },
    );
  }
  Widget submitButton(){
    return RaisedButton(
      color: Colors.blue[50],
      child: Text('Submit'),
      onPressed: (){
        if(formKey.currentState.validate()){
          formKey.currentState.save();
          print('Time to post $email and $password to my API');
        }
      },
    );
  }
}