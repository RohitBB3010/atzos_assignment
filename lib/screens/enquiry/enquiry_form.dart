import 'package:atzos_assignment/constants/spacing_constants.dart';
import 'package:atzos_assignment/screens/enquiry/enquiry_classes.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_social_button/flutter_social_button.dart';

class EnquiryForm extends StatefulWidget {
  const EnquiryForm({super.key});

  @override
  State<EnquiryForm> createState() => _EnquiryFormState();
}

class _EnquiryFormState extends State<EnquiryForm> {
  late List<CenterItem> centers = [];
  late List<Skill> skills = [];
  List<String> genders = ['I prefer not to say', 'Male', 'Female', 'Other'];
  String? selectedGenderValue;
  Skill? selectedSkillValue;
  CenterItem? selectedCenterValue;
  TextEditingController nameController = TextEditingController();

  Future<List<dynamic>> getEnquiryFields() async {
    try {
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
    } catch (e) {
      debugPrint(e.toString());
    }
    return [centers, skills];
  }

  Future<void> postEnquiryToApi(Enquiry enquiry) async {
    dynamic enquiryJson = enquiry.enquiryToJson(enquiry);

    Dio dio = Dio();
    Response response = await dio.post(
        'https://devconnect.spyn.co/api/web/v4/homepage/create-enquiry',
        data: enquiryJson);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isSmallScreen = screenWidth <= 900 ? true : false;
    return Dialog(
      child: SingleChildScrollView(
        child: ScaffoldMessenger(
          child: Builder(builder: (enquiryContext) {
            return Scaffold(
              body: FutureBuilder(
                  future: getEnquiryFields(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0)),
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.05,
                          vertical: MediaQuery.of(context).size.height * 0.03,
                        ),
                        width: isSmallScreen
                            ? MediaQuery.of(context).size.width * 0.8
                            : MediaQuery.of(context).size.width * 0.5,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const AutoSizeText(
                                'Enquiry',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              AutoSizeText(
                                'We would love to hear from you !!',
                                style: TextStyle(
                                    fontSize: 13.0,
                                    color: Colors.black.withOpacity(0.7)),
                              ),
                              SpacingConstants()
                                  .heightBetweenFieldsMed(context),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Icon(Icons.person),
                                  SizedBox(
                                      width: isSmallScreen
                                          ? MediaQuery.of(context).size.width *
                                              0.6
                                          : MediaQuery.of(context).size.width *
                                              0.35,
                                      child: TextFormField(
                                          controller: nameController,
                                          decoration: InputDecoration(
                                              labelText: 'Name*',
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.01,
                                                      vertical: 0),
                                              border: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      width: 2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0))))),
                                ],
                              ),
                              SpacingConstants()
                                  .heightBetweenFieldsSmall(context),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Icon(FontAwesomeIcons.genderless),
                                  SizedBox(
                                    width: isSmallScreen
                                        ? MediaQuery.of(context).size.width *
                                            0.6
                                        : MediaQuery.of(context).size.width *
                                            0.35,
                                    child: DropdownButtonHideUnderline(
                                        child: DropdownButton2<String>(
                                      buttonStyleData: ButtonStyleData(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black
                                                      .withOpacity(0.7)),
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      isExpanded: true,
                                      hint: const AutoSizeText('Select Gender'),
                                      items: genders.map((gender) {
                                        return DropdownMenuItem(
                                            value: gender,
                                            child: AutoSizeText(gender));
                                      }).toList(),
                                      value: selectedGenderValue,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedGenderValue = value;
                                        });
                                      },
                                    )),
                                  )
                                ],
                              ),
                              SpacingConstants()
                                  .heightBetweenFieldsSmall(context),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Icon(FontAwesomeIcons.star),
                                  SizedBox(
                                    width: isSmallScreen
                                        ? MediaQuery.of(context).size.width *
                                            0.6
                                        : MediaQuery.of(context).size.width *
                                            0.35,
                                    child: DropdownButtonHideUnderline(
                                        child: DropdownButton2<Skill>(
                                      buttonStyleData: ButtonStyleData(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black
                                                      .withOpacity(0.7)),
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      isExpanded: true,
                                      hint: const AutoSizeText('Select Skill'),
                                      items: skills.map((skill) {
                                        return DropdownMenuItem(
                                            value: skill,
                                            child: AutoSizeText(skill.name));
                                      }).toList(),
                                      value: selectedSkillValue,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedSkillValue = value;
                                        });
                                      },
                                    )),
                                  )
                                ],
                              ),
                              SpacingConstants()
                                  .heightBetweenFieldsSmall(context),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Icon(FontAwesomeIcons.locationPin),
                                  SizedBox(
                                    width: isSmallScreen
                                        ? MediaQuery.of(context).size.width *
                                            0.6
                                        : MediaQuery.of(context).size.width *
                                            0.35,
                                    child: DropdownButtonHideUnderline(
                                        child: DropdownButton2<CenterItem>(
                                      buttonStyleData: ButtonStyleData(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black
                                                      .withOpacity(0.7)),
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      isExpanded: true,
                                      hint: const AutoSizeText('Select Center'),
                                      items: centers.map((center) {
                                        return DropdownMenuItem(
                                            value: center,
                                            child: AutoSizeText(center.title));
                                      }).toList(),
                                      value: selectedCenterValue,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedCenterValue = value;
                                        });
                                      },
                                    )),
                                  )
                                ],
                              ),
                              SpacingConstants()
                                  .heightBetweenFieldsSmall(context),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const AutoSizeText('Cancel')),
                                  ElevatedButton(
                                      onPressed: () async {
                                        if (nameController.text.isEmpty ||
                                            selectedGenderValue == null ||
                                            selectedSkillValue == null) {
                                          SnackBar snackBar = SnackBar(
                                            content: const Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  (FontAwesomeIcons
                                                      .exclamation),
                                                  color: Colors.white,
                                                ),
                                                AutoSizeText(
                                                    'Please fill all mandatory fields')
                                              ],
                                            ),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0)),
                                          );
                                          ScaffoldMessenger.of(enquiryContext)
                                              .showSnackBar(snackBar);
                                        } else {
                                          Enquiry postEnquiry = Enquiry(
                                              name: nameController.text,
                                              gender: selectedGenderValue!,
                                              skill: selectedSkillValue!.id,
                                              center: selectedCenterValue ==
                                                      null
                                                  ? ''
                                                  : selectedCenterValue!.title);

                                          postEnquiryToApi(postEnquiry);

                                          SnackBar snackBar = SnackBar(
                                            content: Column(
                                              children: [
                                                const Icon(
                                                  Icons.check,
                                                  color: Color.fromARGB(
                                                      255, 26, 34, 26),
                                                ),
                                                const AutoSizeText(
                                                  'Thank you for your enquiry',
                                                  style:
                                                      TextStyle(fontSize: 15.0),
                                                ),
                                                const AutoSizeText(
                                                  'we will get back to you soon',
                                                  style:
                                                      TextStyle(fontSize: 10.0),
                                                ),
                                                ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.pop(
                                                          enquiryContext);
                                                    },
                                                    child: const AutoSizeText(
                                                        'Ok'))
                                              ],
                                            ),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0)),
                                          );
                                          ScaffoldMessenger.of(enquiryContext)
                                              .showSnackBar(snackBar);
                                        }
                                      },
                                      child: const AutoSizeText('Enquire'))
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }
                    return Container();
                  }),
            );
          }),
        ),
      ),
    );

    return Dialog(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AutoSizeText(
              'Enquiry Form',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const AutoSizeText(
              'We would love to hear from you',
              style: TextStyle(fontSize: 13.0),
            ),
            SpacingConstants().heightBetweenFieldsSmall(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(Icons.person),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.02,
                            vertical: 0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.7)))),
                  ),
                ),
              ],
            ),
            SpacingConstants().heightBetweenFieldsSmall(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(FontAwesomeIcons.genderless),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                      hint: const AutoSizeText('Select Gender'),
                      items: genders.map((gender) {
                        return DropdownMenuItem(
                            value: gender, child: AutoSizeText(gender));
                      }).toList(),
                      value: selectedGenderValue,
                      onChanged: (value) {
                        setState(() {
                          selectedGenderValue = value;
                        });
                      },
                    ))),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(FontAwesomeIcons.star),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: DropdownButtonHideUnderline(
                        child: DropdownButton2<Skill>(
                      hint: const AutoSizeText('Select Skill*'),
                      items: skills.map((skill) {
                        return DropdownMenuItem(
                            value: skill, child: AutoSizeText(skill.name));
                      }).toList(),
                      value: selectedSkillValue,
                      onChanged: (value) {
                        setState(() {
                          selectedSkillValue = value!;
                        });
                      },
                    ))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
