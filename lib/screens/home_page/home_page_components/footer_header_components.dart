import 'package:atzos_assignment/constants/spacing_constants.dart';
import 'package:atzos_assignment/screens/enquiry/enquiry_classes.dart';
import 'package:atzos_assignment/screens/enquiry/enquiry_form.dart';
import 'package:atzos_assignment/screens/home_page/home_page_classes.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterHeaderComponents {
  Widget footerLarge(
    BasicData footerInfo,
    BuildContext context,
    double lat,
    double lon,
    List<Skill> skills,
    List<CenterItem> centers,
  ) {
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
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: AutoSizeText(
                                footerInfo.address,
                                softWrap: true,
                                maxLines: 2,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 13.0),
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
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => EnquiryForm(
                                    centerList: centers,
                                    skillsList: skills,
                                  ));
                        },
                        style: TextButton.styleFrom(
                            side: const BorderSide(
                                color: Colors.white, width: 2.0)),
                        child: const AutoSizeText(
                          'Enquire',
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
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) =>
                            privacyPolicy(footerInfo.privacyPolicy, context));
                  },
                  child: const AutoSizeText(
                    'Privacy Policy',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  )),
              const AutoSizeText(
                '|',
                style: TextStyle(fontSize: 30.0, color: Colors.white),
              ),
              TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) =>
                            privacyPolicy(footerInfo.terms, context));
                  },
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
    BasicData footerInfo,
    BuildContext context,
    double lat,
    double lon,
    List<Skill> skills,
    List<CenterItem> centers,
  ) {
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
            width: MediaQuery.of(context).size.width * 0.3,
            child: TextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => EnquiryForm(
                          skillsList: skills,
                          centerList: centers,
                        ));
              },
              style: TextButton.styleFrom(
                  side: const BorderSide(color: Colors.white, width: 2.0)),
              child: const AutoSizeText(
                'Enquire',
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
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return privacyPolicy(
                              footerInfo.privacyPolicy, context);
                        });
                  },
                  child: const AutoSizeText(
                    'Privacy Policy',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  )),
              const AutoSizeText(
                '|',
                style: TextStyle(fontSize: 30.0, color: Colors.white),
              ),
              TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return privacyPolicy(footerInfo.terms, context);
                        });
                  },
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

Widget privacyPolicy(String policy, BuildContext context) {
  return Dialog(
    child: Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width * 0.8,
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.02,
          vertical: MediaQuery.of(context).size.height * 0.02),
      child: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.04,
                      height: MediaQuery.of(context).size.height * 0.04,
                      child: Image.asset('assets/spyn_logo.jpeg')),
                  const AutoSizeText(
                    'Star Academy',
                    style: TextStyle(fontSize: 25.0),
                  )
                ],
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.01,
                      vertical: MediaQuery.of(context).size.height * 0.01),
                  child: AutoSizeText(
                    policy,
                    softWrap: true,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
