import 'package:flutter/widgets.dart';

class SpacingConstants {
  SizedBox heightBetweenFieldsSmall(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.03,
    );
  }

  SizedBox heightBetweenFieldsMed(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.05,
    );
  }

  SizedBox heightBetweenFieldsLarge(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
    );
  }

  SizedBox widthBetweenFieldsSmall(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.03,
    );
  }

  SizedBox widthBetweenFieldsMid(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.05,
    );
  }

  SizedBox widthBetweenFieldsLarge(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.1,
    );
  }
}
