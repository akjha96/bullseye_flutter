import 'dart:math';

import 'package:bullseye_flutter/models/game_models/game_models.dart';
import 'package:bullseye_flutter/services/current_scrore/current_score.dart';
import 'package:bullseye_flutter/widgets/score/score.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// custom Widgets
import 'widgets/prompt/prompt.dart';
import 'widgets/control/control.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const BullsEyeApp();
  }
}

class BullsEyeApp extends StatelessWidget {
  const BullsEyeApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
        title: 'Bullseye',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const GamePage());
  }
}

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late GameModel _model;

  @override
  void initState() {
    super.initState();
    _model = GameModel(Random().nextInt(100) + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bullseye',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Prompt(targetValue: _model.target),
            Control(
              model: _model,
            ),
            Score(
              totalScore: _model.totalScore,
              round: _model.round,
            ),
            SizedBox(
              width: 100,
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue),
                  foregroundColor: MaterialStatePropertyAll(Colors.white70),
                ),
                onPressed: () {
                  _showPopUp(context);
                },
                child: const Text(
                  'Hit Me!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  int _pointsForCurrentRound() {
    return CurrentScore().difference(_model.target, _model.current);
  }

  void _showPopUp(BuildContext context) {
    var okButton = TextButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: const Text('Ok'),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Hello There!'),
          content: Text('The Slider\'s value is ${_model.current} \n'
              'You have scored ${_pointsForCurrentRound()} in this round!'),
          actions: [
            okButton,
          ],
          elevation: 5,
        );
      },
    );
  }
}
