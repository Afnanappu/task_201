import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_201/view/widgets/carousel_widget.dart';

import 'package:task_201/view/widgets/home_app_bar.dart';
import 'package:task_201/view/widgets/progress_indicator_widget.dart';
import 'package:task_201/view_models/progress_card_provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ProgressIndicatorWidget(),
          CarouselWidget(carouselController: carouselController),
          bottomControlButtons(context),
        ],
      ),
    );
  }

  Row bottomControlButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        OutlinedButton(
          onPressed: () async {
            context.read<ProgressCardProvider>().previous();
            await carouselController.animateToPage(
              context.read<ProgressCardProvider>().current,
            );
          },
          child: Text(
            'Previous',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ),
        OutlinedButton(
          onPressed: () async {
            context.read<ProgressCardProvider>().next();
            await carouselController.animateToPage(
              context.read<ProgressCardProvider>().current,
            );
          },
          child: Text(
            '    Next    ',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
