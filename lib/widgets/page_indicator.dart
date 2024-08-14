import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

/// A widget that provides a page indicator with navigation controls for a multi-page
/// onboarding or tutorial experience.
///
/// The [tabController], [currentPageIndex], [onUpdateCurrentPageIndex], [indicatorSize],
/// [selectedColor], [unselectedColor], [btnBackgroundColor], [onGetStarted], [nextText], and
/// [getStartedText] parameters must not be null.
///
/// The [indicatorSize], [selectedColor], [unselectedColor], [btnBackgroundColor], [nextText],
/// and [getStartedText] parameters control the appearance and behavior of the page indicator and
/// navigation button.
///
/// Example usage:
/// ```dart
/// PageIndicator(
///   tabController: _tabController,
///   currentPageIndex: _currentPageIndex,
///   onUpdateCurrentPageIndex: (index) => setState(() => _currentPageIndex = index),
///   indicatorSize: 8.0,
///   selectedColor: Colors.blue,
///   unselectedColor: Colors.grey,
///   btnBackgroundColor: Colors.blue,
///   onGetStarted: () => Navigator.pushNamed(context, '/home'),
/// );
/// ```
class PageIndicator extends StatelessWidget {
  /// The current index of the page.
  final int currentPageIndex;

  /// The [TabController] that manages the tab index.
  final TabController tabController;

  /// A callback function to update the current page index.
  final void Function(int) onUpdateCurrentPageIndex;

  /// The size of the page indicator.
  final double indicatorSize;

  /// The color of the selected page indicator.
  final Color selectedColor;

  /// The color of the unselected page indicators.
  final Color unselectedColor;

  /// The background color of the navigation button.
  final Color btnBackgroundColor;

  /// A callback function to be called when the "Get Started" button is pressed.
  final void Function() onGetStarted;

  /// The text to display on the button when the current page index is less than 2.
  final String nextText;

  /// The text to display on the button when the current page index is 2 or more.
  final String getStartedText;

  /// Creates a [PageIndicator] widget.
  ///
  /// The [tabController], [currentPageIndex], [onUpdateCurrentPageIndex], [indicatorSize],
  /// [selectedColor], [unselectedColor], [btnBackgroundColor], [onGetStarted], [nextText],
  /// and [getStartedText] parameters must not be null.
  const PageIndicator({
    super.key,
    required this.tabController,
    required this.currentPageIndex,
    required this.onUpdateCurrentPageIndex,
    required this.indicatorSize,
    required this.selectedColor,
    required this.unselectedColor,
    required this.btnBackgroundColor,
    required this.onGetStarted,
    this.nextText = "Next",
    this.getStartedText = "Get Started",
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// The page indicator that shows the current page and total pages.
          TabPageSelector(
            controller: tabController,
            color: unselectedColor,
            selectedColor: selectedColor,
            indicatorSize: indicatorSize,
          ),

          /// The button that navigates to the next page or completes the onboarding.
          FadeInDown(
            child: SizedBox(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: btnBackgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                onPressed: () {
                  if (currentPageIndex < 2) {
                    onUpdateCurrentPageIndex(currentPageIndex + 1);
                  } else {
                    onGetStarted();
                  }
                },
                child: Text(
                  currentPageIndex < 2 ? nextText : getStartedText,
                  style: const TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontFamily: 'Gilroy',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
