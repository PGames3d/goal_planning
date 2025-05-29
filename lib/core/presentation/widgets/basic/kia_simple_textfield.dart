import 'package:kias/core/presentation/widgets/basic/kia_rich_text.dart';
import 'package:kias/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/constants/app_constants.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/ui_helpers.dart';
import 'animated_visibility.dart';
import 'kia_text.dart';


/// For password field use this components [UhsPasswordTextField]
class KiaSimpleTextFormField extends FormField<String> {
  KiaSimpleTextFormField(
      {super.key,
      this.heightOfField,
      this.maxLines,
      this.clearIcon = false,
      this.clearIconAction,
      this.label,
      this.emailText = false,
      this.labelBoldText = false,
      this.workExperienceDeleteButton,

      /// we are using this to show delete icon with label by spacebetween
      this.controller,
      String? initialValue,
      InputDecoration? decoration,
      this.hintOrLabelText = '',
      this.hintOrLabelType = AppConstants.hintOrLabelType,
      this.isEnabled = true,
      this.isReadOnly = false,
      this.onSubmitted,
      super.validator,
      this.keyboardType,
      this.prefixIcon,
      this.suffixIcon,
      this.textInputAction,
      this.onChanged,
      this.onTap,
      int maxLengthAllowed = AppConstants.textFieldCharLimit,
      this.isNumber = false,
      FocusNode? focusNode,
      this.textAlignment,
      this.isRequired = false})
      : super(
            enabled: isEnabled,
            initialValue:
                controller != null ? controller.text : (initialValue ?? ''),
            builder: (FormFieldState<String> field) {
              final _TextFormFieldState state = field as _TextFormFieldState;
              // final InputDecoration effectiveDecoration = (decoration ??
              //         const InputDecoration())
              //     .applyDefaults(Theme.of(field.context).inputDecorationTheme);
              void onChangedHandler(String value) {
                field.didChange(value);
                if (onChanged != null) {
                  onChanged(value);
                }
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  if (hintOrLabelType == HintOrLabelType.fixedLabel)
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            KiaText(hintOrLabelText,
                                style: Theme.of(field.context)
                                    .inputDecorationTheme
                                    .labelStyle),
                            const SizedBox(width: UIHelpers.defaultSpacing),
                            _getErrorWidget(state)
                          ],
                        ),
                        const SizedBox(height: UIHelpers.defaultSpacing),
                      ],
                    ),
                  const SizedBox(height: UIHelpers.smallPadding),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          KiaRichText(text: [
                            TextSpan(
                              text: label ?? '',
                              style: labelBoldText
                                  ? Theme.of(field.context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(fontWeight: FontWeight.w400)
                                  : Theme.of(field.context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(fontWeight: FontWeight.w700),
                              // style: KiaResponsive.isMobile(field.context)
                              //     ? Theme.of(field.context)
                              //         .textTheme
                              //         .titleSmall
                              //         ?.copyWith(fontWeight: FontWeight.w700)
                              //     : Theme.of(field.context)
                              //         .textTheme
                              //         .titleMedium
                              //         ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                            if (isRequired)
                              TextSpan(
                                  text: ' *',
                                  style: Theme.of(state.context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: ColorName.redColor))
                          ], maxLines: 3),
                          workExperienceDeleteButton ?? const SizedBox()
                        ],
                      ),
                      // const SizedBox(height: UIHelpers.smallMargin),
                      SizedBox(
                        height: heightOfField ?? 48,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              bottom: Radius.circular(4)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                fit: FlexFit.loose,
                                child: TextField(
                                    textAlignVertical: TextAlignVertical.center,
                                    maxLines: maxLines ?? 1,
                                    textAlign: textAlignment ?? TextAlign.left,
                                    focusNode: focusNode,
                                    // inputFormatters: [
                                    //   if (isNumber) ...[
                                    //     FilteringTextInputFormatter.deny(
                                    //         RegExp(r'\s')), // Deny spaces
                                    //     FilteringTextInputFormatter
                                    //         .digitsOnly, // Allow only digits
                                    //   ] else ...[
                                    //     if (emailText) ...[
                                    //       FilteringTextInputFormatter.allow(RegExp(
                                    //           r'[a-zA-Z0-9@._\-\s/]')), // Allow specified characters
                                    //     ] else ...[
                                    //       FilteringTextInputFormatter.deny(
                                    //           RegExp(r'\d')), // Deny digits
                                    //       FilteringTextInputFormatter.allow(RegExp(
                                    //           r'[a-zA-Z\s]')), // Allow alphabetic characters and spaces
                                    //     ],
                                    //   ],
                                    //   LengthLimitingTextInputFormatter(
                                    //       maxLengthAllowed), // Apply length limit
                                    // ],

                                    // inputFormatters: [
                                    //   if (isNumber) ...[
                                    //     FilteringTextInputFormatter.deny(RegExp(r'\s')),
                                    //     FilteringTextInputFormatter.digitsOnly
                                    //   ]
                                    //   else ...[
                                    //
                                    //     if (emailText)
                                    //     FilteringTextInputFormatter.deny(RegExp(r'\d')),
                                    //     FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s@]')),
                                    //   ],
                                    //   LengthLimitingTextInputFormatter(maxLengthAllowed),
                                    //   // if (isNumber) ...[
                                    //   //   FilteringTextInputFormatter.deny(' '),
                                    //   //   FilteringTextInputFormatter.digitsOnly
                                    //   // ],
                                    //   // LengthLimitingTextInputFormatter(
                                    //   //     maxLengthAllowed),
                                    // ],
                                    controller: state._effectiveController,
                                    onSubmitted: onSubmitted,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 4, vertical: 8),
                                      hintText: hintOrLabelText,
                                      hintStyle: const TextStyle(
                                          color: ColorName.greyButtonColor,
                                          fontWeight: FontWeight.w400),
                                      suffixIcon: !clearIcon
                                          ? suffixIcon
                                          : GestureDetector(
                                              onTap: clearIconAction,
                                              child: const Icon(Icons.clear)),
                                      prefixIcon: prefixIcon,
                                      filled: true,
                                      fillColor: ColorName.whiteColor,
                                      enabledBorder: state.hasError
                                          ? UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Theme.of(state.context)
                                                    .colorScheme
                                                    .error, // Change border color
                                                width:
                                                    2.0, // Change border width
                                              ),
                                            )
                                          : const OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                      top: Radius.circular(4)),
                                              borderSide: BorderSide(
                                                color:
                                                    ColorName.greyButtonColor,
                                                // Change border color
                                                width:
                                                    0.5, // Change border width
                                              ),
                                            ),
                                      focusedBorder: state.hasError
                                          ? UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Theme.of(state.context)
                                                    .colorScheme
                                                    .error, // Change border color
                                                width:
                                                    2.0, // Change border width
                                              ),
                                            )
                                          : const OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                      top: Radius.circular(4)),
                                              borderSide: BorderSide(
                                                color:
                                                    ColorName.greyButtonColor,
                                                // Change border color
                                                width:
                                                    0.5, // Change border width
                                              ),
                                            ),
                                      border: state.hasError
                                          ? UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Theme.of(state.context)
                                                    .colorScheme
                                                    .error, // Change border color
                                                width:
                                                    2.0, // Change border width
                                              ),
                                            )
                                          : const OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                      top: Radius.circular(4)),
                                              borderSide: BorderSide(
                                                color:
                                                    ColorName.greyButtonColor,
                                                // Change border color
                                                width:
                                                    0.5, // Change border width
                                              ),
                                            ),
                                    ),
                                    keyboardType: isNumber
                                        ? TextInputType.number
                                        : keyboardType,
                                    textInputAction: textInputAction,
                                    readOnly: isReadOnly,
                                    onChanged: onChangedHandler,
                                    onTap: onTap,
                                    enabled: isEnabled),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  color: Color(0x604E4E4E),
                                ),
                                height: isReadOnly ? 0.5 : 2.0,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (hintOrLabelType != HintOrLabelType.fixedLabel)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: UIHelpers.defaultSpacing),
                        _getErrorWidget(state),
                      ],
                    )
                ],
              );
            });

  final Widget? workExperienceDeleteButton;
  final double? heightOfField;
  final HintOrLabelType hintOrLabelType;
  final bool isRequired;
  final bool labelBoldText;
  final String hintOrLabelText;
  final String? label;
  final int? maxLines;
  final bool isEnabled;
  final bool emailText;
  final bool isReadOnly;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextAlign? textAlignment;
  final TextInputAction? textInputAction;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final TextEditingController? controller;
  final ValueChanged<String>? onSubmitted;
  final bool clearIcon;

  /// if we need clear icon on filed to clear all textfield data
  final VoidCallback? clearIconAction;

  /// if we need clear icon on filed to clear all textfield data

  /// Accepts only numbers
  ///
  /// [keyboardType] is ignored when this is set true
  final bool isNumber;

  @override
  FormFieldState<String> createState() => _TextFormFieldState();
}

