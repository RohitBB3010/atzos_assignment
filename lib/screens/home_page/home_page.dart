import 'package:atzos_assignment/components/custom_appbar.dart';
import 'package:atzos_assignment/components/custom_bottom_nav.dart';
import 'package:atzos_assignment/constants/spacing_constants.dart';
import 'package:atzos_assignment/screens/home_page/home_page_classes.dart';
import 'package:atzos_assignment/screens/home_page/home_page_cubit.dart';
import 'package:atzos_assignment/screens/home_page/home_page_state.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
              return const AutoSizeText('Loading');
            }

            if (state is HomePageDataLoadedState) {
              double screenWidth = MediaQuery.of(context).size.width;
              bool isSmallScreen = screenWidth <= 700 ? true : false;
              return SingleChildScrollView(
                  child: Column(
                children: [
                  footer(state.footerInfo!, context),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const AutoSizeText('Here advertisement will come'),
                        SpacingConstants().heightBetweenFieldsMed(context),
                        const AutoSizeText(
                          'Plans',
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.bold),
                        ),
                        SpacingConstants().heightBetweenFieldsSmall(context),
                        Wrap(
                          spacing: MediaQuery.of(context).size.width * 0.02,
                          runSpacing: MediaQuery.of(context).size.height * 0.03,
                          children: state.plans!.map((plan) {
                            return planCard(plan, isSmallScreen, context);
                          }).toList(),
                        ),
                        SpacingConstants().heightBetweenFieldsLarge(context),
                        const AutoSizeText(
                          'Classes',
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.bold),
                        ),
                        SpacingConstants().heightBetweenFieldsSmall(context),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Wrap(
                                spacing:
                                    MediaQuery.of(context).size.width * 0.03,
                                runSpacing:
                                    MediaQuery.of(context).size.height * 0.03,
                                children:
                                    state.bookingClasses!.map((bookingClass) {
                                  return bookingClassCard(
                                      bookingClass,
                                      state.levels,
                                      isSmallScreen,
                                      context,
                                      false);
                                }).toList(),
                              ),
                              SpacingConstants()
                                  .heightBetweenFieldsLarge(context),
                              const AutoSizeText(
                                'Trial Classes',
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SpacingConstants()
                                  .heightBetweenFieldsSmall(context),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Wrap(
                                      spacing:
                                          MediaQuery.of(context).size.width *
                                              0.03,
                                      runSpacing:
                                          MediaQuery.of(context).size.height *
                                              0.03,
                                      children: state.bookingClasses!
                                          .map((bookingClass) {
                                        return bookingClassCard(
                                            bookingClass,
                                            state.levels,
                                            isSmallScreen,
                                            context,
                                            true);
                                      }).toList(),
                                    ),
                                    SpacingConstants()
                                        .heightBetweenFieldsLarge(context),
                                    const AutoSizeText(
                                      'Teams',
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SpacingConstants()
                                        .heightBetweenFieldsSmall(context),
                                    if (state.teamMembers != null)
                                      Wrap(
                                        spacing:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                        runSpacing:
                                            MediaQuery.of(context).size.height *
                                                0.03,
                                        children:
                                            state.teamMembers!.map((member) {
                                          return isSmallScreen
                                              ? smallTeamWidget(member, context)
                                              : largeTeamWidget(
                                                  member, context);
                                        }).toList(),
                                      )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SpacingConstants().heightBetweenFieldsLarge(context),
                      ],
                    ),
                  ),
                ],
              ));
            }

            return Container();
          },
        ),
      ),
    );
  }

  Card bookingClassCard(TrailBookClass bookingClass, List<String>? levels,
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
    return Card(
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      bookingClass.title,
                      maxLines: 1,
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
                    )
                  ],
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
            ),
            SpacingConstants().heightBetweenFieldsSmall(context),
            const AutoSizeText(
              'If you are not our client, please contact us at 9876543210 to BOOK this class',
              maxLines: 4,
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

  Widget largeTeamWidget(TeamMember member, BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: MediaQuery.of(context).size.width * 0.025,
            backgroundColor: Colors.amber,
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: MediaQuery.of(context).size.width * 0.03,
            ),
          ),
          SpacingConstants().heightBetweenFieldsSmall(context),
          AutoSizeText(
            member.userName,
            maxLines: 1,
            style: const TextStyle(fontSize: 20.0),
          ),
          if (member.designation != null)
            AutoSizeText(
              member.designation!,
              maxLines: 1,
              style: const TextStyle(fontSize: 15.0),
            ),
        ],
      ),
    );
  }

  Widget smallTeamWidget(TeamMember member, BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: MediaQuery.of(context).size.width * 0.06,
            backgroundColor: Colors.amber,
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: MediaQuery.of(context).size.width * 0.08,
            ),
          ),
          SpacingConstants().widthBetweenFieldsMid(context),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                member.userName,
                maxLines: 1,
                style: const TextStyle(fontSize: 20.0),
              ),
              if (member.designation != null)
                AutoSizeText(
                  member.designation!,
                  maxLines: 1,
                  style: const TextStyle(fontSize: 15.0),
                )
            ],
          )
        ],
      ),
    );
  }

  Card planCard(Plan plan, bool isSmallScreen, BuildContext context) {
    String? sessionsData =
        plan.sessions! > 0 ? '| ${plan.sessions} sessions' : '';
    double taxAmount = 0;
    if (plan.sessions != null) {
      taxAmount = plan.sessions! * 0.25;
    }
    return Card(
      elevation: 7.0,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.03,
        ),
        width: isSmallScreen
            ? MediaQuery.of(context).size.width * 0.4
            : MediaQuery.of(context).size.width * 0.2,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          AutoSizeText(
            '${plan.duration} ${plan.durationUnit} $sessionsData',
            maxLines: 1,
            style: const TextStyle(fontSize: 18.0),
          ),
          AutoSizeText(
            plan.name,
            style: const TextStyle(fontSize: 13.0),
          ),
          SpacingConstants().heightBetweenFieldsSmall(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  AutoSizeText(
                    'Rs.${plan.fees}',
                    style: const TextStyle(fontSize: 18.0),
                  ),
                  AutoSizeText(
                    ' + tax Rs.${taxAmount.toString()}',
                    style: const TextStyle(fontSize: 13.0),
                  ),
                ],
              ),
              ElevatedButton(onPressed: () {}, child: AutoSizeText('Book'))
            ],
          )
        ]),
      ),
    );
  }

  Widget footer(BasicData footerInfo, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: const Color(0xff212121),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                    vertical: MediaQuery.of(context).size.height * 00.02),
                width: MediaQuery.of(context).size.width * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AutoSizeText(
                      'Contact',
                      maxLines: 1,
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    SpacingConstants().heightBetweenFieldsMed(context),
                    Row(
                      children: [
                        const Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                        SpacingConstants().widthBetweenFieldsSmall(context),
                        TextButton(
                            onPressed: () {},
                            child: AutoSizeText(
                              footerInfo.email,
                              style: const TextStyle(color: Colors.white),
                            ))
                      ],
                    ),
                    SpacingConstants().heightBetweenFieldsSmall(context),
                    Row(
                      children: [
                        const Icon(
                          Icons.phone,
                          color: Colors.white,
                        ),
                        SpacingConstants().widthBetweenFieldsSmall(context),
                        TextButton(
                            onPressed: () {},
                            child: AutoSizeText(
                              footerInfo.phoneNumber,
                              style: const TextStyle(color: Colors.white),
                            ))
                      ],
                    ),
                    SpacingConstants().heightBetweenFieldsSmall(context),
                    Row(
                      children: [
                        const Icon(
                          Icons.public,
                          color: Colors.white,
                        ),
                        SpacingConstants().widthBetweenFieldsSmall(context),
                        TextButton(
                            onPressed: () {},
                            child: AutoSizeText(
                              footerInfo.website,
                              style: const TextStyle(color: Colors.white),
                            ))
                      ],
                    ),
                    SpacingConstants().heightBetweenFieldsSmall(context),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_pin,
                          color: Colors.white,
                        ),
                        SpacingConstants().widthBetweenFieldsSmall(context),
                        TextButton(
                            onPressed: () {},
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: AutoSizeText(
                                footerInfo.address,
                                softWrap: true,
                                maxLines: 2,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ))
                      ],
                    ),
                    SpacingConstants().heightBetweenFieldsSmall(context),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                    vertical: MediaQuery.of(context).size.height * 00.02),
                width: MediaQuery.of(context).size.width * 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const AutoSizeText(
                      'Have questions ?',
                      maxLines: 1,
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    const AutoSizeText(
                      'Drop us a line.',
                      maxLines: 1,
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                    ),
                    SpacingConstants().heightBetweenFieldsSmall(context),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            side: const BorderSide(
                                color: Colors.white, width: 2.0)),
                        child: const AutoSizeText(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const AutoSizeText(
                      'Follow Us',
                      maxLines: 1,
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.facebook,
                              color: Colors.white,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.camera,
                              color: Colors.white,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.book,
                              color: Colors.white,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.flight,
                              color: Colors.white,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.youtube_searched_for,
                              color: Colors.white,
                            ))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
