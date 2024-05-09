import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:train_ticket/Const.dart';
import 'package:train_ticket/Screen/LoginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:train_ticket/generated/l10n.dart';
import 'package:train_ticket/main.dart';
import 'changePassword.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool notificationEnabled = false;
  bool ticketReminderEnabled = false;
  bool appUpdateEnabled = false;
  String? userName;
  String _previousLocale = 'en'; // Default previous locale
  final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>(); 

  Future<void> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('jwtToken');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    fetchUserName(); // Fetch user's name when the widget initializes
  }

  Future<void> fetchUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('userName');
    });
  }

  Future<void> changeLanguage() async {
    String newLocale = (_previousLocale == 'ar') ? 'en' : 'ar';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('previousLocale', _previousLocale);
    await prefs.setString('locale', newLocale);
    setState(() {
      _previousLocale = newLocale;
    });
    MyApp.setLocale(context, Locale(newLocale));
    _scaffoldKey.currentState?.setState(() {}); // Refresh the scaffold
  }

  Future<void> revertLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String previousLocale = prefs.getString('previousLocale') ?? 'en';
    await prefs.setString('locale', previousLocale);
    setState(() {
      _previousLocale = previousLocale;
    });
    MyApp.setLocale(context, Locale(previousLocale));
    _scaffoldKey.currentState?.setState(() {}); // Refresh the scaffold
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Scolor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: IconButton(
              icon: const Icon(
                Icons.logout,
                size: 25,
                color: Colors.grey,
              ),
              onPressed: _logout,
            ),
          )
        ],
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.transparent,
          ),
          onPressed: () {},
        ),
        title: Text(
          S.of(context).settings,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          Card(
            elevation: 8.0,
            margin: const EdgeInsets.all(8.0),
            color: Pcolor,
            child: ListTile(
              onTap: () {
                // fun to add user
              },
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  userName ?? '',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 25),
                ),
              ),
              leading: const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('image/Avatar.png'),
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Card(
            margin: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16),
            elevation: 8.0,
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.lock_outline,
                    color: Pcolor,
                  ),
                  title: Text(S.of(context).changepassword),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    // open page change password
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            (const changePassword()), // Navigate to HomePage
                      ),
                    );
                  },
                ),
                const Divider(
                  color: Colors.grey,
                  endIndent: 5,
                  indent: 5,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.translate,
                    color: Pcolor,
                  ),
                  title: Text(S.of(context).changelanguage),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () async {
                    if (_previousLocale != 'ar') {
                      await changeLanguage();
                    } else {
                      await revertLanguage();
                    }
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              S.of(context).notificationsettings,
              style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange),
            ),
          ),
          Switchbutton(
            S.of(context).receivedNotification,
            notificationEnabled,
            (value) {
              setState(() {
                notificationEnabled = value;
              });
            },
            Icons.notifications, // Icon for notifications
          ),
          Switchbutton(
            S.of(context).ticketReminder,
            ticketReminderEnabled,
            (value) {
              setState(() {
                ticketReminderEnabled = value;
              });
            },
            Icons.event_note, // Icon for ticket reminder
          ),
          Switchbutton(
            S.of(context).receivedAppUpdate,
            appUpdateEnabled,
            (value) {
              setState(() {
                appUpdateEnabled = value;
              });
            },
            Icons.system_update, // Icon for app updates
          ),
        ],
      ),
    );
  }

  Widget Switchbutton(
      String name, bool currentValue, Function(bool) onChanged, IconData icon) {
    return SwitchListTile(
      contentPadding: const EdgeInsets.all(5),
      value: currentValue,
      title: Text(
        name,
        style: const TextStyle(color: Colors.white, fontSize: 17),
      ),
      onChanged: onChanged,
      secondary: Icon(icon, color: Colors.red), 
    );
  }
}
