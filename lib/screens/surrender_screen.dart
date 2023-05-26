import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mp_tictactoe/resources/socket_methods.dart';
import 'package:mp_tictactoe/responsive/responsive.dart';
import 'package:mp_tictactoe/utils/colors.dart';
import 'package:mp_tictactoe/widgets/custom_button.dart';
import 'package:mp_tictactoe/widgets/custom_text.dart';
import 'package:provider/provider.dart';

import '../provider/room_data_provider.dart';

class SurrenderScreen extends StatefulWidget {
  const SurrenderScreen({Key? key}) : super(key: key);

  @override
  State<SurrenderScreen> createState() => _SurrenderScreenState();
}

class _SurrenderScreenState extends State<SurrenderScreen> {
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.exitGameListener(context);
  }

  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);
    return Scaffold(
      appBar: AppBar(
          leading: const BackButton(
        color: gradient2,
      )),
      body: Responsive(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomText(
              shadows: [
                Shadow(
                  blurRadius: 40,
                  color: gradient2,
                ),
              ],
              text: 'Press button to confirm surrender </3 ?',
              fontSize: 30,
            ),
            const Padding(padding: EdgeInsets.all(8.0)),
            CustomButton(
                onTap: () {
                  _socketMethods.exitGame(roomDataProvider.roomData['_id']);
                  Navigator.popUntil(context, ModalRoute.withName('/main-menu'));
                  log('зашло в ехит гейм по идее');
                },
                text: 'yes'),
          ],
        ),
      ),
    );
  }
}
