import 'package:atzos_assignment/screens/enquiry/enquiry_classes.dart';
import 'package:flutter/material.dart';
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
    List<TeamMember> membersList = [];
    List<Plan> plansList = [];
    List<CenterItem> centers = [];
    List<Skill> skills = [];

    Dio dio = Dio();

    Response response1 = await dio.get(
        'https://devconnect.spyn.co/api/web/v4/homepage/index?venue_id=729');

    var bookingClassesData = response1.data['booking_classes'];
    var levelList = response1.data['level_list'];
    var persons = response1.data['team'];
    var planListData = response1.data['plan_data'];
    var infoData = response1.data['venue_basic_data'];

    BasicData footerData = BasicData.fromJson(infoData);
    List<String> levels =
        levelList.values.map<String>((value) => value.toString()).toList();

    for (int i = 0; i < persons.length; i++) {
      TeamMember member = TeamMember.fromJson(persons[i]);
      membersList.add(member);
    }
    for (int i = 0; i < bookingClassesData.length; i++) {
      TrailBookClass bookingClass =
          TrailBookClass.fromJson(bookingClassesData[i]);
      bookingClassesList.add(bookingClass);
    }

    for (int i = 0; i < planListData.length; i++) {
      Plan plan = Plan.fromJson(planListData[i]);
      plansList.add(plan);
    }

    Response response = await dio.get(
        'https://devconnect.spyn.co/api/web/v4/homepage/center-skill-list?venue_id=729');

    var centerItemsJson = response.data['centers'];
    var skillsList = response.data['skill'];

    for (int i = 0; i < centerItemsJson.length; i++) {
      CenterItem tempCenter = CenterItem.fromJson(centerItemsJson[i]);
      centers.add(tempCenter);
    }

    for (int i = 0; i < skillsList.length; i++) {
      Skill tempSkill = Skill.fromJson(skillsList[i]);
      skills.add(tempSkill);
    }

    emit(HomePageDataLoadedState(
        bookingClasses: bookingClassesList,
        levels: levels,
        trailClasses: bookingClassesList,
        teamMembers: membersList,
        plans: plansList,
        footerInfo: footerData,
        skills: skills,
        centers: centers));
  }
}
