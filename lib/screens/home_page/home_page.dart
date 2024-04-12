import 'package:atzos_assignment/components/custom_appbar.dart';
import 'package:atzos_assignment/components/custom_bottom_nav.dart';
import 'package:atzos_assignment/components/teams_list.dart';
import 'package:atzos_assignment/constants/spacing_constants.dart';
import 'package:atzos_assignment/screens/classes_page/classes_page.dart';
import 'package:atzos_assignment/screens/home_page/home_page_classes.dart';
import 'package:atzos_assignment/screens/home_page/home_page_cubit.dart';
import 'package:atzos_assignment/screens/home_page/home_page_state.dart';
import 'package:atzos_assignment/screens/pages/pages.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

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
              List<TrailBookClass> limitedBookClasses =
                  List.from(state.bookingClasses!.take(3));

              bool isExpanded = false;

              List<TrailBookClass> limitedTrailClass =
                  List.from(state.trailClasses!.take(3));

              List<Plan> limitedPlans = List.from(state.plans!.take(3));

              List<TeamMember> teamsList = isExpanded
                  // ignore: dead_code
                  ? List.from(state.teamMembers!)
                  : List<TeamMember>.from(state.teamMembers!).take(3).toList();

              double screenWidth = MediaQuery.of(context).size.width;
              bool isSmallScreen = screenWidth <= 900 ? true : false;
              return SingleChildScrollView(
                  child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SpacingConstants().heightBetweenFieldsSmall(context),
                        Row(
                          children: [
                            if (!isSmallScreen)
                              Container(
                                width: MediaQuery.of(context).size.width * 0.45,
                                margin: const EdgeInsets.all(10),
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.white),
                                    image: const DecorationImage(
                                        image: AssetImage(
                                            'assets/spyn_advert.jpeg'),
                                        fit: BoxFit.fill)),
                              ),
                            if (!isSmallScreen)
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AutoSizeText(
                                      state.footerInfo!.title,
                                      style: const TextStyle(
                                          fontSize: 25.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    AutoSizeText(
                                      state.footerInfo!.htmlData!.description
                                          .toString(),
                                      style: const TextStyle(fontSize: 15.0),
                                    ),
                                    Row(
                                      children: [
                                        const AutoSizeText(
                                          'Test :',
                                          style: TextStyle(fontSize: 15.0),
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              final Uri url = Uri.parse(state
                                                  .footerInfo!
                                                  .htmlData!
                                                  .externalLinkText);
                                              launchUrl(url);
                                            },
                                            child: AutoSizeText(state
                                                .footerInfo!
                                                .htmlData!
                                                .externalLinkText)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const AutoSizeText(
                                          'External String :',
                                          style: TextStyle(fontSize: 15.0),
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              final Uri url = Uri.parse(state
                                                  .footerInfo!
                                                  .htmlData!
                                                  .externalLinkUrl);
                                              launchUrl(url);
                                            },
                                            child: AutoSizeText(state
                                                .footerInfo!
                                                .htmlData!
                                                .externalLinkUrl)),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                          ],
                        ),
                        if (isSmallScreen)
                          Container(
                            width: MediaQuery.of(context).size.width * 0.88,
                            height: MediaQuery.of(context).size.height * 0.3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.white),
                                image: const DecorationImage(
                                    image:
                                        AssetImage('assets/spyn_advert.jpeg'),
                                    fit: BoxFit.fill)),
                          ),
                        SpacingConstants().heightBetweenFieldsSmall(context),
                        if (isSmallScreen)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                state.footerInfo!.title,
                                style: const TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              AutoSizeText(
                                state.footerInfo!.htmlData!.description
                                    .toString(),
                                style: const TextStyle(fontSize: 15.0),
                              ),
                              Row(
                                children: [
                                  const AutoSizeText(
                                    'Test :',
                                    style: TextStyle(fontSize: 15.0),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        final Uri url = Uri.parse(state
                                            .footerInfo!
                                            .htmlData!
                                            .externalLinkText);
                                        launchUrl(url);
                                      },
                                      child: AutoSizeText(state.footerInfo!
                                          .htmlData!.externalLinkText)),
                                ],
                              ),
                              Row(
                                children: [
                                  const AutoSizeText(
                                    'External String :',
                                    style: TextStyle(fontSize: 15.0),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        final Uri url = Uri.parse(state
                                            .footerInfo!
                                            .htmlData!
                                            .externalLinkUrl);
                                        launchUrl(url);
                                      },
                                      child: AutoSizeText(state.footerInfo!
                                          .htmlData!.externalLinkUrl)),
                                ],
                              )
                            ],
                          ),
                        SpacingConstants().heightBetweenFieldsMed(context),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const AutoSizeText(
                              'Classes',
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 30.0, fontWeight: FontWeight.bold),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return ClassesPage(
                                        displayClasses: state.bookingClasses!,
                                        levels: state.levels!);
                                  }));
                                },
                                child: const AutoSizeText('See More'))
                          ],
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
                                    limitedBookClasses.map((bookingClass) {
                                  return bookingClassCard(
                                      bookingClass,
                                      state.levels,
                                      isSmallScreen,
                                      context,
                                      false);
                                }).toList(),
                              ),
                              SpacingConstants()
                                  .heightBetweenFieldsMed(context),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const AutoSizeText(
                                    'Trial Classes',
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return ClassesPage(
                                              displayClasses:
                                                  state.bookingClasses!,
                                              levels: state.levels!);
                                        }));
                                      },
                                      child: const AutoSizeText('See More'))
                                ],
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
                                      children:
                                          limitedTrailClass.map((bookingClass) {
                                        return bookingClassCard(
                                            bookingClass,
                                            state.levels,
                                            isSmallScreen,
                                            context,
                                            true);
                                      }).toList(),
                                    ),
                                    SpacingConstants()
                                        .heightBetweenFieldsMed(context),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AutoSizeText(
                                          state.footerInfo!.additionalInfo[0]
                                              .title,
                                          style: const TextStyle(
                                              fontSize: 25.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        AutoSizeText(
                                          state.footerInfo!.additionalInfo[0]
                                              .descpription,
                                          style:
                                              const TextStyle(fontSize: 15.0),
                                        ),
                                        SpacingConstants()
                                            .heightBetweenFieldsSmall(context),
                                        AutoSizeText(
                                          state.footerInfo!.additionalInfo[1]
                                              .title,
                                          style: const TextStyle(
                                              fontSize: 25.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        AutoSizeText(
                                          state.footerInfo!.additionalInfo[1]
                                              .descpription,
                                          style:
                                              const TextStyle(fontSize: 15.0),
                                        )
                                      ],
                                    ),
                                    SpacingConstants()
                                        .heightBetweenFieldsMed(context),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const AutoSizeText(
                                          'Plans',
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontSize: 30.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return Pages(
                                                  plansList: state.plans!,
                                                );
                                              }));
                                            },
                                            child:
                                                const AutoSizeText('See More'))
                                      ],
                                    ),
                                    SpacingConstants()
                                        .heightBetweenFieldsSmall(context),
                                    Wrap(
                                      spacing:
                                          MediaQuery.of(context).size.width *
                                              0.03,
                                      runSpacing:
                                          MediaQuery.of(context).size.height *
                                              0.03,
                                      children: limitedPlans.map((plan) {
                                        return planCard(
                                            plan, isSmallScreen, context);
                                      }).toList(),
                                    ),
                                    SpacingConstants()
                                        .heightBetweenFieldsLarge(context),
                                    TeamsList(
                                        teamList: state.teamMembers!,
                                        isSmallScreen: isSmallScreen),
                                    SpacingConstants()
                                        .heightBetweenFieldsLarge(context),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AutoSizeText(
                                              'Join Us',
                                              style: TextStyle(
                                                  fontSize: 25.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            AutoSizeText(
                                              'You can select to join from a list of classes',
                                              style: TextStyle(
                                                fontSize: 15.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ClassesPage(
                                                              displayClasses: state
                                                                  .bookingClasses!,
                                                              levels: state
                                                                  .levels!)));
                                            },
                                            child: AutoSizeText('Select Class'))
                                      ],
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
                  isSmallScreen
                      ? footerSmall(state.footerInfo!, context,
                          state.footerInfo!.lat!, state.footerInfo!.lon!)
                      : footerLarge(state.footerInfo!, context,
                          state.footerInfo!.lat!, state.footerInfo!.lon!),
                ],
              ));
            }

            return Container();
          },
        ),
      ),
    );
  }

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
                        )
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
            : MediaQuery.of(context).size.width * 0.25,
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
              SpacingConstants().heightBetweenFieldsMed(context),
              const AutoSizeText(
                'Timings',
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
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
          vertical: MediaQuery.of(context).size.height * 0.01,
        ),
        width: isSmallScreen
            ? MediaQuery.of(context).size.width * 0.8
            : MediaQuery.of(context).size.width * 0.27,
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
              SizedBox(
                width: isSmallScreen
                    ? MediaQuery.of(context).size.width * 0.2
                    : MediaQuery.of(context).size.width * 0.07,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(padding: EdgeInsets.all(0)),
                    child: const AutoSizeText(
                      'Book',
                      overflow: TextOverflow.clip,
                      softWrap: false,
                      style: TextStyle(fontSize: 10.0),
                    )),
              )
            ],
          )
        ]),
      ),
    );
  }

  Widget footerLarge(
      BasicData footerInfo, BuildContext context, double lat, double lon) {
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
                          size: 18.0,
                        ),
                        SpacingConstants().widthBetweenFieldsSmall(context),
                        TextButton(
                            onPressed: () async {
                              final Uri url =
                                  Uri.parse("mailTo:${footerInfo.email}");
                              await launchUrl(url);
                            },
                            child: AutoSizeText(
                              footerInfo.email,
                              maxLines: 1,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 13.0),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.phone,
                          color: Colors.white,
                          size: 18.0,
                        ),
                        SpacingConstants().widthBetweenFieldsSmall(context),
                        TextButton(
                            onPressed: () async {
                              final Uri url = Uri.parse(
                                  "tel:${footerInfo.countryCode}${footerInfo.phoneNumber}");
                              await launchUrl(url);
                            },
                            child: AutoSizeText(
                              footerInfo.phoneNumber,
                              maxLines: 1,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 13.0),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.public,
                          color: Colors.white,
                          size: 18.0,
                        ),
                        SpacingConstants().widthBetweenFieldsSmall(context),
                        TextButton(
                            onPressed: () async {
                              final Uri url = Uri.parse(footerInfo.website);
                              await launchUrl(url);
                            },
                            child: AutoSizeText(
                              footerInfo.website,
                              maxLines: 1,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 13.0),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_pin,
                          color: Colors.white,
                          size: 18.0,
                        ),
                        SpacingConstants().widthBetweenFieldsSmall(context),
                        TextButton(
                            onPressed: () {
                              MapsLauncher.launchCoordinates(lat, lon);
                            },
                            child: AutoSizeText(
                              footerInfo.address,
                              softWrap: true,
                              maxLines: 2,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 13.0),
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
                    vertical: MediaQuery.of(context).size.height * 0.02),
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
                    SpacingConstants().heightBetweenFieldsMed(context),
                    const AutoSizeText(
                      'Follow Us',
                      maxLines: 1,
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.01,
                        ),
                        IconButton(
                            onPressed: () async {
                              final Uri url =
                                  Uri.parse(footerInfo.socialMediaLinks['fb']!);
                              await launchUrl(url);
                            },
                            icon: const Icon(
                              FontAwesomeIcons.facebook,
                              color: Colors.white,
                            )),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.01,
                        ),
                        IconButton(
                            onPressed: () async {
                              final Uri url = Uri.parse(
                                  footerInfo.socialMediaLinks['insta']!);
                              await launchUrl(url);
                            },
                            icon: const Icon(
                              FontAwesomeIcons.instagram,
                              color: Colors.white,
                            )),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.01,
                        ),
                        IconButton(
                            onPressed: () async {
                              final Uri url = Uri.parse(
                                  footerInfo.socialMediaLinks['linkedin']!);
                              await launchUrl(url);
                            },
                            icon: const Icon(
                              FontAwesomeIcons.linkedin,
                              color: Colors.white,
                            )),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.01,
                        ),
                        IconButton(
                            onPressed: () async {
                              final Uri url = Uri.parse(
                                  footerInfo.socialMediaLinks['twitter']!);
                              await launchUrl(url);
                            },
                            icon: const Icon(
                              FontAwesomeIcons.twitter,
                              color: Colors.white,
                            )),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.01,
                        ),
                        IconButton(
                            onPressed: () async {
                              final Uri url = Uri.parse(
                                  footerInfo.socialMediaLinks['youtube']!);
                              await launchUrl(url);
                            },
                            icon: const Icon(
                              FontAwesomeIcons.youtube,
                              color: Colors.white,
                            ))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {},
                  child: const AutoSizeText(
                    'Privacy Policy',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  )),
              const AutoSizeText(
                '|',
                style: TextStyle(fontSize: 30.0, color: Colors.white),
              ),
              TextButton(
                  onPressed: () {},
                  child: const AutoSizeText(
                    'Terms Of Service',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ))
            ],
          )
        ],
      ),
    );
  }

  Widget footerSmall(
      BasicData footerInfo, BuildContext context, double lat, double lon) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: const Color(0xff212121),
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
          vertical: MediaQuery.of(context).size.height * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AutoSizeText(
            'Contact',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
          SpacingConstants().heightBetweenFieldsMed(context),
          Row(
            children: [
              const Icon(
                Icons.email,
                color: Colors.white,
                size: 18.0,
              ),
              SpacingConstants().widthBetweenFieldsSmall(context),
              TextButton(
                  onPressed: () async {
                    final Uri url = Uri.parse("mailTo:${footerInfo.email}");
                    await launchUrl(url);
                  },
                  child: AutoSizeText(
                    footerInfo.email,
                    maxLines: 1,
                    style: const TextStyle(color: Colors.white, fontSize: 13.0),
                  ))
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Row(
            children: [
              const Icon(
                Icons.phone,
                color: Colors.white,
                size: 18.0,
              ),
              SpacingConstants().widthBetweenFieldsSmall(context),
              TextButton(
                  onPressed: () async {
                    final Uri url = Uri.parse(
                        "tel:${footerInfo.countryCode}${footerInfo.phoneNumber}");
                    await launchUrl(url);
                  },
                  child: AutoSizeText(
                    footerInfo.phoneNumber,
                    maxLines: 1,
                    style: const TextStyle(color: Colors.white, fontSize: 13.0),
                  ))
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Row(
            children: [
              const Icon(
                Icons.public,
                color: Colors.white,
                size: 18.0,
              ),
              SpacingConstants().widthBetweenFieldsSmall(context),
              TextButton(
                  onPressed: () async {
                    final Uri url = Uri.parse(footerInfo.website);
                    await launchUrl(url);
                  },
                  child: AutoSizeText(
                    footerInfo.website,
                    maxLines: 1,
                    style: const TextStyle(color: Colors.white, fontSize: 13.0),
                  ))
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Row(
            children: [
              const Icon(
                Icons.location_pin,
                color: Colors.white,
                size: 18.0,
              ),
              SpacingConstants().widthBetweenFieldsSmall(context),
              TextButton(
                  onPressed: () {
                    MapsLauncher.launchCoordinates(lat, lon);
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: AutoSizeText(
                      footerInfo.address,
                      softWrap: true,
                      maxLines: 2,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 13.0),
                    ),
                  ))
            ],
          ),
          SpacingConstants().heightBetweenFieldsMed(context),
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
            width: MediaQuery.of(context).size.width * 0.85,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  side: const BorderSide(color: Colors.white, width: 2.0)),
              child: const AutoSizeText(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SpacingConstants().heightBetweenFieldsMed(context),
          const AutoSizeText(
            'Follow Us',
            maxLines: 1,
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.01,
              ),
              IconButton(
                  onPressed: () async {
                    final Uri url =
                        Uri.parse(footerInfo.socialMediaLinks['fb']!);
                    await launchUrl(url);
                  },
                  icon: const Icon(
                    FontAwesomeIcons.facebook,
                    color: Colors.white,
                  )),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.01,
              ),
              IconButton(
                  onPressed: () async {
                    final Uri url =
                        Uri.parse(footerInfo.socialMediaLinks['insta']!);
                    await launchUrl(url);
                  },
                  icon: const Icon(
                    FontAwesomeIcons.instagram,
                    color: Colors.white,
                  )),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.01,
              ),
              IconButton(
                  onPressed: () async {
                    final Uri url =
                        Uri.parse(footerInfo.socialMediaLinks['twitter']!);
                    await launchUrl(url);
                  },
                  icon: const Icon(
                    FontAwesomeIcons.linkedin,
                    color: Colors.white,
                  )),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.01,
              ),
              IconButton(
                  onPressed: () async {
                    final Uri url =
                        Uri.parse(footerInfo.socialMediaLinks['linkedin']!);
                    await launchUrl(url);
                  },
                  icon: const Icon(
                    FontAwesomeIcons.twitter,
                    color: Colors.white,
                  )),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.01,
              ),
              IconButton(
                  onPressed: () async {
                    final Uri url =
                        Uri.parse(footerInfo.socialMediaLinks['youtube']!);
                    await launchUrl(url);
                  },
                  icon: const Icon(
                    FontAwesomeIcons.youtube,
                    color: Colors.white,
                  ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {},
                  child: const AutoSizeText(
                    'Privacy Policy',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  )),
              const AutoSizeText(
                '|',
                style: TextStyle(fontSize: 30.0, color: Colors.white),
              ),
              TextButton(
                  onPressed: () {},
                  child: const AutoSizeText(
                    'Terms Of Service',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
