


import 'package:flutter/material.dart';
import 'package:task_app/screens/counter.dart';

enum FormType{
  login,
  register
}

class MyAuthPage extends StatefulWidget {
  @override
  _MyAuthPageState createState() => _MyAuthPageState();
}




class _MyAuthPageState extends State<MyAuthPage> {
  final TextEditingController _emailFilter= new TextEditingController();
  final TextEditingController _passwordFilter= new TextEditingController();

  String _email="";
  String _password="";

  FormType _formType=FormType.login;

  _LoginPageState(){
    _emailFilter.addListener(_emailListener);
    _passwordFilter.addListener(_passwordListener);
  }

  void _emailListener(){
    if(_emailFilter.text.isEmpty){
      _email="";
    }else{
      _email=_emailFilter.text;
    }
  }

  void _passwordListener(){
    if(_passwordFilter.text.isEmpty){
      _password="";
    }else{
      _password=_passwordFilter.text;
    }
  }

  void _changeForm ()async {
    setState(() {
      if(_formType==FormType.login){
        _formType=FormType.register;
      }else{
        _formType=FormType.login;
      }
    });
  }

  void _passReset(){
    //TODO
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Sup App"),),

      body: Container(
        alignment: Alignment.center,
      
        padding:EdgeInsets.all(10.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _textFields(),
            _buttons(),
          ],
        ),
      ),
      
    );
  }

  Widget _textFields(){
    return new Container(
      child: Column(
        children:[
          new Container(
            width: 300,
            child: TextField(
              textAlign: TextAlign.center,
              controller: _emailFilter,
              decoration: InputDecoration(
                labelText: "email"),
            ),
          ),
          new Container(
            width: 300,
            child: TextField(
              textAlign: TextAlign.center,
              controller: _passwordFilter,
              decoration: InputDecoration(
                labelText: "password"),
              obscureText: true,
            ),
            
          ),
        ],
      ),
    );
  }


Widget _buttons(){
  if(_formType==FormType.login
  ){
    return Container(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=>Counter()));
            },
             child: Text("Login")),
          TextButton(
            onPressed: _changeForm, 
            child: Text("Dont have an account? \nClick here!")),
          TextButton(
            onPressed: null, 
            child: Text("reset password"))
        ],
      ),
    );
    
  }else{
     return Container(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: null,
             child: Text("Register")),
          TextButton(
            onPressed: _changeForm, 
            child: Text("Click here to login"))
        ],
      ),
    );

  }
}

}
