import 'package:atzos_assignment/screens/home_page/home_page_classes.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

class HomePageState {}

class HomePageDataLoadingState extends HomePageState {}

@CopyWith()
class HomePageDataLoadedState extends HomePageState {
  List<TrailBookClass>? bookingClasses;
  List<TrailBookClass>? trailClasses;
  List<String>? levels;
  List<TeamMember>? teamMembers;
  List<Plan>? plans;
  BasicData? footerInfo;

  HomePageDataLoadedState({
    this.bookingClasses,
    this.trailClasses,
    this.levels,
    this.teamMembers,
    this.plans,
    this.footerInfo,
  });
}
