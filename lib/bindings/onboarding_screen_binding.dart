import 'package:flutter_onboarding_screen_adaptive/controller/onboarding_screen_controller.dart';
import 'package:get/instance_manager.dart';

/// A binding class that manages the dependencies for the OnboardingScreen.
///
/// The [OnboardingScreenBinding] class is used to lazily instantiate and inject
/// the [OnboardingScreenController] into the dependency injection system provided by GetX.
///
/// Example usage:
/// ```dart
/// class OnboardingScreen extends GetView<OnboardingScreenController> {
///   @override
///   Widget build(BuildContext context) {
///     Get.put(OnboardingScreenBinding()); // Bind the controller
///     final controller = Get.find<OnboardingScreenController>();
///     // ... rest of the code
///   }
/// }
/// ```
class OnboardingScreenBinding extends Bindings {
  @override
  void dependencies() {
    // Lazily instantiate and register the OnboardingScreenController.
    Get.lazyPut<OnboardingScreenController>(() => OnboardingScreenController());
  }
}
