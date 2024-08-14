import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_screen_adaptive/controller/onboarding_screen_controller.dart';
import 'package:flutter_onboarding_screen_adaptive/widgets/page_indicator.dart';
import 'package:get/get.dart';

/// A widget that represents an onboarding screen with a series of pages to guide users through an introductory experience.
///
/// The [pages], [onSkipSelected], and [onGetStarted] parameters must not be null.
///
/// The [selectedColor], [unselectedColor], [indicatorSize], [skipText], [btnBackgroundColor]
/// parameters control the appearance and behavior of the page indicator and navigation elements.
///
/// Example usage:
/// ```dart
/// OnboardingScreen(
///   pages: [Page1(), Page2(), Page3()],
///   onSkipSelected: () => Navigator.pushNamed(context, '/home'),
///   onGetStarted: () => Navigator.pushNamed(context, '/home'),
///   selectedColor: Colors.blue,
///   unselectedColor: Colors.grey,
///   indicatorSize: 12.0,
///   skipText: "Skip",
///   btnBackgroundColor: Colors.blue,
/// );
/// ```
class OnboardingScreen extends GetView<OnboardingScreenController> {
  /// The list of pages to display in the onboarding flow. Must not exceed 3 pages.
  final List<Widget> pages;

  /// The color of the selected page indicator.
  final Color selectedColor;

  /// The color of the unselected page indicators.
  final Color unselectedColor;

  /// The size of the page indicator.
  final double indicatorSize;

  /// The text displayed on the skip button.
  final String skipText;

  /// The callback function executed when the skip button is pressed.
  final Function() onSkipSelected;

  /// The background color of the navigation button.
  final Color btnBackgroundColor;

  /// The callback function executed when the "Get Started" button is pressed.
  final void Function() onGetStarted;

  /// Creates an [OnboardingScreen] widget.
  ///
  /// The [pages], [onSkipSelected], and [onGetStarted] parameters must not be null.
  /// The [pages] list must contain no more than 3 items.
  const OnboardingScreen({
    super.key,
    required this.pages,
    required this.onSkipSelected,
    required this.onGetStarted,
    this.selectedColor = const Color.fromARGB(255, 39, 134, 103),
    this.unselectedColor = Colors.white,
    this.indicatorSize = 20,
    this.skipText = "Skip",
    this.btnBackgroundColor = const Color.fromARGB(255, 39, 134, 103),
  }) : assert(pages.length <= 3,
            'The pages list must contain no more than 3 items.');

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingScreenController());

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding:
                EdgeInsets.only(right: MediaQuery.of(context).size.width * .03),
            child: InkWell(
              onTap: () => onSkipSelected(),
              child: Text(
                skipText,
                style: const TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          /// PageView widget to display the onboarding pages with page change handling.
          PageView(
            controller: controller.pageViewController,
            onPageChanged: controller.handlePageViewChanged,
            children: pages
                .map(
                  (page) => FadeInRight(
                    delay: const Duration(milliseconds: 500),
                    child: page,
                  ),
                )
                .toList(),
          ),

          /// The page indicator and navigation button displayed at the bottom of the screen.
          Container(
            width: MediaQuery.of(context).size.width * .90,
            margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * .05),
            child: Obx(
              () => PageIndicator(
                tabController: controller.tabController,
                currentPageIndex: controller.selectedIndex.value,
                onUpdateCurrentPageIndex: controller.updateCurrentPageIndex,
                indicatorSize: indicatorSize,
                selectedColor: selectedColor,
                unselectedColor: unselectedColor,
                btnBackgroundColor: btnBackgroundColor,
                onGetStarted: onGetStarted,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
