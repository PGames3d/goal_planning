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

  /// No description provided for @endDate.
  ///
  /// In en, this message translates to:
  /// **'End Date'**
  String get endDate;

  /// No description provided for @startDate.
  ///
  /// In en, this message translates to:
  /// **'Start Date'**
  String get startDate;

  /// No description provided for @helloBack.
  ///
  /// In en, this message translates to:
  /// **'Hello back'**
  String get helloBack;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back ! Please enter your details.'**
  String get welcomeBack;

  /// No description provided for @mobileNo.
  ///
  /// In en, this message translates to:
  /// **'Mobile number'**
  String get mobileNo;

  /// No description provided for @thisMonth.
  ///
  /// In en, this message translates to:
  /// **'This month'**
  String get thisMonth;

  /// No description provided for @thisWeek.
  ///
  /// In en, this message translates to:
  /// **'This week'**
  String get thisWeek;

  /// No description provided for @lastWeek.
  ///
  /// In en, this message translates to:
  /// **'Last week'**
  String get lastWeek;

  /// No description provided for @enterMobileNo.
  ///
  /// In en, this message translates to:
  /// **'Enter Mobile Number'**
  String get enterMobileNo;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @oldPassword.
  ///
  /// In en, this message translates to:
  /// **'Old Password'**
  String get oldPassword;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPassword;

  /// No description provided for @enterPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter Password'**
  String get enterPassword;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @enterOldPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter Old Password'**
  String get enterOldPassword;

  /// No description provided for @enterNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter New Password'**
  String get enterNewPassword;

  /// No description provided for @enterConfirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter Confirm Password'**
  String get enterConfirmPassword;

  /// No description provided for @enterOTP.
  ///
  /// In en, this message translates to:
  /// **'Enter OTP'**
  String get enterOTP;

  /// No description provided for @otp.
  ///
  /// In en, this message translates to:
  /// **'OTP'**
  String get otp;

  /// No description provided for @rememberMe.
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get rememberMe;

  /// No description provided for @forgetPassword.
  ///
  /// In en, this message translates to:
  /// **'Forget password?'**
  String get forgetPassword;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @logOut.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get logOut;

  /// No description provided for @myProfile.
  ///
  /// In en, this message translates to:
  /// **'My profile'**
  String get myProfile;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @ledger.
  ///
  /// In en, this message translates to:
  /// **'Ledger'**
  String get ledger;

  /// No description provided for @exportLedger.
  ///
  /// In en, this message translates to:
  /// **'Export Ledger'**
  String get exportLedger;

  /// No description provided for @attendance.
  ///
  /// In en, this message translates to:
  /// **'Attendance'**
  String get attendance;

  /// No description provided for @activePaymentLinks.
  ///
  /// In en, this message translates to:
  /// **'Active payment links'**
  String get activePaymentLinks;

  /// No description provided for @finalizedRef.
  ///
  /// In en, this message translates to:
  /// **'Finalized reference'**
  String get finalizedRef;

  /// No description provided for @paidRef.
  ///
  /// In en, this message translates to:
  /// **'Paid reference'**
  String get paidRef;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePassword;

  /// No description provided for @changeDistributor.
  ///
  /// In en, this message translates to:
  /// **'Change Distributor'**
  String get changeDistributor;

  /// No description provided for @changeSecurity.
  ///
  /// In en, this message translates to:
  /// **'Change Security'**
  String get changeSecurity;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get forgotPassword;

  /// No description provided for @sendOTP.
  ///
  /// In en, this message translates to:
  /// **'Send OTP'**
  String get sendOTP;

  /// No description provided for @verifyOTP.
  ///
  /// In en, this message translates to:
  /// **'Verify OTP'**
  String get verifyOTP;

  /// No description provided for @allocation.
  ///
  /// In en, this message translates to:
  /// **'Allocation'**
  String get allocation;

  /// No description provided for @allocations.
  ///
  /// In en, this message translates to:
  /// **'Allocations'**
  String get allocations;

  /// No description provided for @approvals.
  ///
  /// In en, this message translates to:
  /// **'Approvals'**
  String get approvals;

  /// No description provided for @item.
  ///
  /// In en, this message translates to:
  /// **'Item'**
  String get item;

  /// No description provided for @itemNotFound.
  ///
  /// In en, this message translates to:
  /// **'Item details not available'**
  String get itemNotFound;

  /// No description provided for @mrp.
  ///
  /// In en, this message translates to:
  /// **'MRP'**
  String get mrp;

  /// No description provided for @billedQty.
  ///
  /// In en, this message translates to:
  /// **'Billed Qty'**
  String get billedQty;

  /// No description provided for @srQty.
  ///
  /// In en, this message translates to:
  /// **'SR Qty'**
  String get srQty;

  /// No description provided for @srAmt.
  ///
  /// In en, this message translates to:
  /// **'SR Amt'**
  String get srAmt;

  /// No description provided for @qty.
  ///
  /// In en, this message translates to:
  /// **'QTY'**
  String get qty;

  /// No description provided for @notes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get notes;

  /// No description provided for @saleReturn.
  ///
  /// In en, this message translates to:
  /// **'Sale Return'**
  String get saleReturn;

  /// No description provided for @retailerCodeLabel.
  ///
  /// In en, this message translates to:
  /// **'Retailer Code :'**
  String get retailerCodeLabel;

  /// No description provided for @billNoLabel.
  ///
  /// In en, this message translates to:
  /// **'Bill No:'**
  String get billNoLabel;

  /// No description provided for @divisionLabel.
  ///
  /// In en, this message translates to:
  /// **'Division:'**
  String get divisionLabel;

  /// No description provided for @currentOutstandingLabel.
  ///
  /// In en, this message translates to:
  /// **'Current Outstanding:'**
  String get currentOutstandingLabel;

  /// No description provided for @billDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Bill Date:'**
  String get billDateLabel;

  /// No description provided for @clearedLabel.
  ///
  /// In en, this message translates to:
  /// **'Cleared in/Due for:'**
  String get clearedLabel;

  /// No description provided for @statusLabel.
  ///
  /// In en, this message translates to:
  /// **'Status :'**
  String get statusLabel;

  /// No description provided for @salesmanLabel.
  ///
  /// In en, this message translates to:
  /// **'Salesman :'**
  String get salesmanLabel;

  /// No description provided for @routeNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Route Name :'**
  String get routeNameLabel;

  /// No description provided for @netAmountLabel.
  ///
  /// In en, this message translates to:
  /// **'Net amount :'**
  String get netAmountLabel;

  /// No description provided for @pastCollect.
  ///
  /// In en, this message translates to:
  /// **'Past collect'**
  String get pastCollect;

  /// No description provided for @pastSR.
  ///
  /// In en, this message translates to:
  /// **'Past SR'**
  String get pastSR;

  /// No description provided for @unit.
  ///
  /// In en, this message translates to:
  /// **'Unit'**
  String get unit;

  /// No description provided for @subtotal.
  ///
  /// In en, this message translates to:
  /// **'Subtotal'**
  String get subtotal;

  /// No description provided for @receipts.
  ///
  /// In en, this message translates to:
  /// **'Receipts'**
  String get receipts;

  /// No description provided for @pendingLabel.
  ///
  /// In en, this message translates to:
  /// **'Pending :'**
  String get pendingLabel;

  /// No description provided for @billAmount.
  ///
  /// In en, this message translates to:
  /// **'Bill amount'**
  String get billAmount;

  /// No description provided for @billAmt.
  ///
  /// In en, this message translates to:
  /// **'Bill amt'**
  String get billAmt;

  /// No description provided for @billDate.
  ///
  /// In en, this message translates to:
  /// **'Bill date'**
  String get billDate;

  /// No description provided for @billNo.
  ///
  /// In en, this message translates to:
  /// **'Bill No.'**
  String get billNo;

  /// No description provided for @expense.
  ///
  /// In en, this message translates to:
  /// **'Expense'**
  String get expense;

  /// No description provided for @cashSubmit.
  ///
  /// In en, this message translates to:
  /// **'Cash to submit'**
  String get cashSubmit;

  /// No description provided for @physicalCash.
  ///
  /// In en, this message translates to:
  /// **'Physical cash'**
  String get physicalCash;

  /// No description provided for @short.
  ///
  /// In en, this message translates to:
  /// **'Short'**
  String get short;

  /// No description provided for @excess.
  ///
  /// In en, this message translates to:
  /// **'Excess'**
  String get excess;

  /// No description provided for @netAmt.
  ///
  /// In en, this message translates to:
  /// **'Net Amt'**
  String get netAmt;

  /// No description provided for @gstNumber.
  ///
  /// In en, this message translates to:
  /// **'GST number'**
  String get gstNumber;

  /// No description provided for @todaySR.
  ///
  /// In en, this message translates to:
  /// **'Today SR'**
  String get todaySR;

  /// No description provided for @amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amount;

  /// No description provided for @coins.
  ///
  /// In en, this message translates to:
  /// **'Coins'**
  String get coins;

  /// No description provided for @chDate.
  ///
  /// In en, this message translates to:
  /// **'Ch.Date'**
  String get chDate;

  /// No description provided for @paidAmount.
  ///
  /// In en, this message translates to:
  /// **'Paid amount'**
  String get paidAmount;

  /// No description provided for @collection.
  ///
  /// In en, this message translates to:
  /// **'Collection'**
  String get collection;

  /// No description provided for @pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pending;

  /// No description provided for @mode.
  ///
  /// In en, this message translates to:
  /// **'Mode'**
  String get mode;

  /// No description provided for @retailerCode.
  ///
  /// In en, this message translates to:
  /// **'Retailer code'**
  String get retailerCode;

  /// No description provided for @salesman.
  ///
  /// In en, this message translates to:
  /// **'Sales man'**
  String get salesman;

  /// No description provided for @route.
  ///
  /// In en, this message translates to:
  /// **'Route'**
  String get route;

  /// No description provided for @division.
  ///
  /// In en, this message translates to:
  /// **'Division'**
  String get division;

  /// No description provided for @recent.
  ///
  /// In en, this message translates to:
  /// **'Recent'**
  String get recent;

  /// No description provided for @outstandings.
  ///
  /// In en, this message translates to:
  /// **'Outstandings'**
  String get outstandings;

  /// No description provided for @totalOutstanding.
  ///
  /// In en, this message translates to:
  /// **'Total Outstanding'**
  String get totalOutstanding;

  /// No description provided for @selectedBills.
  ///
  /// In en, this message translates to:
  /// **'Selected bills'**
  String get selectedBills;

  /// No description provided for @addToAllocation.
  ///
  /// In en, this message translates to:
  /// **'Add to allocation'**
  String get addToAllocation;

  /// No description provided for @createNew.
  ///
  /// In en, this message translates to:
  /// **'Create new'**
  String get createNew;

  /// No description provided for @retailer.
  ///
  /// In en, this message translates to:
  /// **'Retailer'**
  String get retailer;

  /// No description provided for @newSupply.
  ///
  /// In en, this message translates to:
  /// **'New supply'**
  String get newSupply;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @newReferences.
  ///
  /// In en, this message translates to:
  /// **'New references'**
  String get newReferences;

  /// No description provided for @searchBills.
  ///
  /// In en, this message translates to:
  /// **'Search bill'**
  String get searchBills;

  /// No description provided for @openSR.
  ///
  /// In en, this message translates to:
  /// **'Open SR'**
  String get openSR;

  /// No description provided for @retailers.
  ///
  /// In en, this message translates to:
  /// **'Retailers'**
  String get retailers;

  /// No description provided for @past.
  ///
  /// In en, this message translates to:
  /// **'Past'**
  String get past;

  /// No description provided for @openAllocation.
  ///
  /// In en, this message translates to:
  /// **'Open Allocation'**
  String get openAllocation;

  /// No description provided for @pastAllocation.
  ///
  /// In en, this message translates to:
  /// **'Past Allocation'**
  String get pastAllocation;

  /// No description provided for @recentPayment.
  ///
  /// In en, this message translates to:
  /// **'Recent Payment'**
  String get recentPayment;

  /// No description provided for @outstandingBills.
  ///
  /// In en, this message translates to:
  /// **'Outstanding Bills'**
  String get outstandingBills;

  /// No description provided for @billReceived.
  ///
  /// In en, this message translates to:
  /// **'Bill Received Details'**
  String get billReceived;

  /// No description provided for @chequeReconcilation.
  ///
  /// In en, this message translates to:
  /// **'Cheque/NEFT Reconcilation'**
  String get chequeReconcilation;

  /// No description provided for @debitedAmountDetails.
  ///
  /// In en, this message translates to:
  /// **'Debited Amount Details'**
  String get debitedAmountDetails;

  /// No description provided for @billPaymentHistory.
  ///
  /// In en, this message translates to:
  /// **'Bill Payment History'**
  String get billPaymentHistory;

  /// No description provided for @generateLedger.
  ///
  /// In en, this message translates to:
  /// **'Generate Ledger'**
  String get generateLedger;

  /// No description provided for @checkInHand.
  ///
  /// In en, this message translates to:
  /// **'Cheque in hand'**
  String get checkInHand;

  /// No description provided for @checkIn.
  ///
  /// In en, this message translates to:
  /// **'Check In'**
  String get checkIn;

  /// No description provided for @checkedIn.
  ///
  /// In en, this message translates to:
  /// **'Checked In'**
  String get checkedIn;

  /// No description provided for @checkedOut.
  ///
  /// In en, this message translates to:
  /// **'Checked Out'**
  String get checkedOut;

  /// No description provided for @hoursWorked.
  ///
  /// In en, this message translates to:
  /// **'Hours Worked'**
  String get hoursWorked;

  /// No description provided for @billNotation.
  ///
  /// In en, this message translates to:
  /// **'Bill Notation'**
  String get billNotation;

  /// No description provided for @uncertainBills.
  ///
  /// In en, this message translates to:
  /// **'Uncertain Bills'**
  String get uncertainBills;

  /// No description provided for @retailerLedger.
  ///
  /// In en, this message translates to:
  /// **'Retailer Ledger'**
  String get retailerLedger;

  /// No description provided for @hisab.
  ///
  /// In en, this message translates to:
  /// **'Hisab'**
  String get hisab;

  /// No description provided for @billHistory.
  ///
  /// In en, this message translates to:
  /// **'Bill History'**
  String get billHistory;

  /// No description provided for @review.
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get review;

  /// No description provided for @sr.
  ///
  /// In en, this message translates to:
  /// **'SR'**
  String get sr;

  /// No description provided for @viewBill.
  ///
  /// In en, this message translates to:
  /// **'View Bill'**
  String get viewBill;

  /// No description provided for @fsr.
  ///
  /// In en, this message translates to:
  /// **'FSR'**
  String get fsr;

  /// No description provided for @bill.
  ///
  /// In en, this message translates to:
  /// **'Bill'**
  String get bill;

  /// No description provided for @cashier.
  ///
  /// In en, this message translates to:
  /// **'Cashier'**
  String get cashier;

  /// No description provided for @cash.
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get cash;

  /// No description provided for @generateOTP.
  ///
  /// In en, this message translates to:
  /// **'Generate OTP'**
  String get generateOTP;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @resendOTP.
  ///
  /// In en, this message translates to:
  /// **'Resend OTP'**
  String get resendOTP;

  /// No description provided for @sentOtpOnRetailer.
  ///
  /// In en, this message translates to:
  /// **'We have sent OTP on Retailer Number'**
  String get sentOtpOnRetailer;

  /// No description provided for @call.
  ///
  /// In en, this message translates to:
  /// **'Call'**
  String get call;

  /// No description provided for @cashierDetails.
  ///
  /// In en, this message translates to:
  /// **'Cashier Transaction Details'**
  String get cashierDetails;

  /// No description provided for @uploadImage.
  ///
  /// In en, this message translates to:
  /// **'Upload Image *'**
  String get uploadImage;

  /// No description provided for @uploadImageLabel.
  ///
  /// In en, this message translates to:
  /// **'Upload Image'**
  String get uploadImageLabel;

  /// No description provided for @srFsr.
  ///
  /// In en, this message translates to:
  /// **'SR/FSR'**
  String get srFsr;

  /// No description provided for @cheque.
  ///
  /// In en, this message translates to:
  /// **'Cheque'**
  String get cheque;

  /// No description provided for @debit.
  ///
  /// In en, this message translates to:
  /// **'Debit'**
  String get debit;

  /// No description provided for @employeeName.
  ///
  /// In en, this message translates to:
  /// **'Employee Name'**
  String get employeeName;

  /// No description provided for @employeeCode.
  ///
  /// In en, this message translates to:
  /// **'Employee Code'**
  String get employeeCode;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @loginID.
  ///
  /// In en, this message translates to:
  /// **'Login ID'**
  String get loginID;

  /// No description provided for @role.
  ///
  /// In en, this message translates to:
  /// **'Role'**
  String get role;

  /// No description provided for @currentBalance.
  ///
  /// In en, this message translates to:
  /// **'Current Balance'**
  String get currentBalance;

  /// No description provided for @balance.
  ///
  /// In en, this message translates to:
  /// **'Balance'**
  String get balance;

  /// No description provided for @debitedAmount.
  ///
  /// In en, this message translates to:
  /// **'Debited Amount'**
  String get debitedAmount;

  /// No description provided for @neft.
  ///
  /// In en, this message translates to:
  /// **'NEFT'**
  String get neft;

  /// No description provided for @other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// No description provided for @credit.
  ///
  /// In en, this message translates to:
  /// **'Credit'**
  String get credit;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @chNeft.
  ///
  /// In en, this message translates to:
  /// **'Ch/NEFT'**
  String get chNeft;

  /// No description provided for @srOther.
  ///
  /// In en, this message translates to:
  /// **'SR/Other'**
  String get srOther;

  /// No description provided for @resend.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get resend;

  /// No description provided for @sign.
  ///
  /// In en, this message translates to:
  /// **'Sign'**
  String get sign;

  /// No description provided for @billDetails.
  ///
  /// In en, this message translates to:
  /// **'Bill Details'**
  String get billDetails;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @yourDetailsHaveBeenSaved.
  ///
  /// In en, this message translates to:
  /// **'Your details have been saved'**
  String get yourDetailsHaveBeenSaved;

  /// No description provided for @enterCashAmount.
  ///
  /// In en, this message translates to:
  /// **'Enter Cash Amount'**
  String get enterCashAmount;

  /// No description provided for @permissionMessage.
  ///
  /// In en, this message translates to:
  /// **'You do not have the necessary permissions to access this page'**
  String get permissionMessage;

  /// No description provided for @permissionActionMessage.
  ///
  /// In en, this message translates to:
  /// **'Additional permissions are required to complete this action'**
  String get permissionActionMessage;

  /// No description provided for @notApplicable.
  ///
  /// In en, this message translates to:
  /// **'N/A'**
  String get notApplicable;

  /// No description provided for @normalDateFormat.
  ///
  /// In en, this message translates to:
  /// **'MM/DD/YYYY'**
  String get normalDateFormat;

  /// No description provided for @dataIsNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get dataIsNotAvailable;

  /// No description provided for @accessDenied.
  ///
  /// In en, this message translates to:
  /// **'Access denied'**
  String get accessDenied;

  /// No description provided for @pleaseTryAgainLater.
  ///
  /// In en, this message translates to:
  /// **'Please try again later'**
  String get pleaseTryAgainLater;

  /// No description provided for @invalidRequest.
  ///
  /// In en, this message translates to:
  /// **'Invalid request'**
  String get invalidRequest;

  /// No description provided for @unknownErrorOccurred.
  ///
  /// In en, this message translates to:
  /// **'Unknown error occurred'**
  String get unknownErrorOccurred;

  /// No description provided for @theConnectionHasTimedOut.
  ///
  /// In en, this message translates to:
  /// **'The connection has timed out'**
  String get theConnectionHasTimedOut;

  /// No description provided for @theRequestedInformationCouldNotBeFound.
  ///
  /// In en, this message translates to:
  /// **'The requested information could not be found'**
  String get theRequestedInformationCouldNotBeFound;

  /// No description provided for @requestUnProcessable.
  ///
  /// In en, this message translates to:
  /// **'Request unprocessable'**
  String get requestUnProcessable;

  /// No description provided for @noInternetConnectionAvailable.
  ///
  /// In en, this message translates to:
  /// **'No internet connection available'**
  String get noInternetConnectionAvailable;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get somethingWentWrong;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signIn;

  /// No description provided for @proceed.
  ///
  /// In en, this message translates to:
  /// **'Proceed'**
  String get proceed;

  /// No description provided for @continueWithEmail.
  ///
  /// In en, this message translates to:
  /// **'Continue with email'**
  String get continueWithEmail;

  /// No description provided for @welcomeToGoal.
  ///
  /// In en, this message translates to:
  /// **'Welcome To Goal'**
  String get welcomeToGoal;

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Goal'**
  String get appName;

  /// No description provided for @defaultThemeMessage.
  ///
  /// In en, this message translates to:
  /// **'Default theme set successfully!'**
  String get defaultThemeMessage;

  /// No description provided for @customDate.
  ///
  /// In en, this message translates to:
  /// **'Custom Date'**
  String get customDate;

  /// No description provided for @defaultTheme.
  ///
  /// In en, this message translates to:
  /// **'Default theme'**
  String get defaultTheme;

  /// No description provided for @previousYear.
  ///
  /// In en, this message translates to:
  /// **'Previous Financial Year'**
  String get previousYear;

  /// No description provided for @currentYear.
  ///
  /// In en, this message translates to:
  /// **'Current Financial Year'**
  String get currentYear;

  /// No description provided for @distributorMessage.
  ///
  /// In en, this message translates to:
  /// **'Please let us know your distributor code'**
  String get distributorMessage;

  /// No description provided for @distributorErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Please enter distributor code'**
  String get distributorErrorMessage;

  /// No description provided for @loginError.
  ///
  /// In en, this message translates to:
  /// **'User not found'**
  String get loginError;

  /// No description provided for @distributorCode.
  ///
  /// In en, this message translates to:
  /// **'Distributor code'**
  String get distributorCode;

  /// No description provided for @enterRegEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your registered email/mobile no.'**
  String get enterRegEmail;

  /// No description provided for @emailOrPhone.
  ///
  /// In en, this message translates to:
  /// **'Email or Phone'**
  String get emailOrPhone;

  /// No description provided for @getOTP.
  ///
  /// In en, this message translates to:
  /// **'Get OTP'**
  String get getOTP;

  /// No description provided for @enter6DigitRecoveryCode.
  ///
  /// In en, this message translates to:
  /// **'Enter 6 digit recovery code'**
  String get enter6DigitRecoveryCode;

  /// No description provided for @a6DigitRecoveryCodeSent.
  ///
  /// In en, this message translates to:
  /// **'A 6 digit recovery code has been sent to'**
  String get a6DigitRecoveryCodeSent;

  /// No description provided for @enterOneTimePassword.
  ///
  /// In en, this message translates to:
  /// **'Enter one time password'**
  String get enterOneTimePassword;

  /// No description provided for @oneTimePasswordSentTo.
  ///
  /// In en, this message translates to:
  /// **'One Time Password has been sent to'**
  String get oneTimePasswordSentTo;

  /// No description provided for @reEnterEmail.
  ///
  /// In en, this message translates to:
  /// **'Re-enter email'**
  String get reEnterEmail;

  /// No description provided for @enterCode.
  ///
  /// In en, this message translates to:
  /// **'Enter code'**
  String get enterCode;

  /// No description provided for @resendRecoverCode.
  ///
  /// In en, this message translates to:
  /// **'Resend recovery code'**
  String get resendRecoverCode;

  /// No description provided for @resendOneTimePassword.
  ///
  /// In en, this message translates to:
  /// **'Resend one time password'**
  String get resendOneTimePassword;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @blankError.
  ///
  /// In en, this message translates to:
  /// **'Can\'t be blank'**
  String get blankError;

  /// No description provided for @recoveryEmailMustBeDifferent.
  ///
  /// In en, this message translates to:
  /// **'Recovery email must be different'**
  String get recoveryEmailMustBeDifferent;

  /// No description provided for @passwordValidationError.
  ///
  /// In en, this message translates to:
  /// **'Must have 8 characters at least one number, one lowercase and one uppercase letter & one special character'**
  String get passwordValidationError;

  /// No description provided for @passwordMatchError.
  ///
  /// In en, this message translates to:
  /// **'New Password and Re-enter Password both should match'**
  String get passwordMatchError;

  /// No description provided for @reEnterPassword.
  ///
  /// In en, this message translates to:
  /// **'Re-enter password'**
  String get reEnterPassword;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @chats.
  ///
  /// In en, this message translates to:
  /// **'Chats'**
  String get chats;

  /// No description provided for @saveDetails.
  ///
  /// In en, this message translates to:
  /// **'Save details'**
  String get saveDetails;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @terms.
  ///
  /// In en, this message translates to:
  /// **'Terms of use'**
  String get terms;

  /// No description provided for @privacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get privacy;

  /// No description provided for @upload.
  ///
  /// In en, this message translates to:
  /// **'Upload'**
  String get upload;

  /// No description provided for @uploadVideosPdf.
  ///
  /// In en, this message translates to:
  /// **'Upload'**
  String get uploadVideosPdf;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get fullName;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last name'**
  String get lastName;

  /// No description provided for @enterFirstName.
  ///
  /// In en, this message translates to:
  /// **'Enter first name'**
  String get enterFirstName;

  /// No description provided for @enterLastName.
  ///
  /// In en, this message translates to:
  /// **'Enter last name'**
  String get enterLastName;

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'First name'**
  String get firstName;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @recoveryEmail.
  ///
  /// In en, this message translates to:
  /// **'Email (Recovery)'**
  String get recoveryEmail;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phoneNumber;

  /// No description provided for @phoneNo.
  ///
  /// In en, this message translates to:
  /// **'Phone no'**
  String get phoneNo;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// No description provided for @dateOfBirth.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get dateOfBirth;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @ethnicity.
  ///
  /// In en, this message translates to:
  /// **'Ethnicity'**
  String get ethnicity;

  /// No description provided for @changeLanguage.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get changeLanguage;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// No description provided for @selectThemeColor.
  ///
  /// In en, this message translates to:
  /// **'Select theme color'**
  String get selectThemeColor;

  /// No description provided for @selectThemeColorShade.
  ///
  /// In en, this message translates to:
  /// **'Select theme color shade'**
  String get selectThemeColorShade;

  /// No description provided for @selectedThemeColorShade.
  ///
  /// In en, this message translates to:
  /// **'Selected theme color and its shades'**
  String get selectedThemeColorShade;

  /// No description provided for @areYouSure.
  ///
  /// In en, this message translates to:
  /// **'Are you sure?'**
  String get areYouSure;

  /// No description provided for @warningDistributor.
  ///
  /// In en, this message translates to:
  /// **'Do you want to change distributor? You have to enter distributor code!'**
  String get warningDistributor;

  /// No description provided for @passcodeMessage.
  ///
  /// In en, this message translates to:
  /// **'Passcode created successfully'**
  String get passcodeMessage;

  /// No description provided for @createPasscode.
  ///
  /// In en, this message translates to:
  /// **'Create Passcode'**
  String get createPasscode;

  /// No description provided for @confirmPasscode.
  ///
  /// In en, this message translates to:
  /// **'Confirm Passcode'**
  String get confirmPasscode;

  /// No description provided for @enterPasscode.
  ///
  /// In en, this message translates to:
  /// **'Enter Passcode'**
  String get enterPasscode;

  /// No description provided for @deviceLocked.
  ///
  /// In en, this message translates to:
  /// **'KIAS is locked'**
  String get deviceLocked;

  /// No description provided for @deviceLockedDec.
  ///
  /// In en, this message translates to:
  /// **'For your security, you can only use KIAS when it\'s unlocked'**
  String get deviceLockedDec;

  /// No description provided for @unlock.
  ///
  /// In en, this message translates to:
  /// **'Unlock'**
  String get unlock;

  /// No description provided for @forgetPasscode.
  ///
  /// In en, this message translates to:
  /// **'Forgot Passcode?'**
  String get forgetPasscode;

  /// No description provided for @resetPasscode.
  ///
  /// In en, this message translates to:
  /// **'Reset Passcode'**
  String get resetPasscode;

  /// No description provided for @resetPasscodeDec.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to reset the passcode? You need to logout and login again.'**
  String get resetPasscodeDec;

  /// No description provided for @welcomeTo.
  ///
  /// In en, this message translates to:
  /// **'Welcome to '**
  String get welcomeTo;

  /// No description provided for @useDeviceLock.
  ///
  /// In en, this message translates to:
  /// **'Device lock'**
  String get useDeviceLock;

  /// No description provided for @usePasscode.
  ///
  /// In en, this message translates to:
  /// **'Passcode'**
  String get usePasscode;

  /// No description provided for @changeSecurityDec.
  ///
  /// In en, this message translates to:
  /// **'You can use device lock or custom passcode to unlock KIAS'**
  String get changeSecurityDec;

  /// No description provided for @usingDeviceLock.
  ///
  /// In en, this message translates to:
  /// **'Using device lock'**
  String get usingDeviceLock;

  /// No description provided for @usingCustomLock.
  ///
  /// In en, this message translates to:
  /// **'Using custom passcode'**
  String get usingCustomLock;

  /// No description provided for @allocationNo.
  ///
  /// In en, this message translates to:
  /// **'Allocation No'**
  String get allocationNo;

  /// No description provided for @employee.
  ///
  /// In en, this message translates to:
  /// **'Employee'**
  String get employee;

  /// No description provided for @srRcv.
  ///
  /// In en, this message translates to:
  /// **'SR Rcv'**
  String get srRcv;

  /// No description provided for @action.
  ///
  /// In en, this message translates to:
  /// **'Action'**
  String get action;

  /// No description provided for @change.
  ///
  /// In en, this message translates to:
  /// **'CHANGE'**
  String get change;

  /// No description provided for @cd.
  ///
  /// In en, this message translates to:
  /// **'CD'**
  String get cd;

  /// No description provided for @officeAdj.
  ///
  /// In en, this message translates to:
  /// **'Office Adjustment'**
  String get officeAdj;

  /// No description provided for @otherAdj.
  ///
  /// In en, this message translates to:
  /// **'Other Adjustment'**
  String get otherAdj;

  /// No description provided for @debitToEmp.
  ///
  /// In en, this message translates to:
  /// **'Debit to emp'**
  String get debitToEmp;

  /// No description provided for @debitNote.
  ///
  /// In en, this message translates to:
  /// **'Debit note'**
  String get debitNote;

  /// No description provided for @selectDivision.
  ///
  /// In en, this message translates to:
  /// **'Select division'**
  String get selectDivision;

  /// No description provided for @selectSalesman.
  ///
  /// In en, this message translates to:
  /// **'Select salesman'**
  String get selectSalesman;

  /// No description provided for @salesmanCode.
  ///
  /// In en, this message translates to:
  /// **'Salesman code'**
  String get salesmanCode;

  /// No description provided for @company.
  ///
  /// In en, this message translates to:
  /// **'Company'**
  String get company;

  /// No description provided for @accept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get accept;

  /// No description provided for @reject.
  ///
  /// In en, this message translates to:
  /// **'Reject'**
  String get reject;

  /// No description provided for @selectAll.
  ///
  /// In en, this message translates to:
  /// **'Select all'**
  String get selectAll;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// No description provided for @salary.
  ///
  /// In en, this message translates to:
  /// **'Salary'**
  String get salary;

  /// No description provided for @salaried.
  ///
  /// In en, this message translates to:
  /// **'Salaried'**
  String get salaried;

  /// No description provided for @initiator.
  ///
  /// In en, this message translates to:
  /// **'Initiator'**
  String get initiator;

  /// No description provided for @crDr.
  ///
  /// In en, this message translates to:
  /// **'CR/DR'**
  String get crDr;

  /// No description provided for @parking.
  ///
  /// In en, this message translates to:
  /// **'Parking'**
  String get parking;

  /// No description provided for @challan.
  ///
  /// In en, this message translates to:
  /// **'Challan'**
  String get challan;

  /// No description provided for @cng.
  ///
  /// In en, this message translates to:
  /// **'CNG'**
  String get cng;

  /// No description provided for @totalExpense.
  ///
  /// In en, this message translates to:
  /// **'Total expense'**
  String get totalExpense;

  /// No description provided for @cdAmt.
  ///
  /// In en, this message translates to:
  /// **'CD amount'**
  String get cdAmt;

  /// No description provided for @cdDate.
  ///
  /// In en, this message translates to:
  /// **'CD date'**
  String get cdDate;

  /// No description provided for @adjAmt.
  ///
  /// In en, this message translates to:
  /// **'Adj amount'**
  String get adjAmt;

  /// No description provided for @adjDate.
  ///
  /// In en, this message translates to:
  /// **'Adj date'**
  String get adjDate;

  /// No description provided for @addVehicle.
  ///
  /// In en, this message translates to:
  /// **'Add vehicle'**
  String get addVehicle;

  /// No description provided for @referenceID.
  ///
  /// In en, this message translates to:
  /// **'Reference ID'**
  String get referenceID;

  /// No description provided for @vehicleNo.
  ///
  /// In en, this message translates to:
  /// **'Vehicle no'**
  String get vehicleNo;

  /// No description provided for @transporterName.
  ///
  /// In en, this message translates to:
  /// **'Transporter name'**
  String get transporterName;

  /// No description provided for @vehicleType.
  ///
  /// In en, this message translates to:
  /// **'Vehicle type'**
  String get vehicleType;

  /// No description provided for @addBills.
  ///
  /// In en, this message translates to:
  /// **'Add bills'**
  String get addBills;

  /// No description provided for @docs.
  ///
  /// In en, this message translates to:
  /// **'Docs'**
  String get docs;

  /// No description provided for @freight.
  ///
  /// In en, this message translates to:
  /// **'Freight'**
  String get freight;

  /// No description provided for @finalize.
  ///
  /// In en, this message translates to:
  /// **'Finalize'**
  String get finalize;

  /// No description provided for @addDocuments.
  ///
  /// In en, this message translates to:
  /// **'Add documents'**
  String get addDocuments;

  /// No description provided for @vehiclePicture.
  ///
  /// In en, this message translates to:
  /// **'Vehicle picture'**
  String get vehiclePicture;

  /// No description provided for @driverPicture.
  ///
  /// In en, this message translates to:
  /// **'Driver picture'**
  String get driverPicture;

  /// No description provided for @rcPicture.
  ///
  /// In en, this message translates to:
  /// **'RC picture'**
  String get rcPicture;

  /// No description provided for @dlPicture.
  ///
  /// In en, this message translates to:
  /// **'DL picture'**
  String get dlPicture;

  /// No description provided for @billPicture.
  ///
  /// In en, this message translates to:
  /// **'Bill picture'**
  String get billPicture;

  /// No description provided for @eWayBill.
  ///
  /// In en, this message translates to:
  /// **'E way bill'**
  String get eWayBill;

  /// No description provided for @documentMessage.
  ///
  /// In en, this message translates to:
  /// **'indicating documents are mandatory to upload'**
  String get documentMessage;

  /// No description provided for @viewDocuments.
  ///
  /// In en, this message translates to:
  /// **'View documents'**
  String get viewDocuments;

  /// No description provided for @labourCharges.
  ///
  /// In en, this message translates to:
  /// **'Labour charges'**
  String get labourCharges;

  /// No description provided for @freightCharges.
  ///
  /// In en, this message translates to:
  /// **'Freight charges'**
  String get freightCharges;

  /// No description provided for @vehicleNumber.
  ///
  /// In en, this message translates to:
  /// **'Vehicle number'**
  String get vehicleNumber;

  /// No description provided for @remark.
  ///
  /// In en, this message translates to:
  /// **'Remark'**
  String get remark;

  /// No description provided for @billList.
  ///
  /// In en, this message translates to:
  /// **'Bill list'**
  String get billList;

  /// No description provided for @retailerName.
  ///
  /// In en, this message translates to:
  /// **'Retailer name'**
  String get retailerName;

  /// No description provided for @createNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Create new password'**
  String get createNewPassword;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get tryAgain;

  /// No description provided for @amt.
  ///
  /// In en, this message translates to:
  /// **'Amt'**
  String get amt;

  /// No description provided for @enterAmount.
  ///
  /// In en, this message translates to:
  /// **'Enter amount'**
  String get enterAmount;

  /// No description provided for @adjustment.
  ///
  /// In en, this message translates to:
  /// **'Adjustment'**
  String get adjustment;
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
