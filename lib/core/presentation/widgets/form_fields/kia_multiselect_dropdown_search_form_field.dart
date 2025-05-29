import 'package:dropdown_search/dropdown_search.dart';
import 'package:kias/core/utils/constants/constants.dart';
import 'package:kias/gen/assets.gen.dart';
import 'package:kias/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../basic/animated_visibility.dart';
import '../basic/kia_text.dart';

class KiaMultiSelectDropDownSearchFormField<T> extends StatelessWidget {
  const KiaMultiSelectDropDownSearchFormField(
      {super.key,
      required this.onChanged,
      required this.items,
      this.compareFn,
      this.filterFn,
      this.itemAsString,
      this.popupProps =
          const PopupPropsMultiSelection.menu(showSearchBox: true),
      this.enabled = true,
      this.validator,
      this.value,
      this.dropdownBuilder,
      this.hintOrLabelText = '',
      this.onlySearchBoxClickable = false,
      this.onlySearchBoxClickableAction,
      this.hintOrLabelType = AppConstants.hintOrLabelType});

  final List<T> items;

  final String hintOrLabelText;

  final HintOrLabelType hintOrLabelType;

  final ValueChanged<List<T>?> onChanged;

  final FormFieldValidator<List<T>>? validator;

  final List<T>? value;

  ///custom props to single mode popup
  final PopupPropsMultiSelection<T> popupProps;

  ///customize the fields the be shown
  final DropdownSearchItemAsString<T>? itemAsString;

  ///	custom filter function
  final DropdownSearchFilterFn<T>? filterFn;

  ///enable/disable dropdownSearch
  final bool enabled;

  ///function that compares two object with the same type to detected if it's the selected item or not
  final DropdownSearchCompareFn<T>? compareFn;

  final DropdownSearchBuilder<List<T>>? dropdownBuilder;

  /// used below two variables in new work location functionality
  final bool onlySearchBoxClickable;
  final VoidCallback? onlySearchBoxClickableAction;

  @override
  Widget build(BuildContext context) {
    return FormField<List<T>>(
      enabled: enabled,
      validator: validator,
      initialValue: value,
      builder: (FormFieldState<List<T>> state) {
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
                              .textTheme
                              .titleSmall
                              ?.copyWith(fontWeight: FontWeight.w700)),

                      // KiaText(hintOrLabelText, style: Theme.of(state.context).inputDecorationTheme.labelStyle),
                      const SizedBox(width: UIHelpers.defaultPadding),
                      _getErrorWidget(state)
                    ],
                  ),
                  const SizedBox(height: UIHelpers.defaultPadding),
                ],
              ),
            if (!onlySearchBoxClickable) ...[
              SizedBox(
                height: 48,
                child: Column(
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: DropdownSearch<T>.multiSelection(
                        items: items,
                        compareFn: compareFn,
                        itemAsString: itemAsString,
                        filterFn: filterFn,
                        onChanged: (List<T>? value) {
                          state.didChange(value);
                          onChanged(value);
                        },
                        popupProps: popupProps,
                        selectedItems: value ?? [],
                        dropdownBuilder: dropdownBuilder,
                        dropdownButtonProps: const DropdownButtonProps(
                          icon: SizedBox.shrink(),
                        ),
                        clearButtonProps: const ClearButtonProps(
                          icon: SizedBox.shrink(),
                        ),
                        dropdownDecoratorProps: DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 4),
                          filled: false,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            // child: SvgPicture.asset(Assets.images.search),
                          ),
                          hintText: hintOrLabelType == HintOrLabelType.hint
                              ? hintOrLabelText
                              : null,
                          labelText:
                              hintOrLabelType == HintOrLabelType.floatingLabel
                                  ? hintOrLabelText
                                  : null,
                          hintStyle:
                              Theme.of(context).inputDecorationTheme.hintStyle,
                          border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(4)),
                            borderSide: BorderSide(
                              color: ColorName.greyButtonColor,
                              // Change border color
                              width: 0.5, // Change border width
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(4)),
                            borderSide: BorderSide(
                              color: ColorName.greyButtonColor,
                              // Change border color
                              width: 0.5, // Change border width
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(4)),
                            borderSide: BorderSide(
                              color: ColorName.greyButtonColor,
                              // Change border color
                              width: 0.5, // Change border width
                            ),
                          ),
                        ).applyDefaults(
                                Theme.of(context).inputDecorationTheme)),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0x604E4E4E),
                      ),
                      height: 2,
                    )
                  ],
                ),
              ),
            ],
            if (onlySearchBoxClickable) ...[
              InkWell(
                onTap: onlySearchBoxClickableAction,
                child: IgnorePointer(
                  child: SizedBox(
                    height: 48,
                    child: Column(
                      children: [
                        Flexible(
                          fit: FlexFit.loose,
                          child: DropdownSearch<T>.multiSelection(
                            items: items,
                            compareFn: compareFn,
                            itemAsString: itemAsString,
                            filterFn: filterFn,
                            onChanged: (List<T>? value) {
                              state.didChange(value);
                              onChanged(value);
                            },
                            popupProps: popupProps,
                            selectedItems: value ?? [],
                            dropdownBuilder: dropdownBuilder,
                            dropdownButtonProps: const DropdownButtonProps(
                              icon: SizedBox.shrink(),
                            ),
                            clearButtonProps: const ClearButtonProps(
                              icon: SizedBox.shrink(),
                            ),
                            dropdownDecoratorProps: DropDownDecoratorProps(
                                dropdownSearchDecoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              filled: false,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                // child: SvgPicture.asset(Assets.images.search),
                              ),
                              hintText: hintOrLabelType == HintOrLabelType.hint
                                  ? hintOrLabelText
                                  : null,
                              labelText: hintOrLabelType ==
                                      HintOrLabelType.floatingLabel
                                  ? hintOrLabelText
                                  : null,
                              hintStyle: Theme.of(context)
                                  .inputDecorationTheme
                                  .hintStyle,
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(4)),
                                borderSide: BorderSide(
                                  color: ColorName.greyButtonColor,
                                  // Change border color
                                  width: 0.5, // Change border width
                                ),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(4)),
                                borderSide: BorderSide(
                                  color: ColorName.greyButtonColor,
                                  // Change border color
                                  width: 0.5, // Change border width
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(4)),
                                borderSide: BorderSide(
                                  color: ColorName.greyButtonColor,
                                  // Change border color
                                  width: 0.5, // Change border width
                                ),
                              ),
                            ).applyDefaults(
                                    Theme.of(context).inputDecorationTheme)),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0x604E4E4E),
                          ),
                          height: 2,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
            if (hintOrLabelType != HintOrLabelType.fixedLabel)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: UIHelpers.defaultPadding),
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
                style: Theme.of(state.context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Theme.of(state.context).colorScheme.error),
              ),
          ],
        ));
  }
}
