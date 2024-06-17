import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/on_boarding_model.dart';
class MyHomeScreen extends StatelessWidget {
  MyHomeScreen({super.key});
  final List<OnBoardingModel> models = [
    OnBoardingModel("Explore\nYour\nDream\nCar", "Side View"),
    OnBoardingModel("Toyota", "Three-quarter Front View"),
    OnBoardingModel("Toyota", "Top-down View"),
    OnBoardingModel("Toyota", "Three-quarter Rear View"),
  ];
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.white,
              Colors.grey,
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Stack(children: [

          Positioned.fill(
              top: 80,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: PageView.builder(
                  controller: pageController,
                  itemCount: models.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          models[index].title,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          models[index].description,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    );
                  },
                ),
              )),
          Positioned(
            bottom: 32,
            right: 30,
            left: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothPageIndicator(
                  controller: pageController,
                  count: models.length,
                  axisDirection: Axis.horizontal,
                  effect: const ExpandingDotsEffect(
                      spacing: 8.0,
                      radius: 4.0,
                      dotWidth: 8.0,
                      dotHeight: 8.0,
                      strokeWidth: 1.5,
                      dotColor: Colors.white70,
                      activeDotColor: Colors.white),
                ),
                Row(
                  children: [
                    Text(
                      'Explore',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.grey.shade400,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey.shade800,
                      ),
                      onPressed: () {
                        if (pageController.page!.toInt() ==
                            models.length - 1) {
                        } else {
                          pageController.animateToPage(
                              pageController.page!.toInt() + 1,
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeInSine);
                        }
                      }
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
        ),
      ),
    );
  }
}
