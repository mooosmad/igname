import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igname_li/theme/choosetheme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // bottomNavigationBar: Container(
      //   height: 50,
      //   // color: Colors.white,
      // ),
      bottomSheet: Container(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
        height: 70,
        child: Center(
          child: SmoothPageIndicator(
            controller: controller, // PageController
            count: 3,
            effect: const ScrollingDotsEffect(
              // expansionFactor: 2.2,
              dotColor: Colors.black,
              activeDotColor: Colors.white,
              dotWidth: 15,
              dotHeight: 5,
              spacing: 5,
            ),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     if (controller.page!.toInt() == 2) {
      //       //next page
      //       Get.to(
      //         const ChooseThemePage(),
      //         transition: Transition.cupertino,
      //         duration: const Duration(milliseconds: 900),
      //         popGesture: true,
      //       );
      //     } else {
      //       controller.nextPage(
      //         duration: const Duration(milliseconds: 600),
      //         curve: Curves.easeIn,
      //       );
      //     }
      //   },
      //   child: const Icon(Icons.arrow_forward_rounded),
      // ),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: TextButton(
              onPressed: () {
                Get.to(
                  const ChooseThemePage(),
                  transition: Transition.cupertino,
                  duration: const Duration(milliseconds: 900),
                  popGesture: true,
                );
              },
              child: Text(
                "passer",
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ),
        ],
      ),
      body: PageView(
        physics: const BouncingScrollPhysics(),
        children: [
          const OnBoardingPage(
            asset: "assets/images/delivery.png",
            title: "Faites livrer tous vos colis en un clic",
            description: "Faite livrer tous vos colis en un clic",
          ),
          const OnBoardingPage(
            asset: "assets/images/preview.png",
            title:
                "Gardez toujours un oeil sur vos articles en cours de livraison",
            description: "onboardDescription2",
          ),
          const OnBoardingPage(
            asset: "assets/images/rectangle.png",
            title: "onboardTitle3",
            description: "onboardDescription3",
          ),
        ],
        controller: controller,
      ),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  final String? asset;
  final String? title;
  final String? description;

  const OnBoardingPage({Key? key, this.asset, this.title, this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xfffdc72f),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            child: Text(
              title!,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Image.asset(
            asset!,
            fit: BoxFit.cover,
            // repeat: false,
          ),
          // Container(
          //   color: const Color(0xfffdc72f),
          //   height: 50,
          // ),
        ],
      ),
    );
  }
}
