import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:train_ticket/TextArea.dart';
import 'package:train_ticket/generated/l10n.dart';
import '../Const.dart';
import 'Register.dart';
import 'NavBar.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'forget.dart';

String? jwtToken;

Future<void> authenticateUser(String email, String password) async {
  print("authentication");
  print(email);
  print(password);
  var url = Uri.parse('https://train-ticket-00vr.onrender.com/api/v1/users/login');
  try {
    var response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password}),
    );
    print(response.body);
    // Check if login was successful
    print(response.statusCode);
    var responseData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      var userName =
          responseData['data']['user']['name']; // Extracting user's name
      jwtToken =
          responseData['token']; // Assuming token is returned in response

      // Store the JWT token and user's name in shared preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('jwtToken', jwtToken!);
      await prefs.setString('userName', userName);
      return; // Exit the function after successful login
    }
    // If login was not successful, throw an exception
    throw Error.safeToString(responseData['message']);
  } catch (e) {
    throw (e);
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();

  Future<void> _login() async {
    print("Login button pressed");
    String email = Email.text.trim();
    String password = Password.text.trim();

    try {
      await authenticateUser(email, password);


      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              (MyHomePage(currentIndex: 0)), // Navigate to HomePage
        ),
      );
    } catch (e) {
      // Handle login failure
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(S.of(context).lif),
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
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Expanded(
        child: Center(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'image/train.png',
                  ),
                  Text(
                    S.of(context).si,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                  Text(
                    S.of(context).tw,
                    style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 101, 101, 101)),
                  ),
                  TextArea(
                    name: S.of(context).eye,
                    hide: false,
                    mycontroller: Email,
                    iconData: Icons.person,
                  ),
                  TextArea(
                    name: S.of(context).eyp,
                    hide: true,
                    mycontroller: Password,
                    iconData: Icons.lock,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              (ForgetPasswordPage()), // Navigate to HomePage
                        ),
                      );
                    },
                    child: InkWell(
                      radius: 50,
                      child: Container(
                        child: Text(
                          S.of(context).fyp,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              decorationColor: Pcolor,
                              color: Pcolor,
                              fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: _login,
                    child: Text(
                      S.of(context).login,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 19.5,
                      ),
                    ),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 150, vertical: 15)),
                      backgroundColor: MaterialStateProperty.all(Pcolor),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(S.of(context).naa, style: TextStyle(fontSize: 14)),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  (Register()), // Navigate to HomePage
                            ),
                          );
                        },
                        child: Container(
                          child: Text(
                            S.of(context).register,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Pcolor,
                              decoration: TextDecoration.underline,
                              decorationColor: Pcolor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
