import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../gen/colors.gen.dart';
import '../../../utils/constants/app_constants.dart';
import '../../../utils/constants/enums.dart';

/// For password field use this components [UhsPasswordTextField]
class GoalSearchButton extends FormField<String> {
  GoalSearchButton(
      {super.key,
      this.controller,
      String? initialValue,
      InputDecoration? decoration = const InputDecoration(),
      this.hintOrLabelText = '',
      required this.height,
      required this.width,
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
      this.textAlignment})
      : super(
            enabled: isEnabled,
            initialValue:
                controller != null ? controller.text : (initialValue ?? ''),
            builder: (FormFieldState<String> field) {
              final _TextFormFieldState state = field as _TextFormFieldState;
              final InputDecoration effectiveDecoration = (decoration ??
                      const InputDecoration())
                  .applyDefaults(Theme.of(field.context).inputDecorationTheme);
              void onChangedHandler(String value) {
                field.didChange(value);
                if (onChanged != null) {
                  onChanged(value);
                }
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: height,
                    width: width,
                    child: TextField(
                        textAlign: textAlignment ?? TextAlign.left,
                        focusNode: focusNode,
                        inputFormatters: [
                          if (isNumber) ...[
                            FilteringTextInputFormatter.deny(' '),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          LengthLimitingTextInputFormatter(maxLengthAllowed),
                        ],
                        controller: state._effectiveController,
                        onSubmitted: onSubmitted,
                        decoration: effectiveDecoration.copyWith(
                          labelText:
                              hintOrLabelType == HintOrLabelType.floatingLabel
                                  ? hintOrLabelText
                                  : null,
                          hintText: hintOrLabelType == HintOrLabelType.hint
                              ? hintOrLabelText
                              : null,
                          suffixIcon: suffixIcon,
                          prefixIcon: prefixIcon ??
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                // child: SvgPicture.asset(Assets.images.search),
                              ),
                          fillColor: ColorName.whiteColor,
                          focusedBorder: state.hasError
                              ? Theme.of(field.context)
                                  .inputDecorationTheme
                                  .focusedErrorBorder
                              : OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                      color: ColorName.greyButtonColor,
                                      width: 0.6)),
                          border: state.hasError
                              ? Theme.of(field.context)
                                  .inputDecorationTheme
                                  .errorBorder
                              : OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                      color: ColorName.greyButtonColor,
                                      width: 0.6)),
                          enabledBorder: state.hasError
                              ? Theme.of(field.context)
                                  .inputDecorationTheme
                                  .errorBorder
                              : OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                      color: ColorName.greyButtonColor,
                                      width: 0.6)),
                        ),
                        keyboardType:
                            isNumber ? TextInputType.number : keyboardType,
                        textInputAction: textInputAction,
                        readOnly: isReadOnly,
                        onChanged: onChangedHandler,
                        onTap: onTap,
                        enabled: isEnabled),
                  ),
                ],
              );
            });

  final HintOrLabelType hintOrLabelType;
  final String hintOrLabelText;
  final double height;
  final double width;
  final bool isEnabled;
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

  /// Accepts only numbers
  ///
  /// [keyboardType] is ignored when this is set true
  final bool isNumber;

  @override
  FormFieldState<String> createState() => _TextFormFieldState();
}

class _TextFormFieldState extends FormFieldState<String> {
  RestorableTextEditingController? _controller;

  TextEditingController get _effectiveController =>
      _textFormField.controller ?? _controller!.value;

  GoalSearchButton get _textFormField => super.widget as GoalSearchButton;

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
  void didUpdateWidget(GoalSearchButton oldWidget) {
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
