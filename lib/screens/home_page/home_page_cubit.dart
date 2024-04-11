import 'package:http/http.dart' as http;
import 'package:atzos_assignment/screens/home_page/home_page_classes.dart';
import 'package:atzos_assignment/screens/home_page/home_page_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageState());

  Future<void> getDataWithClassesEmit() async {
    emit(HomePageDataLoadingState());
    List<TrailBookClass> bookingClassesList = [];
    List<TrailBookClass> trialClassesList = [];

    Dio dio = Dio();

    Response response1 = await dio.get(
        'https://devconnect.spyn.co/api/web/v4/homepage/index?venue_id=729');

    var bookingClassesData = response1.data['booking_classes'];
    var trialClassesData = response1.data['trial_classes'];
    var levelList = response1.data['level_list'];
    var persons = response1.data['team'];

    List<String> levels =
        levelList.values.map<String>((value) => value.toString()).toList();

    for (int i = 0; i < bookingClassesData.length; i++) {
      TrailBookClass bookingClass =
          TrailBookClass.fromJson(bookingClassesData[i]);
      bookingClassesList.add(bookingClass);
    }

    emit(HomePageDataLoadedState(
        bookingClasses: bookingClassesList, levels: levels));
  }
}
