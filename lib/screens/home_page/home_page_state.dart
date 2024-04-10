import 'package:atzos_assignment/screens/home_page/home_page_classes.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

@CopyWith()
class HomePageState {
  List<BookingClass>? bookingClasses;
  List<TrialClass>? trailClasses;
  List<Plan>? plans;

  HomePageState({
    this.bookingClasses,
    this.trailClasses,
    this.plans,
  });
}
