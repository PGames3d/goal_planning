import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/constants/app_constants.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/ui_helpers.dart';
import '../basic/animated_visibility.dart';
import '../basic/kia_text.dart';

class KiaPasswordTextField extends StatefulWidget {
  const KiaPasswordTextField(
      {super.key,
      this.validator,
      this.hintOrLabelType = AppConstants.hintOrLabelType,
      this.hintOrLabelText = '',
      this.initialValue,
      this.keyboardType,
      this.textInputAction,
      this.controller,
      this.onSubmitted,
      this.maxLengthAllowed = AppConstants.textFieldCharLimit,
      this.decoration = const InputDecoration(),
      this.inputFormatters});

  final HintOrLabelType hintOrLabelType;
  final String hintOrLabelText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final ValueChanged<String>? onSubmitted;
  final FormFieldValidator<String>? validator;
  final String? initialValue;
  final InputDecoration? decoration;
  final int maxLengthAllowed;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<KiaPasswordTextField> createState() =>
      _KiaPasswordTextFieldState();
}

class _KiaPasswordTextFieldState extends State<KiaPasswordTextField> {
  late bool _showPassword;
  final textFieldFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _showPassword = false;
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
        validator: widget.validator,
        initialValue: widget.controller != null
            ? widget.controller?.text
            : (widget.initialValue ?? ''),
        builder: (FormFieldState<String> state) {
          final InputDecoration effectiveDecoration =
              (widget.decoration ?? const InputDecoration())
                  .applyDefaults(Theme.of(state.context).inputDecorationTheme);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (widget.hintOrLabelType == HintOrLabelType.fixedLabel)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        KiaText(widget.hintOrLabelText,
                            style: Theme.of(state.context)
                                .inputDecorationTheme
                                .labelStyle),
                        const SizedBox(width: UIHelpers.defaultSpacing),
                        _getErrorWidget(state)
                      ],
                    ),
                    const SizedBox(
                      height: UIHelpers.defaultSpacing,
                    ),
                  ],
                ),
              TextField(
                inputFormatters: widget.inputFormatters ??
                    [
                      LengthLimitingTextInputFormatter(widget.maxLengthAllowed),
                    ],
                onChanged: (String? value) {
                  state.didChange(value);
                },
                controller: widget.controller,
                obscureText: !_showPassword,
                onSubmitted: widget.onSubmitted,
                focusNode: textFieldFocusNode,
                decoration: effectiveDecoration.copyWith(
                    labelText:
                        widget.hintOrLabelType == HintOrLabelType.floatingLabel
                            ? widget.hintOrLabelText
                            : null,
                    hintText: widget.hintOrLabelType == HintOrLabelType.hint
                        ? widget.hintOrLabelText
                        : null,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                        textFieldFocusNode.unfocus();
                        textFieldFocusNode.canRequestFocus = false;
                        Future.delayed(const Duration(milliseconds: 100), () {
                          textFieldFocusNode.canRequestFocus = true;
                        });
                      },
                      icon: Icon(_showPassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined),
                    ),
                    focusedBorder: state.hasError
                        ? Theme.of(state.context)
                            .inputDecorationTheme
                            .focusedErrorBorder
                        : Theme.of(state.context)
                            .inputDecorationTheme
                            .focusedBorder,
                    border: state.hasError
                        ? Theme.of(state.context)
                            .inputDecorationTheme
                            .errorBorder
                        : Theme.of(state.context).inputDecorationTheme.border,
                    enabledBorder: state.hasError
                        ? Theme.of(state.context)
                            .inputDecorationTheme
                            .errorBorder
                        : Theme.of(state.context)
                            .inputDecorationTheme
                            .enabledBorder),
                keyboardType: widget.keyboardType,
                textInputAction: widget.textInputAction,
              ),
              if (widget.hintOrLabelType != HintOrLabelType.fixedLabel)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: UIHelpers.defaultSpacing,
                    ),
                    _getErrorWidget(state),
                  ],
                )
            ],
          );
        });
  }

  Widget _getErrorWidget(FormFieldState<String> state) {
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
                  style: Theme.of(state.context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(state.context).colorScheme.error),
                ),
              ),
          ],
        ));
  }
}
