import 'package:flutter/material.dart';
import 'package:mp_tictactoe/provider/room_data_provider.dart';
import 'package:mp_tictactoe/responsive/responsive.dart';
import 'package:mp_tictactoe/widgets/custom_text.dart';
import 'package:mp_tictactoe/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

import '../utils/colors.dart';

class WaitingLobby extends StatefulWidget {
  const WaitingLobby({Key? key}) : super(key: key);

  @override
  State<WaitingLobby> createState() => _WaitingLobbyState();
}

class _WaitingLobbyState extends State<WaitingLobby> {
  late TextEditingController roomIdController;

  @override
  void initState() {
    super.initState();
    roomIdController = TextEditingController(
      text:
          Provider.of<RoomDataProvider>(context, listen: false).roomData['_id'],
    );
  }

  @override
  void dispose() {
    super.dispose();
    roomIdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Responsive(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomText(shadows: [
              Shadow(blurRadius: 5, color: gradient2),
            ], text: 'Waiting for second player', fontSize: 50),
            const SizedBox(height: 30),
            const Text('Your room code is:'),
            Padding(padding: EdgeInsets.all(8.0)),
            CustomTextField(
              controller: roomIdController,
              hintText: 'room code',
              isReadOnly: true,
            ),
            const SizedBox(height: 30),
            const CircularProgressIndicator(
              color: gradient3,
            ),
          ],
        ),
    );
  }
}