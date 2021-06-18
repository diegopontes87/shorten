class AppStrings {
  static const String emptyString = '';

  //SHARED APP STRINGS
  static const String appTitle = 'Shortly';
  static const String error = 'Error';
  static const String emptyListMessage = 'There is no available link list!';
  static const String emptyValueErrorMessage = 'This field cannot be empty!';
  static const String savingDBError = 'Error while trying to store url!';

  //WELCOME PAGE STRINGS
  static const String welcomeTitle = 'More than just\n shorter links';
  static const String welcomeSubtitle = 'Build your brand´s recognition and\n get detailed insights on how your\n links are performing.';
  static const String welcomeButtonText = 'START';

  //ONBOARDING PAGE STRINGS
  static const String firstOnboardingTitle = 'Brand Recognition';
  static const String firstOnboardingSubtitle =
      'Boost your brand recognition\n with each click. Generic links\n don´t mean a thing. Branded\n links help instil confidence in\n your content';

  static const String secondOnboardingTitle = 'Detailed Records';
  static const String secondOnboardingSubtitle =
      'Gain insights into who is clicking\n your links. Knowing when and\n where people engage with your\n content helps inform better\n decisions';

  static const String thirdOnboardingTitle = 'Fully Customizable';
  static const String thirdOnboardingSubtitle =
      'lmprove brand awareness and\n content discoverability through\n customizable links,\n supercharglng audience\n engagement';

  static const String onboardingButtonText = 'Skip';

  //HOME PAGE STRINGS
  static const String startTitle = 'Let´s get started!';
  static const String startSubtitle = 'Paste your first link into\n the field to shorten it';
  static const String homeShortenButtonText = 'SHORTEN IT!';
  static const String homeShortenTextFieldText = 'Shorten a link here ...';
  static const String homeShortenTextFieldErrorText = 'Please add a link here';

  //LOCAL KEYS TO ACCESS STORAGE
  static const String localListKey = 'localListKey';

  //DATABASE TABLE STRINGS
  static const String tableName = 'ShortenUrlTable';
  static const String idColumn = 'id';
  static const String codeColumn = 'code';
  static const String shortLinkColumn = 'short_link';
  static const String originalLinkColumn = 'original_link';
}
