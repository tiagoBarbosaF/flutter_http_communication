import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  final String message;

  // ignore: use_key_in_widget_constructors
  const Progress({this.message = "Loading"});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            strokeWidth: 8.0,
            color: Theme.of(context).colorScheme.primary,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Text(message, style: const TextStyle(fontSize: 24.0)),
          ),
        ],
      ),
    );
  }
}
