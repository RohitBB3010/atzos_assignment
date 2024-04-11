import 'package:atzos_assignment/components/custom_appbar.dart';
import 'package:atzos_assignment/components/custom_bottom_nav.dart';
import 'package:atzos_assignment/constants/spacing_constants.dart';
import 'package:atzos_assignment/screens/home_page/home_page_classes.dart';
import 'package:atzos_assignment/screens/home_page/home_page_cubit.dart';
import 'package:atzos_assignment/screens/home_page/home_page_state.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageCubit()..getDataWithClassesEmit(),
      child: Scaffold(
        appBar: CustomAppBar(
          titleText: 'Home',
          context: context,
        ),
        bottomNavigationBar: MediaQuery.of(context).size.width < 700
            ? const CustomBottomNav()
            : null,
        body: BlocBuilder<HomePageCubit, HomePageState>(
          builder: (context, state) {
            if (state is HomePageDataLoadingState) {
              return AutoSizeText('Loading');
            }

            if (state is HomePageDataLoadedState) {
              return Column(
                children: [
                  const AutoSizeText('Here advertisement will come'),
                  SpacingConstants().heightBetweenFieldsMed(context),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Wrap(
                          children: state.bookingClasses!.map((bookingClass) {
                            return bookingClassCard(
                                bookingClass, state.levels, context);
                          }).toList(),
                        )
                      ],
                    ),
                  )
                ],
              );
            }

            return Container();
          },
        ),
      ),
    );
  }

  Card bookingClassCard(
      TrailBookClass bookingClass, List<String>? levels, BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    String? levelData;

    if (levels != null && bookingClass.level!.isNotEmpty) {
      levelData =
          "| ${levels[bookingClass.level![0] - 1]} + ${bookingClass.level!.length - 1}";
    } else {
      levelData = '';
    }

    //groupDaysByTime(bookingClass.daysOfWeek!);
    if (bookingClass.daysOfWeek != null) {
      groupDaysByTime(bookingClass.daysOfWeek!);
    }
    return Card(
      elevation: 3.0,
      child: SizedBox(
        width: screenWidth <= 700
            ? MediaQuery.of(context).size.width * 0.8
            : MediaQuery.of(context).size.width * 0.25,
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  bookingClass.title,
                  maxLines: 1,
                ),
                AutoSizeText(' ${bookingClass.sportName} $levelData'),
                AutoSizeText(bookingClass.location)
              ],
            )
          ],
        ),
      ),
    );
  }

  Map<String, List<int>> groupDaysByTime(List<Day> days) {
    Map<String, List<int>> groupedDays = {};

    if (days.isNotEmpty) {
      for (var day in days) {
        String key = '${day.startTime} - ${day.endTime}';
        if (!groupedDays.containsKey(key)) {
          if (day.day != null) {
            groupedDays[key] = [day.day!];
          }
        } else {
          groupedDays[key]!.add(day.day!);
        }
      }
    }

    return groupedDays;
  }
}
