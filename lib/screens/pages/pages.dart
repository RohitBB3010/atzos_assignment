import 'package:atzos_assignment/constants/spacing_constants.dart';
import 'package:atzos_assignment/screens/home_page/home_page.dart';
import 'package:atzos_assignment/screens/home_page/home_page_classes.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Pages extends StatefulWidget {
  final List<Plan> plansList;
  const Pages({super.key, required this.plansList});

  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  late List<Plan> searchPlans;
  final TextEditingController searchController = TextEditingController();
  late GlobalKey<FormState> formkey;

  @override
  void initState() {
    searchPlans = List.from(widget.plansList);
    formkey = GlobalKey();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isSmallScreen = screenWidth <= 900 ? true : false;

    return Scaffold(
      appBar: AppBar(
        title: const AutoSizeText('Pages'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SpacingConstants().heightBetweenFieldsSmall(context),
          customSearchBar(context, searchController, formkey),
          Expanded(
            flex: 1,
            child: ListView.builder(
                itemCount: searchPlans.length,
                itemBuilder: (context, i) {
                  return planCard(searchPlans[i], isSmallScreen, context);
                }),
          ),
        ],
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
              searchPlans = widget.plansList.where((element) {
                return element.name.contains(value!.toLowerCase());
              }).toList();
            });
          },
        ),
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
      elevation: 0,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.03,
          vertical: MediaQuery.of(context).size.height * 0.01,
        ),
        width: isSmallScreen
            ? MediaQuery.of(context).size.width * 0.7
            : MediaQuery.of(context).size.width * 0.27,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10.0)),
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
