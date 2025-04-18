import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:task_201/view/widgets/custom_card.dart';
import 'package:task_201/viewmodel/progress_card_provider.dart';
import 'package:task_201/viewmodel/toggle_card_provider.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({super.key, required this.carouselController});
  final CarouselSliderController carouselController;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: carouselController,
      options: CarouselOptions(
        height: 300.0,
        aspectRatio: 1 / 1,
        viewportFraction: 0.8,
        enableInfiniteScroll: false,
        reverse: false,
        enlargeCenterPage: true,
        enlargeFactor: 0.2,
        onPageChanged: (index, reason) {
          context.read<ProgressCardProvider>().set(index);
        },
      ),
      items:
          List.generate(
            context.read<ProgressCardProvider>().total,
            (index) => index,
          ).map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Consumer<ToggleCardProvider>(
                  builder:
                      (context, toggler, child) => FlipCard(
                        toggler: toggler.isToggle,
                        backCard: GestureDetector(
                          onTap: () {
                            context.read<ToggleCardProvider>().toggle();
                          },
                          child: CustomCard(
                            child: Center(
                              child: Text(
                                'Easy to see or understand; \nClear and obvious',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontSize: 15.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        frontCard: CustomCard(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 40),
                                Text(
                                  'Obvio',
                                  style: GoogleFonts.poppins(
                                    fontSize: 40.0,
                                    letterSpacing: 2,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),

                                speakLoudWidget(),
                                SizedBox(height: 20),
                                IconButton.filled(
                                  onPressed: () {
                                    context.read<ToggleCardProvider>().toggle();
                                  },
                                  icon: Icon(Icons.arrow_forward_ios_outlined),
                                  color: Colors.black,

                                  style: ButtonStyle(
                                    backgroundColor:
                                        WidgetStateColor.resolveWith(
                                          (_) => Colors.white,
                                        ),
                                    shape: WidgetStateProperty.resolveWith(
                                      (_) => RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          10.0,
                                        ),
                                      ),
                                    ),
                                    elevation: WidgetStateProperty.resolveWith(
                                      (_) => 8.0,
                                    ),
                                    fixedSize: WidgetStateProperty.resolveWith((
                                      _,
                                    ) {
                                      final double size = 60;
                                      return Size(size, size);
                                    }),
                                    shadowColor: WidgetStateColor.resolveWith(
                                      (_) => Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                );
              },
            );
          }).toList(),
    );
  }

  Row speakLoudWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      // spacing: 5,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.volume_up_outlined, color: Colors.white, size: 23),
        ),
        Text(
          'ob.wi.o',
          style: GoogleFonts.publicSans(fontSize: 20.0, color: Colors.white),
        ),
        SizedBox(width: 15),
      ],
    );
  }
}

class FlipCard extends StatelessWidget {
  final bool toggler;
  final Widget frontCard;
  final Widget backCard;

  const FlipCard({
    super.key,
    required this.toggler,
    required this.backCard,
    required this.frontCard,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 800),
      transitionBuilder: _transitionBuilder,
      layoutBuilder: (widget, list) => Stack(children: [widget!, ...list]),
      switchInCurve: Curves.ease,
      switchOutCurve: Curves.ease.flipped,
      child:
          toggler
              ? SizedBox(key: const ValueKey('front'), child: frontCard)
              : SizedBox(key: const ValueKey('back'), child: backCard),
    );
  }

  Widget _transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnimation = Tween(begin: pi, end: 0.0).animate(animation);
    return Consumer<ToggleCardProvider>(
      builder:
          (context, toggler, child) => AnimatedBuilder(
            animation: rotateAnimation,
            child: widget,
            builder: (context, widget) {
              final isFront = ValueKey(toggler) == widget!.key;
              final rotationY =
                  isFront
                      ? rotateAnimation.value
                      : min(rotateAnimation.value, pi * 0.5);
              return Transform(
                transform: Matrix4.rotationY(rotationY)..setEntry(3, 0, 0),
                alignment: Alignment.center,
                child: widget,
              );
            },
          ),
    );
  }
}
