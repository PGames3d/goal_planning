import 'package:flutter/material.dart';

import 'constants.dart';

class AppConstants {
  AppConstants._();

  /// timeout constants
  static const int connectTimeOut = 30000;
  static const int readTimeOut = 30000;
  static const int readTimeOutMax = 45000;

  static const String eulaPrefKey = "kias_eula_";
  static const String eulaVersionKey = "kias_version";

  static const String userDetailsPrefKey = "kias_user_details";
  static const String kiasLoginUserName = "kias_user_name";
  static const String kiaUserIdPrefKey = "kias_user_id";
  static const String sideNavBarKey = "kias_side_nav_bar";
  static const String kiasEntityIds = "kias_entity_ids";
  static const String kiasCompaniesEntityIds = "kias_company_entity_ids";

  ///user type constants
  static const String userType = "kias_user_type";
  static const String userTheme = "kias_user_selected_theme";
  static const String themePrimary = "kias_theme_primary";
  static const String allFlags = "kias_all_flags";
  static const String switches = "kias_switches";
  static const String basicInfo = "kias_basic_info";
  static const int userTypeOwner = 1;
  static const int userTypeSalesman = 2;
  static const int userTypeGodownkeeper = 3;
  static const int userTypeDeliveryman = 4;
  static const int userTypeSeniorManager   = 5;
  static const int userTypeManager   = 6;
  static const int userTypeCashier   = 7;
  static const int userTypeAdmin = 8;
  static const int userTypeAccountant = 9;
  static const int userTypeSupplyManager = 10;

  static const int otpLength = 6;

  ///Style or Theming values
  static const HintOrLabelType hintOrLabelType = HintOrLabelType.floatingLabel;
  static const AutovalidateMode autoValidateMode =
      AutovalidateMode.onUserInteraction;

  /// Configs
  static const int textFieldCharLimit = 256;
  static const int nameTextFieldCharLimit = 128;
  static const int emailCharLimit = 50;
  static const int phoneCharLimit = 30;
  static const int currentWeightCharLimit = 6;
  static const int upSessionItemCountLimit = 4;
  static const int newBookItemCountLimit = 4;
  static const int calendarServiceCountLimit = 12;

  /// API Constants
  static const int apiSuccessCode = 1;
  static const int apiErrorCode = 0;
  static const String stringTrueBoolean = "1";
  static const String stringFalseBoolean = "0";
  static const String notVirtualLocation = "1";

  /// bottom sheet values
  static const String startingTime = "12:00 AM";
  static const String endingTime = "12:00 PM";

  static const String ageRangeStart = "00";
  static const String ageRangeEnd = "80";

  static const String deviceToken = 'kias_device_token';
  static const String deviceUuid = 'kias_device_uuid';
  static const String isLogin = 'kias_isLogin';
  static const String apiUrl = 'kias_app_url';
  static const String distributorCode = 'kias_distributorCode';
  static const String distributorName = 'kias_distributor_name';
  static const String isOnboarded = 'kias_isOnboarded';
  static const String profilePic = 'kias_profilePic';
  static const String profileSate = 'kias_profileState';
  static const String isAtPersonal = 'kias_isAtPersonal';
  static const String isAtEducationFirst = 'kias_isAtEducationFirst';
  static const String isAtEducationSecond = 'kias_isAtEducationSecond';
  static const String isAtAbout = 'kias_isAtAbout';
  static const String isAtCareer = 'kias_isAtCareer';
  static const String languageCode = 'kias_language_code';
  static const String securityPasscode = 'kias_security_passcode';
  static const String isCustomLock = 'kias_is_custom_lock';
  static const String mobileNumber = 'kias_mobile_number';
  static const String password = 'kias_password';
  static const String rememberMe = 'kias_remember_me';
  static const String signedBillPicture = 'kias_signed_bill_picture';

  static const String fromList = 'List';
  static const String fromNavigation = 'Navigation';

  /// text editor heights for flutter quill
  static const double heightToolBar = 251.0;
  static const double minHeightToolBar = 100.0;



}
