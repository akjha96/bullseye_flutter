import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  const Score({super.key, required this.totalScore, required this.round});

  final int totalScore;
  final int round;

  Widget _buildRoundDetails() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Round: '),
            Text('$round'),
          ],
        ),
      );

  Widget _buildScoreDetails() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Score: '),
            Text('$totalScore'),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {},
          child: const Text('Start Over'),
        ),
        _buildScoreDetails(),
        _buildRoundDetails(),
        TextButton(
          onPressed: () {},
          child: const Text('Info'),
        ),
      ],
    );
  }
}
