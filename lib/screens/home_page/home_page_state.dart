import 'package:atzos_assignment/screens/home_page/home_page_classes.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

class HomePageState {}

class HomePageDataLoadingState extends HomePageState {}

@CopyWith()
class HomePageDataLoadedState extends HomePageState {
  List<TrailBookClass>? bookingClasses;
  List<TrailBookClass>? trailClasses;

  HomePageDataLoadedState({
    this.bookingClasses,
    this.trailClasses,
  });
}
