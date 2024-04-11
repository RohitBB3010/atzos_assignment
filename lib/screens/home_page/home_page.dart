import 'package:atzos_assignment/components/custom_appbar.dart';
import 'package:atzos_assignment/components/custom_bottom_nav.dart';
import 'package:atzos_assignment/screens/home_page/home_page_cubit.dart';
import 'package:atzos_assignment/screens/home_page/home_page_state.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
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
              return AutoSizeText('Loading');
            }

            if (state is HomePageDataLoadedState) {
              return AutoSizeText('Data loaded');
            }
            return AutoSizeText('Fallen on last');
          },
        ),
      ),
    );
  }
}
