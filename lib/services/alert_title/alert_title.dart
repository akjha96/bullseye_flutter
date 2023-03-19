import 'package:bullseye_flutter/constants/titles/titles_constants.dart';

String alertTitle(int difference) {
  String title;
  if (difference == 0) {
    title = TitlesConstants.perfect;
  } else if (difference <= 5) {
    title = TitlesConstants.youAlmostHadIt;
  } else if (difference <= 10) {
    title = TitlesConstants.notBad;
  } else {
    title = TitlesConstants.areYouEvenTyring;
  }

  return title;
}
