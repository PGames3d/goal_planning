import 'package:kias/core/presentation/widgets/basic/kia_rich_text.dart';
import 'package:kias/core/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../basic/kia_text.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:flutter_typeahead/src/common/base/types.dart';

class KiaAutocomplete<T> extends StatelessWidget {
  final SuggestionsCallback<T> suggestionCallBack;
  final SuggestionsItemBuilder<T> itemBuilder;
  final String? hint;
  final String? label;
  final int? maxOptionsShow;
  final bool isRequired;
  final bool labelBoldText;
  final bool clearIcon;

  /// if we need clear icon on filed to clear all textfield data
  final VoidCallback? clearIconAction;

  /// if we need clear icon on filed to clear all textfield data
  final Function(bool hasFocus)? dropdownIconAction;

  /// if we need show dropdown
  final bool? dropdownToggle;
  final double? optionsMaxHeight;
  final double? topMargin;
  final double? bottomMargin;
  final Icon? optionsIcon;
  final Widget? suffixIcon;
  final bool? normalTextField;
  final bool isNumber;
  final int maxLengthAllowed;
  final TextEditingController? customTextEditingController;
  final Function(T selected) onSelected;
  final Function(String selected)? onTypedValue;
  final VerticalDirection direction;
  final bool hideDropDownIcon;

  const KiaAutocomplete(
      {super.key,
      required this.suggestionCallBack,
      required this.itemBuilder,
      this.isNumber = false,
      this.labelBoldText = false,
      this.dropdownToggle = false,
      this.hideDropDownIcon = false,
      this.clearIcon = false,
      this.clearIconAction,
      this.dropdownIconAction,
      this.isRequired = false,
      this.normalTextField = true,
      this.label,
      this.hint = "Keyword",
      required this.onSelected,
      this.onTypedValue,
      this.customTextEditingController,
      this.maxOptionsShow = 5,
      this.optionsIcon,
      this.optionsMaxHeight = 200,
      this.bottomMargin = 8,
      this.topMargin = 8,
      this.suffixIcon,
      this.maxLengthAllowed = AppConstants.textFieldCharLimit,
      this.direction = VerticalDirection.down});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        KiaRichText(text: [
          TextSpan(
              text: label ?? '',
              style: labelBoldText
                  ? Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(fontWeight: FontWeight.w400)
                  : Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.w700)),
          if (isRequired)
            TextSpan(
                text: ' *',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700, color: ColorName.redColor))
        ], maxLines: 3),
        SizedBox(
          height: 48,
          child: ClipRRect(
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(4)),
            child: Column(
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  child: TypeAheadField<T>(
                    constraints: const BoxConstraints(maxHeight: 250),
                    direction: direction,
                    suggestionsCallback: suggestionCallBack,
                    hideKeyboardOnDrag: true,
                    hideOnEmpty: true,
                    controller: customTextEditingController,
                    errorBuilder: (context, error) =>
                        const KiaText('Error!'),
                    emptyBuilder: (context) => normalTextField == true
                        ? const KiaText('No items found!')
                        : const SizedBox(),
                    loadingBuilder: (context) => Shimmer.fromColors(
                      baseColor: ColorName.greyColor,
                      highlightColor: ColorName.greyButtonColor,
                      child: TextField(
                        inputFormatters: [
                          if (isNumber) ...[
                            FilteringTextInputFormatter.deny(
                                RegExp(r'\s')), // Deny spaces
                            FilteringTextInputFormatter
                                .digitsOnly // Allow only digits
                          ] else ...[
                            FilteringTextInputFormatter.deny(
                                RegExp(r'\d')), // Deny digits
                            FilteringTextInputFormatter.allow(RegExp(
                                r'[a-zA-Z\s@]')), // Allow only alphabetic characters and spaces
                          ],
                          LengthLimitingTextInputFormatter(maxLengthAllowed),
                        ],
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 4),
                          filled: false,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            // child: SvgPicture.asset(Assets.images.search),
                          ),
                          suffixIcon: hideDropDownIcon
                              ? null
                              : Container(
                                  padding: const EdgeInsets.all(8.0),
                                  // child: SvgPicture.asset(
                                  //     Assets.images.suffixAutocomplete,width:20,height:20),
                                ),
                          border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(4)),
                            borderSide: BorderSide(
                              color: ColorName.greyButtonColor,
                              width: 0.5,
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(4)),
                            borderSide: BorderSide(
                              color: ColorName.greyButtonColor,
                              width: 0.5,
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(4)),
                            borderSide: BorderSide(
                              color: ColorName.greyButtonColor,
                              width: 0.5,
                            ),
                          ),
                          hintText: hint,
                          hintStyle: const TextStyle(
                              color: ColorName.greyButtonColor,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    builder: (context, controller, focusNode) {
                      return TextField(
                        controller: controller,
                        focusNode: focusNode,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 8),
                          filled: false,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            // child: SvgPicture.asset(Assets.images.search),
                          ),
                          suffixIcon: suffixIcon ??
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  clearIcon
                                      ? GestureDetector(
                                          onTap: () {
                                            clearIconAction?.call();
                                            focusNode.unfocus();
                                          },
                                          child: const Icon(Icons.clear))
                                      : const SizedBox(),
                                  InkWell(
                                    onTap: () {
                                      dropdownIconAction
                                          ?.call(focusNode.hasFocus);
                                      if (dropdownToggle ?? false) {
                                        focusNode.requestFocus();
                                      } else {
                                        focusNode.unfocus();
                                      }
                                    },
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    child: hideDropDownIcon
                                        ? Container()
                                        : Container(
                                            padding: const EdgeInsets.all(8.0),
                                            // child: SvgPicture.asset(Assets.images.suffixAutocomplete,height: 20,width: 20,),
                                          ),
                                  ),
                                ],
                              ),
                          hintText: hint,
                          hintStyle: const TextStyle(
                              color: ColorName.greyButtonColor,
                              fontWeight: FontWeight.w400),
                          border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(4)),
                            borderSide: BorderSide(
                              color: ColorName.greyButtonColor,
                              width: 0.5,
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(4)),
                            borderSide: BorderSide(
                              color: ColorName.greyButtonColor,
                              width: 0.5,
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(4)),
                            borderSide: BorderSide(
                              color: ColorName.greyButtonColor,
                              width: 0.5,
                            ),
                          ),
                        ),
                      );
                    },
                    itemBuilder: itemBuilder,
                    onSelected: (T selected) {
                      onSelected(selected);
                    },
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
      ],
    );
  }
}

