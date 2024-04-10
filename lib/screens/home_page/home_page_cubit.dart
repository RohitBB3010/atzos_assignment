import 'package:atzos_assignment/screens/home_page/home_page_classes.dart';
import 'package:atzos_assignment/screens/home_page/home_page_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageState());

  Future<void> getDataWithClassesEmit() async {
    List<BookingClass> bookingClassesList = [];
    print('function called');
    Dio dio = Dio();
    Response response = await dio.get(
        'https://devconnect.spyn.co/api/web/v4/homepage/index?venue_id=729');
    List<dynamic> bookingClasses = response.data['booking_classes'];

    for (int i = 0; i < bookingClasses.length; i++) {
      print(i);
      BookingClass myClass = BookingClass.fromJson(bookingClasses[i]);
      print(myClass);
    }
  }
}
