import 'package:flutter_onboarding_screen_adaptive/bindings/onboarding_screen_binding.dart';
import 'package:flutter_onboarding_screen_adaptive/controller/onboarding_screen_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  // Initialize the GetX dependency manager
  setUp(() {
    // Clear any previous instances of dependencies
    Get.reset();
  });

  test('OnboardingScreenBinding should bind OnboardingScreenController', () {
    // Create an instance of OnboardingScreenBinding
    final binding = OnboardingScreenBinding();

    // Execute the dependencies method to register the controller
    binding.dependencies();

    // Retrieve the controller from the dependency manager
    final controller = Get.find<OnboardingScreenController>();

    // Verify that the controller is not null
    expect(controller, isNotNull);

    // Verify that the controller is an instance of OnboardingScreenController
    expect(controller, isA<OnboardingScreenController>());
  });
}
