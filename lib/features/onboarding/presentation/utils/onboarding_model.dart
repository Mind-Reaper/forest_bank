class OnboardingModel {
  final String titleBold;
  final String titleThin;
  final String animationAssetPath;
  final String subtitle;

  OnboardingModel(
      {required this.titleBold,
      required this.titleThin,
      required this.animationAssetPath,
      this.subtitle =
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam aliquet mollis sem, non varius libero'});
}
