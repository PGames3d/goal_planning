import 'package:flutter/material.dart';

import '../../../utils/constants/app_constants.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/ui_helpers.dart';
import '../basic/animated_visibility.dart';
import '../basic/kia_text.dart';

class KiaDropDownFormField<T> extends StatelessWidget {
  const KiaDropDownFormField({
    super.key,
    this.value,
    required this.items,
    this.hintOrLabelText = '',
    this.hintOrLabelType = AppConstants.hintOrLabelType,
    required this.onChanged,
    this.isEnabled = true,
    this.validator,
    this.decoration = const InputDecoration(),
    this.icon,
    this.spaceAlignment,
  });

  final Map<T, String> items;
  final String hintOrLabelText;
  final HintOrLabelType hintOrLabelType;
  final Function(T?) onChanged;
  final T? value;
  final bool isEnabled;
  final Widget? icon;
  final bool? spaceAlignment;
  final FormFieldValidator<T>? validator;
  final InputDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return FormField<T>(
      key: key,
      enabled: isEnabled,
      initialValue: value,
      validator: validator,
      builder: (FormFieldState<T> state) {
        final InputDecoration effectiveDecoration =
            (decoration ?? const InputDecoration())
                .applyDefaults(Theme.of(state.context).inputDecorationTheme);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (hintOrLabelType == HintOrLabelType.fixedLabel)
              Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      KiaText(hintOrLabelText,
                          style: Theme.of(state.context)
                              .inputDecorationTheme
                              .labelStyle),
                      const SizedBox(width: UIHelpers.defaultSpacing),
                      _getErrorWidget(state)
                    ],
                  ),
                  const SizedBox(
                    height: UIHelpers.defaultSpacing,
                  )
                ],
              ),
            InputDecorator(
              decoration: effectiveDecoration
                  .copyWith(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 15.0),
                      hintText: hintOrLabelType == HintOrLabelType.hint
                          ? hintOrLabelText
                          : null,
                      labelText:
                          hintOrLabelType == HintOrLabelType.floatingLabel
                              ? hintOrLabelText
                              : null,
                      hintStyle:
                          Theme.of(context).inputDecorationTheme.hintStyle,
                      focusedBorder: state.hasError
                          ? Theme.of(state.context)
                              .inputDecorationTheme
                              .errorBorder
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
                              .enabledBorder)
                  .applyDefaults(Theme.of(context).inputDecorationTheme),
              isEmpty: value == null || value == '',
              child: DropdownButtonHideUnderline(
                child: DropdownButton<T>(
                  isExpanded: true,
                  value: value,
                  isDense: true,
                  icon: icon ?? const Icon(Icons.expand_more, size: 30),
                  iconEnabledColor: Theme.of(context).primaryColor,
                  onChanged: isEnabled
                      ? (T? value) {
                          state.didChange(value);
                          onChanged(value);
                        }
                      : null,
                  items: items.keys
                      .map((T e) => DropdownMenuItem<T>(
                            value: e,
                            child: spaceAlignment ?? false
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(items[e]?.split('\$').first ?? '',
                                          overflow: TextOverflow.ellipsis),
                                      Text(items[e]?.split(' \$').last ?? '',
                                          overflow: TextOverflow.ellipsis),
                                    ],
                                  )
                                : Text(items[e] ?? "",
                                    overflow: TextOverflow.ellipsis),
                          ))
                      .toList(),
                ),
              ),
            ),
            if (hintOrLabelType != HintOrLabelType.fixedLabel)
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
      },
    );
  }

  Widget _getErrorWidget(FormFieldState state) {
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
              KiaText(
                state.errorText!,
                style: Theme.of(state.context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(state.context).colorScheme.error),
              ),
          ],
        ));
  }
}

