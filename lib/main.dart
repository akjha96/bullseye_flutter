import 'dart:math';
import 'dart:io' show Platform;

import 'package:bullseye_flutter/constants/buttons/buttons_constants.dart';
import 'package:bullseye_flutter/models/game_models/game_models.dart';
import 'package:bullseye_flutter/services/alert_title/alert_title.dart';
import 'package:bullseye_flutter/services/current_scrore/current_score.dart';
import 'package:bullseye_flutter/widgets/score/score.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// custom Widgets
import 'package:bullseye_flutter/widgets/game_description/game_description.dart';
import 'package:bullseye_flutter/widgets/control/control.dart';

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

  void _startNewGame() {
    setState(() {
      _model.reset(_model);
    });
  }

  Widget _buildScaffold() => Scaffold(
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
              GameDescription(targetValue: _model.target),
              Control(
                model: _model,
              ),
              Score(
                onStartOver: _startNewGame,
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

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? SafeArea(
            child: _buildScaffold(),
          )
        : _buildScaffold();
  }

  void _showPopUp(BuildContext context) {
    int pointsForCurrentRound =
        CurrentScore().calculatedCurrentScore(_model.target, _model.current);
    int difference = CurrentScore().difference(_model.target, _model.current);
    int totalScore = pointsForCurrentRound + _model.totalScore;

    Widget okButton = Center(
      child: TextButton(
        onPressed: () {
          Navigator.of(context).pop();
          setState(() {
            _model.updateValues(
              target: _model.newTargetValue(),
              totalScore: totalScore,
            );
          });
        },
        child: const Text(ButtonsConstants.awesome),
      ),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(alertTitle(difference)),
          content: Text('The Slider\'s value is ${_model.current} \n'
              'You have scored $pointsForCurrentRound in this round!'),
          actions: [
            okButton,
          ],
          elevation: 5,
        );
      },
    );
  }
}
