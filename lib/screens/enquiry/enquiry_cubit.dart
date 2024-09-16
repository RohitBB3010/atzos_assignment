import 'package:atzos_assignment/screens/enquiry/enquiry_classes.dart';
import 'package:atzos_assignment/screens/enquiry/enquiry_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnquiryCubit extends Cubit<EnquiryState> {
  EnquiryCubit() : super(EnquiryState());

  Future<void> getEnquiryFields() async {
    try {
      print('inside function');
      List<CenterItem> centers = [];
      List<Skill> skills = [];
      Dio dio = Dio();
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

      emit(EnquiryState(
        skills: skills,
        centers: centers,
      ));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> postEnquiryToApi(Enquiry enquiry) async {
    dynamic enquiryJson = enquiry.enquiryToJson(enquiry);

    Dio dio = Dio();
    Response response = await dio.post(
        'https://devconnect.spyn.co/api/web/v4/homepage/create-enquiry',
        data: enquiryJson);
  }
}
