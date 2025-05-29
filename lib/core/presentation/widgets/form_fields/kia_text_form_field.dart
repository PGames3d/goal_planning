
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../gen/colors.gen.dart';
import '../../../utils/constants/app_constants.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/ui_helpers.dart';
import '../basic/animated_visibility.dart';
import '../basic/kia_text.dart';

/// For password field use this components [UhsPasswordTextField]
class KiaTextFormField extends FormField<String> {
  KiaTextFormField({
    super.key,
    this.controller,
    String? initialValue,
    InputDecoration? decoration = const InputDecoration(),
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
    this.filledColor,
    int maxLengthAllowed = AppConstants.textFieldCharLimit,
    this.isNumber = false,
    FocusNode? focusNode,
    this.textAlignment,
    this.maxLines,
    this.clearIcon = false,
    this.isPassword = false,
    this.isErrorRequired = true,
    this.clearIconAction,
    this.height = 48,
    this.textStyle,
    this.hintStyle,

    List<TextInputFormatter>? formatters,
  }) : super(
            enabled: isEnabled,
            initialValue:
                controller != null ? controller.text : (initialValue ?? ''),
            builder: (FormFieldState<String> field) {
              final _TextFormFieldState state = field as _TextFormFieldState;
              (decoration ??
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
                  if (hintOrLabelType == HintOrLabelType.fixedLabel)
                    Column(
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
                  SizedBox(
                    height: height,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(4)),
                      child: Column(
                        children: [
                          Flexible(
                            fit: FlexFit.loose,
                            child: TextField(
                                textAlignVertical: TextAlignVertical.center,
                                maxLines: maxLines ?? 1,
                                textAlign: textAlignment ?? TextAlign.left,
                                focusNode: focusNode,
                                controller: state._effectiveController,
                                onSubmitted: onSubmitted,
                                style: textStyle,
                                decoration: InputDecoration(
                                  contentPadding:
                                  const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 8),
                                  hintText: hintOrLabelText,
                                  hintStyle: hintStyle ?? Theme.of(state.context).textTheme.bodyMedium?.copyWith(color: ColorName.greyColor),
                                  suffixIcon: !clearIcon
                                      ? isPassword ? IconButton(
                                    onPressed: () {
                                      state.toggleObscureText();
                                    },
                                    icon: Icon(state._obscureText
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined, color: ColorName.greyButtonColor,),
                                  ) : Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: suffixIcon,
                                  )
                                      : GestureDetector(
                                      onTap: clearIconAction,
                                      child: const Icon(Icons.clear)),
                                  prefixIcon: prefixIcon,
                                  filled: true,
                                  fillColor:Theme.of(state.context).brightness == Brightness.dark ? Theme.of(state.context).colorScheme.onSecondary : ColorName.textfieldBackground,
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
                                    BorderRadius.all(Radius.circular(8)),
                                    borderSide: BorderSide(
                                      color:
                                      ColorName.borderColor,
                                      // Change border color
                                      width:
                                      1, // Change border width
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
                                    BorderRadius.all(Radius.circular(8)),
                                    borderSide: BorderSide(
                                      color:
                                      ColorName.focusedBorderColor,
                                      // Change border color
                                      width:
                                      1, // Change border width
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
                                    BorderRadius.all(Radius.circular(8)),
                                    borderSide: BorderSide(
                                      color:
                                      ColorName.borderColor,
                                      // Change border color
                                      width:
                                      1, // Change border width
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
                        ],
                      ),
                    ),
                  ),
                  if (hintOrLabelType != HintOrLabelType.fixedLabel && isErrorRequired)
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

  final HintOrLabelType hintOrLabelType;
  final String hintOrLabelText;
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
  final Color? filledColor;
  final int? maxLines;

  final bool clearIcon;
  final bool isPassword;
  final bool isErrorRequired;
  final double height;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;

  /// if we need clear icon on filed to clear all text field data
  final VoidCallback? clearIconAction;


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

  KiaTextFormField get _textFormField => super.widget as KiaTextFormField;

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
  void didUpdateWidget(KiaTextFormField oldWidget) {
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

  bool _obscureText = true; // Initialize with true to obscure text by default

  // Toggle obscureText
  void toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
