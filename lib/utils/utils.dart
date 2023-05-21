import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mp_tictactoe/resources/game_methods.dart';

import '../resources/socket_methods.dart';

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}

void showGameDialog(BuildContext context, String text) {
  final SocketMethods _socketMethods = SocketMethods();
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(text),
          actions: [
            TextButton(
              onPressed: () {
                GameMethods().clearBoard(context);
                Navigator.pop(context);
              },
              child: const Text(
                'Play Again',
              ),
            ),
            TextButton(
              onPressed: () {
                _socketMethods.revengeListener(context);
                GameMethods().clearBoard(context);
                Navigator.pop(context);
              },
              child: const Text('Surrender'),
            )
          ],
        );
      });
}
