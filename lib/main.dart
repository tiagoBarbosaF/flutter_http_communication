import 'package:flutter/material.dart';

import 'screens/dashboard.dart';

void main() => runApp(const MyBankApp());

class MyBankApp extends StatelessWidget {
  const MyBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal)
              .copyWith(secondary: Colors.tealAccent[900]),
        ),
        home: const Dashboard());
  }
}
