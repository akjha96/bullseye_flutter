class CurrentScore {
  CurrentScore();

  static const _maximumScore = 100;

  int currentScore = 0;

  int differenceInValue = 0;

  int difference(target, currentSliderValue) =>
      differenceInValue = (target - currentSliderValue).abs();

  int calculatedCurrentScore(target, currentSliderValue) {
    int bonus = 0;
    var difference = this.difference(target, currentSliderValue);
    if (difference == 0) {
      bonus = 100;
    } else if (difference == 1) {
      bonus = 50;
    }
    return _maximumScore - difference + bonus;
  }
}
