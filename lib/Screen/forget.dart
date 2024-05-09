import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:train_ticket/Const.dart';
import 'package:train_ticket/Screen/LoginScreen.dart';

import 'package:train_ticket/TextArea.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:train_ticket/generated/l10n.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  late TextEditingController Email;
  late TextEditingController Code;
  late TextEditingController Password;
  late TextEditingController PasswordConfirm;
  int _step = 1;

  @override
  void initState() {
    super.initState();
    Email = TextEditingController();
    Code = TextEditingController();
    Password = TextEditingController();
    PasswordConfirm = TextEditingController();
  }

  @override
  void dispose() {
    Email.dispose();
    Code.dispose();
    Password.dispose();
    PasswordConfirm.dispose();
    super.dispose();
  }

  Future<void> _forgetPassword(String email) async {
    // Send email to server for password reset
    // Your code here
    print("forget password");
    print(email);

    var url = Uri.parse('https://train-ticket-00vr.onrender.com/api/v1/users/forgotPassword');
    try {
      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email}),
      );
      print(response.body);
      var jsonData = jsonDecode(response.body);
      // Check if login was successful
      print(response.statusCode);
      if (response.statusCode == 200) {
        // Extract the JWT from the cookie
        return; // Exit the function after successful login
      }

      // If login was not successful, throw an exception
      throw Error.safeToString(jsonData['message']);
    } catch (e) {
      // Catch any network or other errors
      throw (e);
    }
  }

  Future<void> _resetPassword(
      String code, String password, String passwordConfirm) async {
    // Send code, new password, and confirm password to server for password reset
    // Your code here
    print("forget password");
    print(code);
    print(password);
    print(passwordConfirm);

    var url = Uri.parse(
        'https://train-ticket-00vr.onrender.com/api/v1/users/resetPassword/${code}');
    try {
      var response = await http.patch(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(
            {"password": password, "passwordConfirm": passwordConfirm}),
      );
      print(response.body);
      var jsonData = jsonDecode(response.body);
      // Check if login was successful
      print(response.statusCode);
      if (response.statusCode == 200) {
        // Extract the JWT from the cookie
        return; // Exit the function after successful login
      }

      // If login was not successful, throw an exception
      throw Error.safeToString(jsonData['message']);
    } catch (e) {
      // Catch any network or other errors
      throw (e);
    }
  }

  Future<void> _onSubmit() async {
    try {
      if (_step == 1) {
        // Step 1: Forget Password
        await _forgetPassword(Email.text.trim());
        setState(() {
          _step = 2;
        });
      } else if (_step == 2) {
        // Step 2: Reset Password
        await _resetPassword(
          Code.text.trim(),
          Password.text.trim(),
          PasswordConfirm.text.trim(),
        );
        // Navigate to next screen after resetting password
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const LoginScreen(), // Navigate to login screen
          ),
        );
      }
    } catch (e) {
      // Handle login failure
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(S.of(context).ftcp),
          content: Text(e.toString()),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(S.of(context).ok),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const LoginScreen(), // Navigate to login screen
              ),
            );
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
          child: SingleChildScrollView(
            child: _step == 1
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'image/locker.png',
                        width: 200,
                        height: 300,
                      ),
                      Text(
                        S.of(context).forgotpassword,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        S.of(context).pyetl,
                        style: TextStyle(fontSize: 15),
                      ),
                      TextArea(
                        name: S.of(context).eye,
                        hide: false,
                        mycontroller: Email,
                        iconData: Icons.mail,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Pcolor)),
                        onPressed: _onSubmit,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 12),
                          child: Text(
                            S.of(context).reset,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      )
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'image/locker.png',
                        width: 200,
                        height: 300,
                      ),
                      Text(
                        S.of(context).reset,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextArea(
                        name: S.of(context).etpc,
                        hide: false,
                        mycontroller: Code,
                        iconData: Icons.password,
                      ),
                      TextArea(
                        name: S.of(context).eynp,
                        hide: true,
                        mycontroller: Password,
                        iconData: Icons.password,
                      ),
                      TextArea(
                        name: S.of(context).eycp,
                        hide: true,
                        mycontroller: PasswordConfirm,
                        iconData: Icons.password,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Pcolor)),
                        onPressed: _onSubmit,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 12),
                          child: Text(
                            S.of(context).reset,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
