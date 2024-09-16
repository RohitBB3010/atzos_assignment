import 'package:atzos_assignment/constants/spacing_constants.dart';
import 'package:atzos_assignment/screens/enquiry/enquiry_classes.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EnquiryForm extends StatefulWidget {
  final List<Skill> skillsList;
  final List<CenterItem> centerList;
  const EnquiryForm(
      {super.key, required this.skillsList, required this.centerList});

  @override
  State<EnquiryForm> createState() => _EnquiryFormState();
}

class _EnquiryFormState extends State<EnquiryForm> {
  List<String> genders = ['I prefer not to say', 'Male', 'Female', 'Other'];
  String? selectedGenderValue;
  Skill? selectedSkillValue;
  CenterItem? selectedCenterValue;
  TextEditingController nameController = TextEditingController();

  Future<void> postEnquiryToApi(Enquiry enquiry) async {
    dynamic enquiryJson = enquiry.enquiryToJson(enquiry);

    Dio dio = Dio();
    Response response = await dio.post(
        'https://devconnect.spyn.co/api/web/v4/homepage/create-enquiry',
        data: enquiryJson);
  }

  double _calculateDialogWidth(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isSmallScreen = screenWidth <= 900 ? true : false;
    double contentWidth = isSmallScreen
        ? screenWidth * 0.8
        : screenWidth * 0.5; // Adjust as needed
    return contentWidth;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isSmallScreen = screenWidth <= 900 ? true : false;
    return Dialog(
        child: SizedBox(
      width: (_calculateDialogWidth(context)),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const AutoSizeText(
                    'Enquiry',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  AutoSizeText(
                    'We would love to hear from you !!',
                    style: TextStyle(
                        fontSize: 13.0, color: Colors.black.withOpacity(0.7)),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(Icons.person),
                      SizedBox(
                        width: isSmallScreen
                            ? MediaQuery.of(context).size.width * 0.6
                            : MediaQuery.of(context).size.width * 0.35,
                        child: TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: 'Name*',
                            contentPadding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.01,
                              vertical: 0,
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(width: 2),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(FontAwesomeIcons.genderless),
                      SizedBox(
                        width: isSmallScreen
                            ? MediaQuery.of(context).size.width * 0.6
                            : MediaQuery.of(context).size.width * 0.35,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            buttonStyleData: ButtonStyleData(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black.withOpacity(0.7),
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            isExpanded: true,
                            hint: const AutoSizeText('Select Gender'),
                            items: genders.map((gender) {
                              return DropdownMenuItem(
                                value: gender,
                                child: AutoSizeText(gender),
                              );
                            }).toList(),
                            value: selectedGenderValue,
                            onChanged: (value) {
                              setState(() {
                                selectedGenderValue = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(FontAwesomeIcons.star),
                      SizedBox(
                        width: isSmallScreen
                            ? MediaQuery.of(context).size.width * 0.6
                            : MediaQuery.of(context).size.width * 0.35,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2<Skill>(
                            buttonStyleData: ButtonStyleData(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black.withOpacity(0.7),
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            isExpanded: true,
                            hint: const AutoSizeText('Select Skill'),
                            items: widget.skillsList.map((skill) {
                              return DropdownMenuItem(
                                value: skill,
                                child: AutoSizeText(skill.name),
                              );
                            }).toList(),
                            value: selectedSkillValue,
                            onChanged: (value) {
                              setState(() {
                                selectedSkillValue = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(FontAwesomeIcons.locationPin),
                      SizedBox(
                        width: isSmallScreen
                            ? MediaQuery.of(context).size.width * 0.6
                            : MediaQuery.of(context).size.width * 0.35,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2<CenterItem>(
                            buttonStyleData: ButtonStyleData(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black.withOpacity(0.7),
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            isExpanded: true,
                            hint: const AutoSizeText('Select Center'),
                            items: widget.centerList.map((center) {
                              return DropdownMenuItem(
                                value: center,
                                child: AutoSizeText(center.title),
                              );
                            }).toList(),
                            value: selectedCenterValue,
                            onChanged: (value) {
                              setState(() {
                                selectedCenterValue = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const AutoSizeText('Cancel'),
                      ),
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
                                    (FontAwesomeIcons.exclamation),
                                    color: Colors.white,
                                  ),
                                  AutoSizeText(
                                      'Please fill all mandatory fields')
                                ],
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            Enquiry postEnquiry = Enquiry(
                              name: nameController.text,
                              gender: selectedGenderValue!,
                              skill: selectedSkillValue!.id,
                              center: selectedCenterValue == null
                                  ? ''
                                  : selectedCenterValue!.title,
                            );

                            await postEnquiryToApi(postEnquiry);

                            Navigator.pop(context);

                            showDialog(
                                context: context,
                                builder: (context) => doneDialog(context));
                          }
                        },
                        child: const AutoSizeText('Enquire'),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }

  Widget doneDialog(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.02),
        width: MediaQuery.of(context).size.width * 0.3,
        height: MediaQuery.of(context).size.height * 0.3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check,
              color: Colors.green,
            ),
            const AutoSizeText(
              'Thank you for your enquiry',
              style: TextStyle(fontSize: 20.0),
            ),
            const AutoSizeText(
              'we will get back to you soon',
              style: TextStyle(fontSize: 15.0),
            ),
            SpacingConstants().heightBetweenFieldsSmall(context),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const AutoSizeText('Ok'),
            )
          ],
        ),
      ),
    );
  }
}
