import 'package:atzos_assignment/constants/spacing_constants.dart';
import 'package:atzos_assignment/screens/home_page/dateTIme_formatting_functions.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:atzos_assignment/screens/home_page/home_page_classes.dart';
import 'package:maps_launcher/maps_launcher.dart';

class HomePageComponents {
  Widget bookingClassCard(TrailBookClass bookingClass, List<String>? levels,
      bool isSmallScreen, BuildContext context, bool isTrial) {
    String? levelData;
    List<String> listLevels = [];

    for (var element in bookingClass.level!) {
      if (element - 1 < levels!.length) {
        listLevels.add(levels[element - 1]);
      }
    }

    if (levels != null && bookingClass.level!.isNotEmpty) {
      levelData =
          "| ${levels[bookingClass.level![0] - 1]} + ${bookingClass.level!.length - 1}";
    } else {
      levelData = '';
    }
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return classDialog(
                  bookingClass, listLevels, isTrial, isSmallScreen, context);
            });
      },
      child: Card(
        elevation: 7.0,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.02,
            vertical: MediaQuery.of(context).size.height * 0.02,
          ),
          width: isSmallScreen
              ? MediaQuery.of(context).size.width * 0.8
              : MediaQuery.of(context).size.width * 0.27,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    width: isSmallScreen
                        ? MediaQuery.of(context).size.width * 0.3
                        : MediaQuery.of(context).size.width * 0.05,
                    height: MediaQuery.of(context).size.height * 0.08,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/classes_default.png'),
                          fit: BoxFit.contain),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          bookingClass.title,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          //maxLines: 1,
                          style: const TextStyle(fontSize: 18.0),
                        ),
                        AutoSizeText(
                          ' ${bookingClass.sportName} $levelData',
                          maxLines: 1,
                          style: const TextStyle(fontSize: 13.0),
                        ),
                        AutoSizeText(
                          bookingClass.location,
                          maxLines: 1,
                          style: const TextStyle(fontSize: 13.0),
                        ),
                        if (createTimeRangeWidgets(
                                groupDaysByTime(bookingClass.daysOfWeek!))
                            .isNotEmpty)
                          createTimeRangeWidgets(
                              groupDaysByTime(bookingClass.daysOfWeek!))[0]
                      ],
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  if (bookingClass.level!.isNotEmpty) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return levelAlertDialog(listLevels, context);
                        });
                  }
                },
                child: AutoSizeText(
                  isTrial ? 'Free Trial' : 'Book',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: TextStyle(
                    color: bookingClass.level!.isNotEmpty
                        ? Colors.grey
                        : Colors.green,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Dialog classDialog(TrailBookClass dialogClass, List<String> listLevels,
      bool isTrial, bool isSmallScreen, BuildContext context) {
    String levelsCommon = '${dialogClass.sportName} |';

    for (int i = 0; i < listLevels.length; i++) {
      levelsCommon =
          '$levelsCommon ${listLevels[i]}${i + 1 < listLevels.length ? ", " : ""}';
    }

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.03,
            horizontal: MediaQuery.of(context).size.width * 0.03),
        width: isSmallScreen
            ? MediaQuery.of(context).size.width * 0.8
            : MediaQuery.of(context).size.width * 0.3,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: isSmallScreen
                    ? MediaQuery.of(context).size.width * 0.8
                    : MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: AssetImage('assets/classes_default.png'),
                        fit: BoxFit.fill)),
              ),
              SpacingConstants().heightBetweenFieldsSmall(context),
              AutoSizeText(
                dialogClass.title,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              AutoSizeText(
                levelsCommon,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: const TextStyle(fontSize: 15.0),
              ),
              const Divider(
                color: Colors.black,
              ),
              const AutoSizeText(
                'Address',
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    dialogClass.location,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: const TextStyle(fontSize: 15.0),
                  ),
                  IconButton(
                      onPressed: () {
                        MapsLauncher.launchCoordinates(
                            dialogClass.lat, dialogClass.lon);
                      },
                      icon: const Icon(Icons.location_pin)),
                ],
              ),
              SpacingConstants().heightBetweenFieldsSmall(context),
              const AutoSizeText(
                'Timings',
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: createTimeRangeWidgets(
                    groupDaysByTime(dialogClass.daysOfWeek!)),
              ),
              Center(
                  child: TextButton(
                onPressed: () {
                  if (dialogClass.level!.isNotEmpty) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return levelAlertDialog(listLevels, context);
                        });
                  }
                },
                child: AutoSizeText(
                  isTrial ? 'Free Trial' : 'Book',
                  maxLines: 1,
                  style: TextStyle(
                    color: dialogClass.level!.isNotEmpty
                        ? Colors.grey
                        : Colors.green,
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  Dialog levelAlertDialog(List<String>? levels, BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.02,
            horizontal: MediaQuery.of(context).size.width * 0.02),
        width: MediaQuery.of(context).size.width * 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            AutoSizeText(
              'We require you to be assigned the ${levels.toString()} level to book this class.If you are our client and have this level assigned, you may BOOK by logging in.',
              maxLines: 4,
              style: const TextStyle(fontSize: 15.0),
            ),
            SpacingConstants().heightBetweenFieldsSmall(context),
            const AutoSizeText(
              'If you are not our client, please contact us at 9876543210 to BOOK this class',
              maxLines: 4,
              style: TextStyle(fontSize: 15.0),
            ),
            SpacingConstants().heightBetweenFieldsSmall(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const AutoSizeText('Ok'),
                ),
                SpacingConstants().widthBetweenFieldsMid(context),
                ElevatedButton(
                  onPressed: () {},
                  child: const AutoSizeText('Login'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
