import 'package:flutter/material.dart';
import 'package:mycourse/date/remote_data_source/remote_date_source.dart';
import 'package:mycourse/models/user.dart';

class RegisterScreen extends StatelessWidget {
    RegisterScreen({super.key});
  User user = User();
  final RemoteDateSource _dateSource = ImplRemoteDateSource() ;
  final GlobalKey<FormState> _key = GlobalKey();
  final TextEditingController _controllerPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _key,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) {
                  user.name = value;
                },
                validator: (value) {
                  if(value!.isEmpty){
                    return 'Please Enter This Box' ;
                  }
                },
                decoration: const InputDecoration(hintText: 'name'),),
              TextFormField(
                onChanged: (value) {
                  user.email = value;
                },
                validator: (value) {
                  if(value!.isEmpty){
                    return 'Please Enter This Box' ;
                  }
                },
                decoration: const InputDecoration(hintText: 'email'),),
              TextFormField(
                controller: _controllerPassword,
                validator: (value) {
                  if(value!.isEmpty){
                    return 'Please Enter This Box' ;
                  }
                },
                decoration: const InputDecoration(hintText: 'password'),),
              MaterialButton(onPressed: () {
                if(_key.currentState!.validate()){
                  _dateSource.register(user, _controllerPassword.text);
                }
              },child: const Text('Register'),)
            ],
          ),
        ),
      ),
    );
  }
}