Widget _getErrorWidget(_TextFormFieldState state) {
  return AnimatedVisibility(
      visible: state.hasError,
      child: Row(
        children: <Widget>[
          Icon(
            Icons.error_outline_rounded,
            size: 12,
            color: Theme.of(state.context).colorScheme.error,
          ),
          const SizedBox(width: 8),
          if (state.hasError)
            Expanded(
              child: KiaText(
                state.errorText!,
                maxLines: 3,
                style: Theme.of(state.context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Theme.of(state.context).colorScheme.error),
              ),
            ),
        ],
      ));
}

class _TextFormFieldState extends FormFieldState<String> {
  RestorableTextEditingController? _controller;

  TextEditingController get _effectiveController =>
      _textFormField.controller ?? _controller!.value;

  KiaSimpleTextFormField get _textFormField =>
      super.widget as KiaSimpleTextFormField;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    super.restoreState(oldBucket, initialRestore);
    if (_controller != null) {
      _registerController();
    }
    // Make sure to update the internal [FormFieldState] value to sync up with
    // text editing controller value.
    setValue(_effectiveController.text);
  }

  void _registerController() {
    assert(_controller != null);
    registerForRestoration(_controller!, 'controller');
  }

  void _createLocalController([TextEditingValue? value]) {
    assert(_controller == null);
    _controller = value == null
        ? RestorableTextEditingController()
        : RestorableTextEditingController.fromValue(value);
    if (!restorePending) {
      _registerController();
    }
  }

  @override
  void initState() {
    super.initState();
    if (_textFormField.controller == null) {
      _createLocalController(widget.initialValue != null
          ? TextEditingValue(text: widget.initialValue!)
          : null);
    } else {
      _textFormField.controller!.addListener(_handleControllerChanged);
    }
  }

  @override
  void didUpdateWidget(KiaSimpleTextFormField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_textFormField.controller != oldWidget.controller) {
      oldWidget.controller?.removeListener(_handleControllerChanged);
      _textFormField.controller?.addListener(_handleControllerChanged);

      if (oldWidget.controller != null && _textFormField.controller == null) {
        _createLocalController(oldWidget.controller!.value);
      }

      if (_textFormField.controller != null) {
        setValue(_textFormField.controller!.text);
        if (oldWidget.controller == null) {
          unregisterFromRestoration(_controller!);
          _controller!.dispose();
          _controller = null;
        }
      }
    }
  }

  @override
  void dispose() {
    _textFormField.controller?.removeListener(_handleControllerChanged);
    _controller?.dispose();
    super.dispose();
  }

  @override
  void didChange(String? value) {
    super.didChange(value);

    if (_effectiveController.text != value) {
      _effectiveController.text = value ?? '';
    }
  }

  @override
  void reset() {
    // setState will be called in the superclass, so even though state is being
    // manipulated, no setState call is needed here.
    _effectiveController.text = widget.initialValue ?? '';
    super.reset();
  }

  void _handleControllerChanged() {
    // Suppress changes that originated from within this class.
    //
    // In the case where a controller has been passed in to this components, we
    // register this change listener. In these cases, we'll also receive change
    // notifications for changes originating from within this class -- for
    // example, the reset() method. In such cases, the FormField value will
    // already have been set.
    if (_effectiveController.text != value) {
      didChange(_effectiveController.text);
    }
  }
}
