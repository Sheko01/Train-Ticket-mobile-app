import 'package:page_transition/page_transition.dart';
import 'package:train_ticket/Screen/LoginScreen.dart';
import 'package:train_ticket/generated/l10n.dart';
import '../TextArea.dart';
import 'package:flutter/material.dart';
import '../Const.dart';
import 'NavBar.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
// import './../model/user.dart';

// TextEditingController username = TextEditingController();
Future<void> registeration(String name, String email, String phone,
    String password, String confirmPassword) async {
  print("registeration");
  print(name);
  print(email);
  print(phone);
  print(password);
  print(confirmPassword);

  var url = Uri.parse('https://train-ticket-00vr.onrender.com/api/v1/users/signup');
  try {
    var response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "name": name,
        "email": email,
        "phone": phone,
        "password": password,
        "passwordConfirm": confirmPassword
      }),
    );
    print(response.body);
    // Check if registration was successful
    print(response.statusCode);
    var responseData = jsonDecode(response.body);
    if (response.statusCode == 201) {
      var userName =
          responseData['data']['user']['name']; // Extracting user's name
      jwtToken =
          responseData['token']; // Assuming token is returned in response

      // Store the JWT token and user's name in shared preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('jwtToken', jwtToken!);
      await prefs.setString('userName', userName);
      return; // Exit the function after successful registration
    }
    // If registration was not successful, throw an exception
    throw Error.safeToString(responseData['message']);
  } catch (e) {
    // Catch any network or other errors
    throw (e);
  }
}

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController Name = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Phone = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController ConfirmPassword = TextEditingController();

  Future<void> _signup() async {
    print("Login button pressed");
    String name = Name.text.trim();
    String email = Email.text.trim();
    String phone = Phone.text.trim();
    String password = Password.text.trim();
    String confirmPassword = ConfirmPassword.text.trim();

    try {
      await registeration(name, email, phone, password, confirmPassword);

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
          title: Text('Register Failed'),
          content: Text(e.toString()),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
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
        backgroundColor: Colors.grey[200],
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
      backgroundColor: Colors.grey[200],
      body: Expanded(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      text: S.of(context).rtju,
                      children: [
                        WidgetSpan(
                          child: Image.asset(
                            'image/slogo.png',
                            width: 40,
                            height: 40,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    S.of(context).pftff,
                    style: TextStyle(fontSize: 18),
                  ),
                  TextArea(
                    name: S.of(context).eyn,
                    hide: false,
                    mycontroller: Name,
                    iconData: Icons.person,
                  ),
                  TextArea(
                    name: S.of(context).eye,
                    hide: false,
                    mycontroller: Email,
                    iconData: Icons.mail,
                  ),
                  TextArea(
                    name: S.of(context).eypn,
                    hide: false,
                    mycontroller: Phone,
                    iconData: Icons.phone,
                  ),
                  TextArea(
                    name: S.of(context).eyp,
                    hide: true,
                    mycontroller: Password,
                    iconData: Icons.password,
                  ),
                  TextArea(
                    name: S.of(context).cyp,
                    hide: true,
                    mycontroller: ConfirmPassword,
                    iconData: Icons.password,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Pcolor),
                        padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                        ),
                      ),
                      onPressed: _signup,
                      child: Text(
                        S.of(context).register,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).aau,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const LoginScreen(), // Navigate to login screen
                            ),
                          );
                        },
                        child: Text(
                          S.of(context).login,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Pcolor,
                              decoration: TextDecoration.underline,
                              decorationColor: Pcolor),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
