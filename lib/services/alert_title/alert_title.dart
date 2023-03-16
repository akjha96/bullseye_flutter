import 'package:bullseye_flutter/constants/constants.dart' as constants;

String alertTitle(int difference) {
  String title;
  if (difference == 0) {
    title = constants.perfect;
  } else if (difference <= 5) {
    title = constants.youAlmostHadIt;
  } else if (difference <= 10) {
    title = constants.notBad;
  } else {
    title = constants.areYouEvenTyring;
  }

  return title;
}
