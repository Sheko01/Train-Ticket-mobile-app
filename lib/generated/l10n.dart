// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `username`
  String get username {
    return Intl.message(
      'username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Notification Settings`
  String get notificationsettings {
    return Intl.message(
      'Notification Settings',
      name: 'notificationsettings',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changepassword {
    return Intl.message(
      'Change Password',
      name: 'changepassword',
      desc: '',
      args: [],
    );
  }

  /// `Change language`
  String get changelanguage {
    return Intl.message(
      'Change language',
      name: 'changelanguage',
      desc: '',
      args: [],
    );
  }

  /// `Change Location`
  String get changelocation {
    return Intl.message(
      'Change Location',
      name: 'changelocation',
      desc: '',
      args: [],
    );
  }

  /// `Received Notification`
  String get receivedNotification {
    return Intl.message(
      'Received Notification',
      name: 'receivedNotification',
      desc: '',
      args: [],
    );
  }

  /// `Ticket Reminder`
  String get ticketReminder {
    return Intl.message(
      'Ticket Reminder',
      name: 'ticketReminder',
      desc: '',
      args: [],
    );
  }

  /// `Received App Update`
  String get receivedAppUpdate {
    return Intl.message(
      'Received App Update',
      name: 'receivedAppUpdate',
      desc: '',
      args: [],
    );
  }

  /// `Book your Ticket Today`
  String get bookyourtickettoday {
    return Intl.message(
      'Book your Ticket Today',
      name: 'bookyourtickettoday',
      desc: '',
      args: [],
    );
  }

  /// `One Way`
  String get oneway {
    return Intl.message(
      'One Way',
      name: 'oneway',
      desc: '',
      args: [],
    );
  }

  /// `Rounded-Trip`
  String get roundedtrip {
    return Intl.message(
      'Rounded-Trip',
      name: 'roundedtrip',
      desc: '',
      args: [],
    );
  }

  /// `From:`
  String get from {
    return Intl.message(
      'From:',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `To:`
  String get to {
    return Intl.message(
      'To:',
      name: 'to',
      desc: '',
      args: [],
    );
  }

  /// `Depart`
  String get depart {
    return Intl.message(
      'Depart',
      name: 'depart',
      desc: '',
      args: [],
    );
  }

  /// `Return`
  String get returnn {
    return Intl.message(
      'Return',
      name: 'returnn',
      desc: '',
      args: [],
    );
  }

  /// `Passenger`
  String get passenger {
    return Intl.message(
      'Passenger',
      name: 'passenger',
      desc: '',
      args: [],
    );
  }

  /// `Child`
  String get child {
    return Intl.message(
      'Child',
      name: 'child',
      desc: '',
      args: [],
    );
  }

  /// `Adult`
  String get adult {
    return Intl.message(
      'Adult',
      name: 'adult',
      desc: '',
      args: [],
    );
  }

  /// `Train Classes:`
  String get trainclasses {
    return Intl.message(
      'Train Classes:',
      name: 'trainclasses',
      desc: '',
      args: [],
    );
  }

  /// `Business Class`
  String get businessclass {
    return Intl.message(
      'Business Class',
      name: 'businessclass',
      desc: '',
      args: [],
    );
  }

  /// `Second Class`
  String get secondclass {
    return Intl.message(
      'Second Class',
      name: 'secondclass',
      desc: '',
      args: [],
    );
  }

  /// `Economy Class`
  String get economyclass {
    return Intl.message(
      'Economy Class',
      name: 'economyclass',
      desc: '',
      args: [],
    );
  }

  /// `Alexandria`
  String get alexandria {
    return Intl.message(
      'Alexandria',
      name: 'alexandria',
      desc: '',
      args: [],
    );
  }

  /// `Tanta`
  String get tanta {
    return Intl.message(
      'Tanta',
      name: 'tanta',
      desc: '',
      args: [],
    );
  }

  /// `Cairo`
  String get cairo {
    return Intl.message(
      'Cairo',
      name: 'cairo',
      desc: '',
      args: [],
    );
  }

  /// `Beni Suef`
  String get benisuef {
    return Intl.message(
      'Beni Suef',
      name: 'benisuef',
      desc: '',
      args: [],
    );
  }

  /// `Minya`
  String get minya {
    return Intl.message(
      'Minya',
      name: 'minya',
      desc: '',
      args: [],
    );
  }

  /// `Assiut`
  String get assiut {
    return Intl.message(
      'Assiut',
      name: 'assiut',
      desc: '',
      args: [],
    );
  }

  /// `Sohag`
  String get sohag {
    return Intl.message(
      'Sohag',
      name: 'sohag',
      desc: '',
      args: [],
    );
  }

  /// `Luxor`
  String get luxor {
    return Intl.message(
      'Luxor',
      name: 'luxor',
      desc: '',
      args: [],
    );
  }

  /// `Aswan`
  String get aswan {
    return Intl.message(
      'Aswan',
      name: 'aswan',
      desc: '',
      args: [],
    );
  }

  /// `Book`
  String get book {
    return Intl.message(
      'Book',
      name: 'book',
      desc: '',
      args: [],
    );
  }

  /// `Value`
  String get value {
    return Intl.message(
      'Value',
      name: 'value',
      desc: '',
      args: [],
    );
  }

  /// `SIGN IN`
  String get si {
    return Intl.message(
      'SIGN IN',
      name: 'si',
      desc: '',
      args: [],
    );
  }

  /// `Travel Wherever you want with the best price`
  String get tw {
    return Intl.message(
      'Travel Wherever you want with the best price',
      name: 'tw',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Email`
  String get eye {
    return Intl.message(
      'Enter your Email',
      name: 'eye',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get eyp {
    return Intl.message(
      'Enter your password',
      name: 'eyp',
      desc: '',
      args: [],
    );
  }

  /// `Forgot your password`
  String get fyp {
    return Intl.message(
      'Forgot your password',
      name: 'fyp',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Need an Account?`
  String get naa {
    return Intl.message(
      'Need an Account?',
      name: 'naa',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `---------------  Or Login with  --------------`
  String get olw {
    return Intl.message(
      '---------------  Or Login with  --------------',
      name: 'olw',
      desc: '',
      args: [],
    );
  }

  /// `Ready to join us..?`
  String get rtju {
    return Intl.message(
      'Ready to join us..?',
      name: 'rtju',
      desc: '',
      args: [],
    );
  }

  /// `Please fill the following fields`
  String get pftff {
    return Intl.message(
      'Please fill the following fields',
      name: 'pftff',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Name`
  String get eyn {
    return Intl.message(
      'Enter your Name',
      name: 'eyn',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number`
  String get eypn {
    return Intl.message(
      'Enter your phone number',
      name: 'eypn',
      desc: '',
      args: [],
    );
  }

  /// `Confirm your password`
  String get cyp {
    return Intl.message(
      'Confirm your password',
      name: 'cyp',
      desc: '',
      args: [],
    );
  }

  /// `Already a user?`
  String get aau {
    return Intl.message(
      'Already a user?',
      name: 'aau',
      desc: '',
      args: [],
    );
  }

  /// `Seats`
  String get seats {
    return Intl.message(
      'Seats',
      name: 'seats',
      desc: '',
      args: [],
    );
  }

  /// `KG`
  String get kg {
    return Intl.message(
      'KG',
      name: 'kg',
      desc: '',
      args: [],
    );
  }

  /// `Baggage`
  String get baggage {
    return Intl.message(
      'Baggage',
      name: 'baggage',
      desc: '',
      args: [],
    );
  }

  /// `Ticket`
  String get ticket {
    return Intl.message(
      'Ticket',
      name: 'ticket',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Class`
  String get classs {
    return Intl.message(
      'Class',
      name: 'classs',
      desc: '',
      args: [],
    );
  }

  /// `Your Tickets`
  String get yourt {
    return Intl.message(
      'Your Tickets',
      name: 'yourt',
      desc: '',
      args: [],
    );
  }

  /// `Depart Date`
  String get departd {
    return Intl.message(
      'Depart Date',
      name: 'departd',
      desc: '',
      args: [],
    );
  }

  /// `Return Date`
  String get returnd {
    return Intl.message(
      'Return Date',
      name: 'returnd',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get forgotpassword {
    return Intl.message(
      'Forgot Password',
      name: 'forgotpassword',
      desc: '',
      args: [],
    );
  }

  /// `Provide your email and we will send you a link to reset your password`
  String get pyetl {
    return Intl.message(
      'Provide your email and we will send you a link to reset your password',
      name: 'pyetl',
      desc: '',
      args: [],
    );
  }

  /// `Rest Password`
  String get reset {
    return Intl.message(
      'Rest Password',
      name: 'reset',
      desc: '',
      args: [],
    );
  }

  /// `Enter the provided code`
  String get etpc {
    return Intl.message(
      'Enter the provided code',
      name: 'etpc',
      desc: '',
      args: [],
    );
  }

  /// `Enter your New password`
  String get eynp {
    return Intl.message(
      'Enter your New password',
      name: 'eynp',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Confirm password`
  String get eycp {
    return Intl.message(
      'Enter your Confirm password',
      name: 'eycp',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Current password`
  String get eycurrp {
    return Intl.message(
      'Enter your Current password',
      name: 'eycurrp',
      desc: '',
      args: [],
    );
  }

  /// `Missing Information`
  String get mi {
    return Intl.message(
      'Missing Information',
      name: 'mi',
      desc: '',
      args: [],
    );
  }

  /// `Please fill in all required fields.`
  String get pfiarf {
    return Intl.message(
      'Please fill in all required fields.',
      name: 'pfiarf',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Failed to Change Password`
  String get ftcp {
    return Intl.message(
      'Failed to Change Password',
      name: 'ftcp',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect Password`
  String get incp {
    return Intl.message(
      'Incorrect Password',
      name: 'incp',
      desc: '',
      args: [],
    );
  }

  /// `Login Failed`
  String get lif {
    return Intl.message(
      'Login Failed',
      name: 'lif',
      desc: '',
      args: [],
    );
  }

  /// `'Failed to send code'`
  String get ftsc {
    return Intl.message(
      '\'Failed to send code\'',
      name: 'ftsc',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Old password`
  String get eyop {
    return Intl.message(
      'Enter your Old password',
      name: 'eyop',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
