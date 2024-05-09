import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:train_ticket/Screen/LoginScreen.dart';
import 'package:train_ticket/Screen/NavBar.dart';
import 'package:train_ticket/generated/l10n.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? jwtToken = prefs.getString('jwtToken');
  String? localeCode = prefs.getString('locale');
  Locale initialLocale = localeCode != null ? Locale(localeCode) : Locale('en');
  runApp(MyApp(jwtToken: jwtToken, initialLocale: initialLocale));
}

class MyApp extends StatefulWidget {
  final String? jwtToken;
  final Locale initialLocale;

  const MyApp({Key? key, this.jwtToken, required this.initialLocale})
      : super(key: key);

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  bool isAuthenticated = false;

  @override
  void initState() {
    super.initState();
    _locale = widget.initialLocale;
    if (widget.jwtToken != null) {
      authenticateUser(widget.jwtToken!);
    }
  }

  void authenticateUser(String jwtToken) async {
    print("authentication");

    var url = Uri.parse('https://train-ticket-00vr.onrender.com/api/v1/tours');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $jwtToken',
    };

    try {
      var response = await http.get(
        url,
        headers: headers,
      );
      print(response.body);

      // Check if login was successful
      print(response.statusCode);

      var responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        setState(() {
          isAuthenticated = true;
          return;
        });
      }
      throw Error.safeToString(responseData['message']);
    } catch (e) {
      // Handle network errors
      print(e.toString());
    }
  }

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: _locale,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'Login Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: isAuthenticated ? MyHomePage(currentIndex: 0) : LoginScreen(),
    );
  }
}
