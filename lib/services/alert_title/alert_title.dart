import 'package:bullseye_flutter/constants/titles/titles.dart';

String alertTitle(int difference) {
  String title;
  if (difference == 0) {
    title = Titles.perfect;
  } else if (difference <= 5) {
    title = Titles.youAlmostHadIt;
  } else if (difference <= 10) {
    title = Titles.notBad;
  } else {
    title = Titles.areYouEvenTyring;
  }

  return title;
}
