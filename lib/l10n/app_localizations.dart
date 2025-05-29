import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_hi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('hi')
  ];

  /// No description provided for @hello.
  ///
  /// In en, this message translates to:
  /// **'Hello'**
  String get hello;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @explore.
  ///
  /// In en, this message translates to:
  /// **'Explore'**
  String get explore;

  /// No description provided for @myDhan.
  ///
  /// In en, this message translates to:
  /// **'My Dhan'**
  String get myDhan;

  /// No description provided for @financialPlan.
  ///
  /// In en, this message translates to:
  /// **'Financial Plan'**
  String get financialPlan;

  /// No description provided for @specificFund.
  ///
  /// In en, this message translates to:
  /// **'Specific Funds'**
  String get specificFund;

  /// No description provided for @debtFund.
  ///
  /// In en, this message translates to:
  /// **'Debt Fund'**
  String get debtFund;

  /// No description provided for @debt.
  ///
  /// In en, this message translates to:
  /// **'Debt'**
  String get debt;

  /// No description provided for @smallCapFund.
  ///
  /// In en, this message translates to:
  /// **'Small Cap Fund'**
  String get smallCapFund;

  /// No description provided for @midCapFund.
  ///
  /// In en, this message translates to:
  /// **'Mid Cap Fund'**
  String get midCapFund;

  /// No description provided for @largeCapFund.
  ///
  /// In en, this message translates to:
  /// **'Large Cap Fund'**
  String get largeCapFund;

  /// No description provided for @equity.
  ///
  /// In en, this message translates to:
  /// **'Equity'**
  String get equity;

  /// No description provided for @sip.
  ///
  /// In en, this message translates to:
  /// **'SIP'**
  String get sip;

  /// No description provided for @totalInvestment.
  ///
  /// In en, this message translates to:
  /// **'Total Investment'**
  String get totalInvestment;

  /// No description provided for @phase1.
  ///
  /// In en, this message translates to:
  /// **'Phase 1(2025-2027)'**
  String get phase1;

  /// No description provided for @phase2.
  ///
  /// In en, this message translates to:
  /// **'Phase 2(2027-2029)'**
  String get phase2;

  /// No description provided for @phase3.
  ///
  /// In en, this message translates to:
  /// **'Phase 3(2029-2030)'**
  String get phase3;

  /// No description provided for @phasedInvestment.
  ///
  /// In en, this message translates to:
  /// **'Phased Investment Plan'**
  String get phasedInvestment;

  /// No description provided for @goal.
  ///
  /// In en, this message translates to:
  /// **'Goal'**
  String get goal;

  /// No description provided for @phase1Lbl.
  ///
  /// In en, this message translates to:
  /// **'Phase 1'**
  String get phase1Lbl;

  /// No description provided for @phase2Lbl.
  ///
  /// In en, this message translates to:
  /// **'Phase 2'**
  String get phase2Lbl;

  /// No description provided for @phase3Lbl.
  ///
  /// In en, this message translates to:
  /// **'Phase 3'**
  String get phase3Lbl;

  /// No description provided for @homeGoalCalculations.
  ///
  /// In en, this message translates to:
  /// **'Home Goal Calculations'**
  String get homeGoalCalculations;

  /// No description provided for @requiredSip.
  ///
  /// In en, this message translates to:
  /// **'Required SIP (5yrs)'**
  String get requiredSip;

  /// No description provided for @inflationAdj.
  ///
  /// In en, this message translates to:
  /// **'Inflation Adjusted'**
  String get inflationAdj;

  /// No description provided for @futureValue.
  ///
  /// In en, this message translates to:
  /// **'Future Value'**
  String get futureValue;

  /// No description provided for @shortfall.
  ///
  /// In en, this message translates to:
  /// **'Shortfall'**
  String get shortfall;

  /// No description provided for @mutualFund.
  ///
  /// In en, this message translates to:
  /// **'Mutual Fund'**
  String get mutualFund;

  /// No description provided for @stocks.
  ///
  /// In en, this message translates to:
  /// **'Stocks'**
  String get stocks;

  /// No description provided for @sipGrowth.
  ///
  /// In en, this message translates to:
  /// **'SIP Growth'**
  String get sipGrowth;

  /// No description provided for @seeHowInvest.
  ///
  /// In en, this message translates to:
  /// **'See how your investments can reach ₹10 Cr by 2030.'**
  String get seeHowInvest;

  /// No description provided for @investmentGrowth.
  ///
  /// In en, this message translates to:
  /// **'Investment Growth Projection'**
  String get investmentGrowth;

  /// No description provided for @goalPlanning.
  ///
  /// In en, this message translates to:
  /// **'Goal Planning'**
  String get goalPlanning;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'hi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'hi': return AppLocalizationsHi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
