import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// A controller for managing the state and behavior of an onboarding screen with multiple pages.
///
/// This controller manages the page view and tab controller for an onboarding flow,
/// and handles page navigation and updates.
///
/// The [selectedIndex], [pageViewController], and [tabController] parameters manage the
/// current page index, the page view scrolling, and tab navigation respectively.
///
/// Example usage:
/// ```dart
/// class OnboardingScreen extends GetView<OnboardingScreenController> {
///   @override
///   Widget build(BuildContext context) {
///     final controller = Get.put(OnboardingScreenController());
///     // ... rest of the code
///   }
/// }
/// ```
class OnboardingScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  /// The currently selected page index in the onboarding flow.
  final RxInt selectedIndex = 0.obs;

  /// The controller for the PageView widget used to swipe between pages.
  late PageController pageViewController;

  /// The controller for the TabBar widget used for displaying page indicators.
  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    pageViewController = PageController();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void onClose() {
    pageViewController.dispose();
    tabController.dispose();
    super.onClose();
  }

  /// Updates the current page index and animates the PageView to the specified page.
  ///
  /// [index] The index of the page to navigate to.
  void updateCurrentPageIndex(int index) {
    tabController.index = index;
    pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  /// Handles the page view change event and updates the tab index and selected index.
  ///
  /// [currentPageIndex] The index of the currently visible page.
  void handlePageViewChanged(int currentPageIndex) {
    if (isOnDesktopAndWeb) {
      return;
    }
    tabController.index = currentPageIndex;
    selectedIndex.value = currentPageIndex;
  }

  /// Determines whether the current platform is desktop or web.
  ///
  /// Returns true if the platform is web or a desktop platform (macOS, Linux, Windows).
  bool get isOnDesktopAndWeb {
    if (kIsWeb) {
      return true;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.macOS:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return true;
      case TargetPlatform.android:
      case TargetPlatform.iOS:
      case TargetPlatform.fuchsia:
        return false;
    }
  }
}
