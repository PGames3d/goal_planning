import 'package:flutter/material.dart';

import 'constants.dart';

class AppConstants {
  AppConstants._();

  /// timeout constants
  static const int connectTimeOut = 30000;
  static const int readTimeOut = 30000;
  static const int readTimeOutMax = 45000;

  static const String eulaPrefKey = "goals_eula_";
  static const String eulaVersionKey = "goals_version";

  static const String userDetailsPrefKey = "goals_user_details";
  static const String goalsLoginUserName = "goals_user_name";
  static const String goalUserIdPrefKey = "goals_user_id";
  static const String sideNavBarKey = "goals_side_nav_bar";
  static const String goalsEntityIds = "goals_entity_ids";
  static const String goalsCompaniesEntityIds = "goals_company_entity_ids";

  ///user type constants
  static const String userType = "goals_user_type";
  static const String userTheme = "goals_user_selected_theme";
  static const String themePrimary = "goals_theme_primary";
  static const String allFlags = "goals_all_flags";
  static const String switches = "goals_switches";
  static const String basicInfo = "goals_basic_info";
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

  static const String deviceToken = 'goals_device_token';
  static const String deviceUuid = 'goals_device_uuid';
  static const String isLogin = 'goals_isLogin';
  static const String apiUrl = 'goals_app_url';
  static const String distributorCode = 'goals_distributorCode';
  static const String distributorName = 'goals_distributor_name';
  static const String isOnboarded = 'goals_isOnboarded';
  static const String profilePic = 'goals_profilePic';
  static const String profileSate = 'goals_profileState';
  static const String isAtPersonal = 'goals_isAtPersonal';
  static const String isAtEducationFirst = 'goals_isAtEducationFirst';
  static const String isAtEducationSecond = 'goals_isAtEducationSecond';
  static const String isAtAbout = 'goals_isAtAbout';
  static const String isAtCareer = 'goals_isAtCareer';
  static const String languageCode = 'goals_language_code';
  static const String securityPasscode = 'goals_security_passcode';
  static const String isCustomLock = 'goals_is_custom_lock';
  static const String mobileNumber = 'goals_mobile_number';
  static const String password = 'goals_password';
  static const String rememberMe = 'goals_remember_me';
  static const String signedBillPicture = 'goals_signed_bill_picture';

  static const String fromList = 'List';
  static const String fromNavigation = 'Navigation';

  /// text editor heights for flutter quill
  static const double heightToolBar = 251.0;
  static const double minHeightToolBar = 100.0;



}
