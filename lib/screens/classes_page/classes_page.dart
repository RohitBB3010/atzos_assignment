import 'dart:js';

import 'package:atzos_assignment/constants/spacing_constants.dart';
import 'package:atzos_assignment/screens/home_page/home_page.dart';
import 'package:atzos_assignment/screens/home_page/home_page_classes.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ClassesPage extends StatefulWidget {
  final List<TrailBookClass> displayClasses;
  final List<String> levels;
  const ClassesPage(
      {super.key, required this.displayClasses, required this.levels});

  @override
  State<ClassesPage> createState() => _ClassesPageState();
}

class _ClassesPageState extends State<ClassesPage> {
  late List<TrailBookClass> searchClasses;
  final TextEditingController searchController = TextEditingController();
  late GlobalKey<FormState> formkey;

  @override
  void initState() {
    searchClasses = List.from(widget.displayClasses);
    formkey = GlobalKey();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.1,
          title: const AutoSizeText('Classes'),
          bottom: TabBar(
            tabs: [
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: const Center(child: AutoSizeText('Classes'))),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: const Center(child: AutoSizeText('Booking'))),
            ],
          ),
        ),
        body: TabBarView(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.85,
            child: Column(
              children: [
                SpacingConstants().heightBetweenFieldsSmall(context),
                customSearchBar(context, searchController, formkey),
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                      itemCount: searchClasses.length,
                      itemBuilder: (context, i) {
                        return classCard(
                            searchClasses[i], widget.levels, context, false);
                      }),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.85,
            child: Column(
              children: [
                SpacingConstants().heightBetweenFieldsSmall(context),
                customSearchBar(context, searchController, formkey),
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                      itemCount: searchClasses.length,
                      itemBuilder: (context, i) {
                        return classCard(
                            searchClasses[i], widget.levels, context, false);
                      }),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget customSearchBar(BuildContext context,
      TextEditingController searchController, GlobalKey<FormState> key) {
    return Form(
      key: key,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.08,
        child: TextFormField(
          controller: searchController,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.02),
              hintText: 'Search',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black.withOpacity(0.8)),
                  borderRadius: BorderRadius.circular(15.0))),
          onChanged: (String? value) {
            setState(() {
              searchClasses = widget.displayClasses.where((element) {
                return element.title
                    .toLowerCase()
                    .contains(value!.toLowerCase());
              }).toList();
            });
          },
        ),
      ),
    );
  }

  Widget classCard(TrailBookClass bookingClass, List<String>? levels,
      BuildContext context, bool isTrial) {
    String? levelData;
    List<String> listLevels = [];
    double screenWidth = MediaQuery.of(context).size.width;

    bool isSmallScreen = screenWidth <= 900 ? true : false;

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
              return HomePage().classDialog(
                  bookingClass, listLevels, isTrial, isSmallScreen, context);
            });
      },
      child: Card(
        elevation: 0,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.02,
            vertical: MediaQuery.of(context).size.height * 0.02,
          ),
          width: isSmallScreen
              ? MediaQuery.of(context).size.width * 0.8
              : MediaQuery.of(context).size.width * 0.27,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10.0)),
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
                          return HomePage()
                              .levelAlertDialog(listLevels, context);
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
}
