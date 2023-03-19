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

  int newTargetValue() => Random().nextInt(100) + 1;

  void updateValues({required int target, required int totalScore}) {
    this.target = target;
    this.totalScore = totalScore;
    current = newTargetValue();
    round += 1;
  }

  void reset(GameModel model) {
    model.target = newTargetValue();
    model.current = sliderStart;
    model.totalScore = scoreStart;
    model.round = roundStart;
  }
}
