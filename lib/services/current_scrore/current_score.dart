class CurrentScore {
  CurrentScore();

  static const _maximumScore = 100;

  int currentScore = 0;

  int differenceInValue = 0;

  int difference(target, currentSliderValue) =>
      differenceInValue = (target - currentSliderValue).abs();

  int calculatedCurrentScore(target, currentSliderValue) =>
      _maximumScore - difference(target, currentSliderValue);
}
