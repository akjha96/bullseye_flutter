import 'dart:math';

class GameModel {
  GameModel(
    this.target, [
    this.current = sliderStart,
    this.totalScore = scoreStart,
    this.round = roundStart,
  ]);

  static const sliderStart = 50;
  static const scoreStart = 0;
  static const roundStart = 1;

  int target;
  int current;
  int totalScore;
  int round;

  void updateValues({required int target, required int totalScore}) {
    this.target = target;
    this.totalScore = totalScore;
    current = Random().nextInt(100) + 1;
    round += 1;
  }
}
