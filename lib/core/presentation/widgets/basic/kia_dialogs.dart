import 'package:flutter/material.dart';
import 'package:kias/core/extensions/localization_extension.dart';
import 'package:overlayment/overlayment.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

import '../../../../gen/colors.gen.dart';
import '../../../utils/constants/app_strings.dart';
import '../../../utils/constants/ui_helpers.dart';
import '../../../utils/kia_responsive.dart';
import 'kia_button.dart';
import 'kia_outline_button.dart';
import 'kia_text.dart';

class KiaDialogs {
  KiaDialogs._();

  static void showError(BuildContext context, String description,
      {String title = AppStrings.error,
      String okButtonText = AppStrings.ok,
      VoidCallback? okButtonAction}) {
    Overlayment.show(
      OverDialog(
        backgroundSettings: const BackgroundSettings(dismissOnClick: false),
        width: KiaResponsive.isTabletLandscape(context) ||
                KiaResponsive.isDesktop(context)
            ? MediaQuery.of(context).size.width / 3
            : null,
        margin: const EdgeInsets.all(20),
        name: "Error Popup",
        child: PointerInterceptor(
          child: Padding(
            padding: const EdgeInsets.all(UIHelpers.defaultPadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    KiaText(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                        onTap: () {
                          Overlayment.dismissName("Error Popup");
                        },
                        child: const Icon(
                          Icons.close,
                          color: ColorName.dividerPurpleColor,
                        ))
                  ],
                ),
                const SizedBox(height: UIHelpers.defaultPadding),
                KiaText(
                  description,
                  style: Theme.of(context).textTheme.titleSmall,
                  maxLines: 15,
                ),
                const SizedBox(height: UIHelpers.defaultPadding),
                Center(
                  child: KiaButton(
                    color: ColorName.lightGreenButtonColor,
                    // horizontalPadding: 20,
                    buttonWidth: 133,
                    buttonHeight: 36, shapeSize: 4,
                    buttonText: okButtonText,
                    action: () {
                      if (okButtonAction != null) {
                        okButtonAction();
                      }
                      Overlayment.dismissName("Error Popup");
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  static void showProgressDialog() {
    Overlayment.show(
      OverDialog(
        backgroundSettings:
            const BackgroundSettings(dismissOnClick: false, blur: 0.8),
        width: 100,
        height: 100,
        margin: const EdgeInsets.all(20),
        name: "Progress Popup",
        child: const Padding(
          padding: EdgeInsets.all(UIHelpers.defaultPadding),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }

  static void closeDialog(String dialogName) {
    Overlayment.dismissName(dialogName);
  }

  static void showSuccessMessage(BuildContext context, String message) {
    Overlayment.show(OverNotification(
      width: MediaQuery.of(context).size.width - 50,
      name: 'success_notification',
      duration: const Duration(seconds: 5),
      child: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Row(
          children: <Widget>[
            const Icon(Icons.check_circle_outline_outlined,
                color: ColorName.successMessageBorderColor, size: 20),
            const SizedBox(width: UIHelpers.smallPadding),
            Expanded(
              child: KiaText(message,
                  maxLines: 3,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ColorName.successMessageColor,
                      )),
            ),
            const SizedBox(width: UIHelpers.smallPadding),
            IconButton(
              icon: const Icon(Icons.close,
                  size: 13, color: ColorName.successMessageCloseIconColor),
              onPressed: () => Overlayment.dismissName('success_notification'),
            )
          ],
        ),
      ),
      alignment: (KiaResponsive.isTabletLandscape(context) ||
              KiaResponsive.isDesktop(context))
          ? Alignment.topRight
          : Alignment.bottomCenter,
      decoration: BoxDecoration(
          color: ColorName.successMessageBackgroundColor,
          border: Border.all(color: ColorName.successMessageBorderColor),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                color: ColorName.successMessageBoxShadowColor.withOpacity(0.15),
                blurRadius: 16,
                offset: const Offset(0, 8))
          ]),
    ));
  }

  static void showFailureMessage(BuildContext context, String message) {
    Overlayment.show(OverNotification(
      width: MediaQuery.of(context).size.width / 2,
      name: 'error_message',
      duration: const Duration(seconds: 5),
      child: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Row(
          children: <Widget>[
            const Icon(Icons.dangerous_outlined,
                color: ColorName.errorMessageBorderColor, size: 20),
            const SizedBox(width: UIHelpers.smallPadding),
            Expanded(
              child: KiaText(message,
                  maxLines: 3,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ColorName.successMessageColor,
                      )),
            ),
            const SizedBox(width: 30),
            IconButton(
              icon: const Icon(Icons.close,
                  size: 13, color: ColorName.successMessageCloseIconColor),
              onPressed: () => Overlayment.dismissName('error_message'),
            )
          ],
        ),
      ),
      alignment: (KiaResponsive.isTabletLandscape(context) ||
              KiaResponsive.isDesktop(context))
          ? Alignment.topRight
          : Alignment.bottomCenter,
      decoration: BoxDecoration(
          color: ColorName.errorMessageBackgroundColor,
          border: Border.all(color: ColorName.errorMessageBorderColor),
          borderRadius: BorderRadius.circular(8),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: ColorName.successMessageBoxShadowColor.withOpacity(0.15),
                blurRadius: 16,
                offset: const Offset(0, 8))
          ]),
    ));
  }

  static void showWarningMessage(BuildContext context,
      {String? description,
      String? titleString,
      String? okButtonText,
      VoidCallback? okButtonAction}) {
    Overlayment.show(
      OverDialog(
        backgroundSettings: const BackgroundSettings(dismissOnClick: false),
        width: KiaResponsive.isTabletLandscape(context) ||
                KiaResponsive.isDesktop(context)
            ? MediaQuery.of(context).size.width / 3
            : null,
        margin: const EdgeInsets.all(40),
        decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.light
                ? ColorName.whiteColor
                : ColorName.primaryColorLight,
            borderRadius: BorderRadius.circular(20)),
        name: "warning Popup",
        child: Padding(
          padding: const EdgeInsets.all(UIHelpers.defaultPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.error_outline,
                size: 70,
                color: ColorName.redColor,
              ),
              const SizedBox(height: UIHelpers.smallPadding),
              KiaText(
                titleString ?? "",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
                maxLines: 4,
              ),
              const SizedBox(height: UIHelpers.smallPadding),
              KiaText(
                description ?? "",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleSmall,
                maxLines: 6,
              ),
              const SizedBox(height: UIHelpers.defaultPadding),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  KiaOutLineButton(
                    buttonText: context.loc.cancel,
                    action: () {
                      Overlayment.dismissName("warning Popup");
                    },
                  ),
                  KiaButton(
                    buttonText: okButtonText ?? context.loc.ok,
                    action: okButtonAction,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  static void showCustomWidgetDialog(BuildContext context,
      {required Widget dialogDesign}) {
    Overlayment.show(
      OverDialog(
        backgroundSettings: const BackgroundSettings(dismissOnClick: false),
        width: KiaResponsive.isTabletLandscape(context) ||
                KiaResponsive.isDesktop(context)
            ? MediaQuery.of(context).size.width / 3
            : null,
        margin: const EdgeInsets.all(40),
        decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.light
                ? ColorName.whiteColor
                : ColorName.primaryColorLight,
            borderRadius: BorderRadius.circular(20)),

        // name: "warning Popup",
        child: Padding(
            padding: const EdgeInsets.all(UIHelpers.defaultPadding),
            child: dialogDesign),
      ),
    );
  }

  static void showSavedDetailsMessage(BuildContext context,
      {VoidCallback? okAction, String? message}) {
    Overlayment.show(
      OverDialog(
        name: 'remove saved details',
        backgroundSettings: const BackgroundSettings(dismissOnClick: false),
        width: KiaResponsive.isTabletLandscape(context) ||
                KiaResponsive.isDesktop(context)
            ? MediaQuery.of(context).size.width / 3
            : null,
        margin: const EdgeInsets.all(40),
        decoration: BoxDecoration(
          color: ColorName.whiteColor,
          border: Border.all(color: ColorName.greyButtonColor, width: 0.2),
          borderRadius: BorderRadius.circular(8),
        ),
        // name: "warning Popup",
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: UIHelpers.defaultPadding,
              vertical: UIHelpers.defaultMargin),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              KiaText(message ?? context.loc.yourDetailsHaveBeenSaved,
                  textAlign: TextAlign.center,
                  maxLines: 4,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      )),
              const SizedBox(height: UIHelpers.smallMargin),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // KiaButton(
                  //   buttonWidth: 111,
                  //   buttonHeight: 36,
                  //   shapeSize: 4,
                  //   color: ColorName.greyButtonColor,
                  //   buttonText: context.loc.cancel,
                  //   action: (){
                  //     closeDialog("remove saved details");
                  //   },
                  // ),
                  // const SizedBox(width: UIHelpers.mediumMargin),
                  KiaButton(
                    buttonWidth: 111,
                    buttonHeight: 36,
                    shapeSize: 4,
                    buttonText: context.loc.ok,
                    action: () {
                      if (okAction != null) {
                        okAction();
                      }
                      Overlayment.dismissName("remove saved details");
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }



  /// work interest page dialog for showing error message
  static void showDeleteMessageForAdmin(BuildContext context,
      {VoidCallback? confirmAction, String? schoolName}) {
    Overlayment.show(
      OverDialog(
        name: "remove delete message",
        backgroundSettings: const BackgroundSettings(dismissOnClick: false),
        width: MediaQuery.of(context).size.width / 3.3,
        decoration: BoxDecoration(
          color: ColorName.whiteColor,
          border: Border.all(color: ColorName.greyButtonColor, width: 0.2),
          borderRadius: BorderRadius.circular(8),
        ),
        // name: "warning Popup",
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              KiaText(AppStrings.delete,
                  textAlign: TextAlign.center,
                  maxLines: 4,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      )),
              const SizedBox(height: UIHelpers.smallMargin),
              RichText(
                textAlign: TextAlign.center,
                maxLines: 4,
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                  children: <TextSpan>[
                    const TextSpan(
                      text: 'Are you sure you want to delete ',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    TextSpan(
                      text: schoolName ?? "",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(
                      text: ' from the list?',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: UIHelpers.mediumMargin),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  KiaButton(
                    buttonWidth: 111,
                    buttonHeight: 36,
                    shapeSize: 4,
                    color: ColorName.greyButtonColor,
                    buttonText: AppStrings.cancel,
                    action: () {
                      closeDialog("remove delete message");
                    },
                  ),
                  const SizedBox(width: UIHelpers.mediumMargin),
                  KiaButton(
                    buttonWidth: 111,
                    buttonHeight: 36,
                    shapeSize: 4,
                    buttonText: AppStrings.confirm,
                    action: confirmAction,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
