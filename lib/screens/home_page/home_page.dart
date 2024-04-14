import 'dart:math';

import 'package:atzos_assignment/components/custom_appbar.dart';
import 'package:atzos_assignment/components/custom_bottom_nav.dart';
import 'package:atzos_assignment/components/gradient_list.dart';
import 'package:atzos_assignment/components/teams_list.dart';
import 'package:atzos_assignment/constants/spacing_constants.dart';
import 'package:atzos_assignment/screens/classes_page/classes_page.dart';
import 'package:atzos_assignment/screens/home_page/footer_header_components.dart';

import 'package:atzos_assignment/screens/home_page/home_page_classes.dart';
import 'package:atzos_assignment/screens/home_page/home_page_components.dart';
import 'package:atzos_assignment/screens/home_page/home_page_cubit.dart';
import 'package:atzos_assignment/screens/home_page/home_page_state.dart';
import 'package:atzos_assignment/screens/plans/plans_page.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
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
        bottomNavigationBar: MediaQuery.of(context).size.width < 900
            ? const CustomBottomNav()
            : null,
        body: BlocBuilder<HomePageCubit, HomePageState>(
          builder: (context, state) {
            if (state is HomePageDataLoadingState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset('assets/loading.json'),
                    const AutoSizeText(
                      'Please wait while we load content for you !!!',
                      maxLines: 2,
                      style: TextStyle(fontSize: 20.0),
                    )
                  ],
                ),
              );
            }

            if (state is HomePageDataLoadedState) {
              List<TrailBookClass> limitedBookClasses =
                  List.from(state.bookingClasses!.take(3));

              List<TrailBookClass> limitedTrailClass =
                  List.from(state.trailClasses!.take(3));

              List<Plan> limitedPlans = List.from(state.plans!.take(3));

              double screenWidth = MediaQuery.of(context).size.width;
              bool isSmallScreen = screenWidth <= 900 ? true : false;
              return SingleChildScrollView(
                  child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                    ),
                    color: const Color(0xffeff1f3),
                    child: Column(
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
                                    border: Border.all(
                                        color: const Color(0xff3b7080)),
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
                                                .externalLinkUrl)),
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
                                                  .externalLinkText);
                                              launchUrl(url);
                                            },
                                            child: AutoSizeText(state
                                                .footerInfo!
                                                .htmlData!
                                                .externalLinkUrl)),
                                      ],
                                    ),
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
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                    ),
                    color: const Color(0xffD4DCCD),
                    child: Column(
                      children: [
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
                                  return HomePageComponents().bookingClassCard(
                                      bookingClass,
                                      state.levels,
                                      isSmallScreen,
                                      context,
                                      false);
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                        SpacingConstants().heightBetweenFieldsMed(context),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                    ),
                    color: const Color(0xffeff1f3),
                    child: Column(
                      children: [
                        SpacingConstants().heightBetweenFieldsMed(context),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SpacingConstants()
                                .heightBetweenFieldsSmall(context),
                            const AutoSizeText(
                              'Trial Classes',
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
                        Wrap(
                          spacing: MediaQuery.of(context).size.width * 0.03,
                          runSpacing: MediaQuery.of(context).size.height * 0.03,
                          children: limitedTrailClass.map((bookingClass) {
                            return HomePageComponents().bookingClassCard(
                                bookingClass,
                                state.levels,
                                isSmallScreen,
                                context,
                                true);
                          }).toList(),
                        ),
                        SpacingConstants().heightBetweenFieldsMed(context),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                    ),
                    color: const Color(0xffD4DCCD),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SpacingConstants().heightBetweenFieldsMed(context),
                        AutoSizeText(
                          state.footerInfo!.additionalInfo[0].title,
                          style: const TextStyle(
                              fontSize: 25.0, fontWeight: FontWeight.bold),
                        ),
                        AutoSizeText(
                          state.footerInfo!.additionalInfo[0].descpription,
                          style: const TextStyle(fontSize: 15.0),
                        ),
                        SpacingConstants().heightBetweenFieldsSmall(context),
                        AutoSizeText(
                          state.footerInfo!.additionalInfo[1].title,
                          style: const TextStyle(
                              fontSize: 25.0, fontWeight: FontWeight.bold),
                        ),
                        AutoSizeText(
                          state.footerInfo!.additionalInfo[1].descpription,
                          style: const TextStyle(fontSize: 15.0),
                        ),
                        SpacingConstants().heightBetweenFieldsMed(context),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                    ),
                    color: const Color(0xffeff1f3),
                    child: Column(
                      children: [
                        SpacingConstants().heightBetweenFieldsMed(context),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const AutoSizeText(
                              'Plans',
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 30.0, fontWeight: FontWeight.bold),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Pages(
                                      plansList: state.plans!,
                                    );
                                  }));
                                },
                                child: const AutoSizeText('See More'))
                          ],
                        ),
                        SpacingConstants().heightBetweenFieldsSmall(context),
                        Wrap(
                          spacing: MediaQuery.of(context).size.width * 0.03,
                          runSpacing: MediaQuery.of(context).size.height * 0.03,
                          children: limitedPlans.map((plan) {
                            return planCard(plan, isSmallScreen, context);
                          }).toList(),
                        ),
                        SpacingConstants().heightBetweenFieldsMed(context),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                    ),
                    color: const Color(0xffd4dccd),
                    child: Column(
                      children: [
                        SpacingConstants().heightBetweenFieldsMed(context),
                        TeamsList(
                            teamList: state.teamMembers!,
                            isSmallScreen: isSmallScreen),
                        SpacingConstants().heightBetweenFieldsMed(context),
                      ],
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.05,
                      ),
                      color: const Color(0xffeff1f3),
                      child: Column(
                        children: [
                          SpacingConstants().heightBetweenFieldsMed(context),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                              if (!isSmallScreen)
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ClassesPage(
                                                  displayClasses:
                                                      state.bookingClasses!,
                                                  levels: state.levels!)));
                                    },
                                    child: const AutoSizeText('Select Class')),
                            ],
                          ),
                          SpacingConstants().heightBetweenFieldsSmall(context),
                          if (isSmallScreen)
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ClassesPage(
                                              displayClasses:
                                                  state.bookingClasses!,
                                              levels: state.levels!)));
                                },
                                child: const AutoSizeText('Select Class')),
                          SpacingConstants().heightBetweenFieldsMed(context),
                        ],
                      )),
                  isSmallScreen
                      ? FooterHeaderComponents().footerSmall(
                          state.footerInfo!,
                          context,
                          state.footerInfo!.lat!,
                          state.footerInfo!.lon!,
                          state.skills!,
                          state.centers!)
                      : FooterHeaderComponents().footerLarge(
                          state.footerInfo!,
                          context,
                          state.footerInfo!.lat!,
                          state.footerInfo!.lon!,
                          state.skills!,
                          state.centers!),
                ],
              ));
            }

            return Container();
          },
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
    int gradientNumber = Random().nextInt(5);
    print(gradientNumber);
    String? sessionsData =
        plan.sessions! > 0 ? '| ${plan.sessions} sessions' : '';
    int taxAmount = 0;
    if (plan.fees != null) {
      taxAmount = (plan.fees! * 0.25).ceil();
    }
    return Card(
      elevation: 7.0,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.03,
          vertical: MediaQuery.of(context).size.height * 0.01,
        ),
        decoration: BoxDecoration(
          gradient: gradients[gradientNumber],
          borderRadius: BorderRadius.circular(10),
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
}
