import 'package:flutter/material.dart';
import 'package:mp_tictactoe/resources/socket_methods.dart';
import 'package:mp_tictactoe/responsive/responsive.dart';
import 'package:mp_tictactoe/widgets/custom_button.dart';
import 'package:mp_tictactoe/widgets/custom_text.dart';
import 'package:mp_tictactoe/widgets/custom_textfield.dart';

import '../utils/colors.dart';

class JoinRoomScreen extends StatefulWidget {
  static String routeName = '/join-room';
  const JoinRoomScreen({Key? key}) : super(key: key);

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  final TextEditingController _gameIdController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.joinRoomSuccessListener(context);
    _socketMethods.errorOccuredListener(context);
    _socketMethods.updatePlayersStateListener(context);
  }

  @override
  void dispose() {
    super.dispose();
    _gameIdController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: gradient3),
        backgroundColor: backgroundColor,
        elevation: 0,
      ),
      body: Responsive(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomText(
              shadows: [
                Shadow(
                  blurRadius: 40,
                  color: gradient2,
                ),
              ],
              text: 'Join Room.',
              fontSize: 70,
            ),
            SizedBox(height: size.height * 0.06),
            CustomTextField(
              controller: _nameController,
              hintText: 'Enter your nickname',
            ),
            SizedBox(height: size.height * 0.045),
            CustomTextField(
              controller: _gameIdController,
              hintText: 'Enter Game ID',
            ),
            SizedBox(height: size.height * 0.045),
            CustomButton(
              onTap: () => _socketMethods.joinRoom(
                _nameController.text,
                _gameIdController.text,
              ),
              text: 'Join',
            ),
          ],
        ),
      ),
    );
  }
}
