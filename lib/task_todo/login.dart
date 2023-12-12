import 'package:flutter/material.dart';
import 'package:mycourse/date/network/error_handler.dart';
import 'package:mycourse/date/remote_data_source/remote_date_source.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _key = GlobalKey();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final RemoteDateSource _dateSource = ImplRemoteDateSource();
  UiState uiState = UiState.loading;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Center(
            child: Text(
              'Login',
              style: TextStyle(color: Colors.white),
            )),
      ),
    );
  }

}
