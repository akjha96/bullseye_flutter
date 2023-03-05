class CurrentScore {
  CurrentScore();

  static const _maximumScore = 100;

  int currentScore = 0;

  int differenceInValue = 0;

  int difference(target, currentSliderValue) {
    differenceInValue = (target - currentSliderValue).abs();

    currentScore = _maximumScore - differenceInValue;

    return currentScore;
  }
}
