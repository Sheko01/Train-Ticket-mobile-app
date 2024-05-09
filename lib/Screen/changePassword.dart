import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:train_ticket/Const.dart';
import 'package:train_ticket/Screen/LoginScreen.dart';
import 'package:train_ticket/TextArea.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:train_ticket/generated/l10n.dart';
import 'dart:convert';
import 'Settings.dart';
import 'NavBar.dart';

class changePassword extends StatefulWidget {
  const changePassword({super.key});

  @override
  State<changePassword> createState() => _changePasswordState();
}

class _changePasswordState extends State<changePassword> {
  TextEditingController CurrentPassword = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController PasswordConfirm = TextEditingController();
  Future<void> resetPass(
      String currentPassword, String password, String passwordConfirm) async {
    print("change password");
    print(currentPassword);
    print(password);
    print(passwordConfirm);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jwtToken = prefs.getString('jwtToken');
    try {
      var url =
          Uri.parse('https://train-ticket-00vr.onrender.com/api/v1/users/updateMyPassword');
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $jwtToken',
      };
      var response = await http.patch(
        url,
        headers: headers,
        body: jsonEncode({
          "passwordCurrent": currentPassword,
          "password": password,
          "passwordConfirm": passwordConfirm
        }),
      );
      print(response.body);
      var jsonData = jsonDecode(response.body);
      // Check if login was successful
      print(response.statusCode);
      if (response.statusCode == 200) {
        // Extract the JWT from the cookie
        await prefs.remove('jwtToken');
        return; // Exit the function after successful login
      }
      throw Error.safeToString(jsonData['message']);
    } catch (e) {
      // Catch any network or other errors
      throw (e);
    }
  }

  Future<void> _reset() async {
    print("forget button pressed");
    String currentPassword = CurrentPassword.text.trim();
    String password = Password.text.trim();
    String passwordConfirm = PasswordConfirm.text.trim();
    // String password = Password.text.trim();

    try {
      await resetPass(currentPassword, password, passwordConfirm);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => (const LoginScreen()), // Navigate to HomePage
        ),
      );
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
                builder: (context) => MyHomePage(currentIndex: 2),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'image/locker.png',
                  width: 200,
                  height: 300,
                ),
                Text(
                  S.of(context).changepassword,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20,
                ),
                TextArea(
                  name: S.of(context).eyop,
                  hide: true,
                  mycontroller: CurrentPassword,
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
                  onPressed: _reset,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 12),
                    child: Text(
                      S.of(context).changepassword,
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
