import 'package:highvibe/modules/onboarding/onboarding_options.dart';
import 'package:mobx/mobx.dart';

part 'onboarding_controller.g.dart';

class OnboardingUserOptionsController = _OnboardingUserOptionsControllerBase
    with _$OnboardingUserOptionsController;

abstract class _OnboardingUserOptionsControllerBase with Store {
  final List<OnboardingOptions> optionsList = [
    OnboardingOptions(
      imagePath: 'assets/ic_knowledge.png',
      title: 'Knowledge',
      isSelected: false,
    ),
    OnboardingOptions(
      imagePath: 'assets/ic_inner_peace.png',
      title: 'Inner Peace',
      isSelected: false,
    ),
    OnboardingOptions(
      imagePath: 'assets/ic_social_life.png',
      title: 'Social Life',
      isSelected: false,
    ),
    OnboardingOptions(
      imagePath: 'assets/ic_perspective.png',
      title: 'Perspective',
      isSelected: false,
    ),
    OnboardingOptions(
      imagePath: 'assets/ic_emotions.png',
      title: 'Emotions',
      isSelected: false,
    ),
    OnboardingOptions(
      imagePath: 'assets/ic_hobbies.png',
      title: 'Hobbies',
      isSelected: false,
    ),
    OnboardingOptions(
      imagePath: 'assets/ic_resilience.png',
      title: 'Resilience',
      isSelected: false,
    ),
    OnboardingOptions(
      imagePath: 'assets/ic_motivation.png',
      title: 'Motivation',
      isSelected: false,
    ),
    OnboardingOptions(
      imagePath: 'assets/ic_stress_relief.png',
      title: 'Stress Relief',
      isSelected: false,
    ),
  ];
}
