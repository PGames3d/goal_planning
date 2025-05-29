import 'package:kias/core/presentation/widgets/basic/kia_rich_text.dart';
import 'package:kias/core/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../basic/kia_text.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:flutter_typeahead/src/common/base/types.dart';

class KiaAutocompleteDropdown<T> extends StatefulWidget {
  final SuggestionsCallback<T> suggestionCallBack;
  final SuggestionsCallback<T> searchedSuggestionCallBack;
  final SuggestionsItemBuilder<T> itemBuilder;
  final String? hint;
  final String? label;
  final int? maxOptionsShow;
  final bool isRequired;
  final bool labelBoldText;
  final bool clearIcon;
  final bool isEnabled;
  final bool isNumber;
  final int maxLengthAllowed;

  /// If we need clear icon on the field to clear all textfield data
  final VoidCallback? clearIconAction;

  final double? optionsMaxHeight;
  final double? topMargin;
  final double? bottomMargin;
  final Icon? optionsIcon;
  final Widget? suffixIcon;
  final bool? normalTextField;
  final TextEditingController? customTextEditingController;
  final Function(T selected) onSelected;
  final Function(String selected)? onTypedValue;
  final VerticalDirection direction;

  const KiaAutocompleteDropdown(
      {super.key,
      required this.suggestionCallBack,
      required this.searchedSuggestionCallBack,
      required this.itemBuilder,
      this.isNumber = false,
      this.labelBoldText = false,
      this.maxLengthAllowed = AppConstants.textFieldCharLimit,
      this.clearIcon = false,
      this.isEnabled = true,
      this.clearIconAction,
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
      this.direction = VerticalDirection.down});

  @override
  State<KiaAutocompleteDropdown<T>> createState() =>
      _KiaAutocompleteDropdownState<T>();
}

class _KiaAutocompleteDropdownState<T>
    extends State<KiaAutocompleteDropdown<T>> {
  late SuggestionsController<T> _suggestionController;
  final ValueNotifier<bool> _showAllSuggestionsNotifier = ValueNotifier(false);
  final ValueNotifier<bool> _clickSuffixNotifier = ValueNotifier(false);
  bool _showAllSuggestions = false;

  @override
  void initState() {
    _suggestionController = SuggestionsController();
    _suggestionController.addListener(() {
      if (_suggestionController.focusState.hasFocus) {
        if (_clickSuffixNotifier.value && !_showAllSuggestionsNotifier.value) {
          _suggestionController.refresh();
          _clickSuffixNotifier.value = false;
          _showAllSuggestionsNotifier.value = true;
        }
        if (!_suggestionController.isOpen) {
          _suggestionController.refresh();
          if (_clickSuffixNotifier.value) {
            _clickSuffixNotifier.value = false;
            _showAllSuggestionsNotifier.value = true;
          }
        }
      }
    });
    super.initState();
  }

  void _onSuffixIconPressed() {
    setState(() {
      _showAllSuggestions = true;
    });
    _suggestionController.refresh();
    widget.customTextEditingController?.clear();
    _suggestionController.open();
  }

  @override
  void dispose() {
    _suggestionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        KiaRichText(
          text: [
            TextSpan(
              text: widget.label ?? '',
              style: widget.labelBoldText
                  ? Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(fontWeight: FontWeight.w400)
                  : Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.w700),
            ),
            if (widget.isRequired)
              TextSpan(
                text: ' *',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700, color: ColorName.redColor),
              ),
          ],
          maxLines: 3,
        ),
        SizedBox(
          height: 48,
          child: ClipRRect(
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(4)),
            child: Column(
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  child: ValueListenableBuilder<bool>(
                    valueListenable: _showAllSuggestionsNotifier,
                    builder: (context, showAllSuggestions, child) {
                      return TypeAheadField<T>(
                        suggestionsController: _suggestionController,
                        constraints: const BoxConstraints(maxHeight: 250),
                        direction: widget.direction,
                        suggestionsCallback: (pattern) async {
                          if (_showAllSuggestions && pattern.isEmpty) {
                            _showAllSuggestionsNotifier.value = false;
                            setState(() {
                              _showAllSuggestions = false;
                            });
                            var suggestions =
                                await widget.suggestionCallBack("");
                            return suggestions ?? [];
                          } else {
                            var suggestions = await widget
                                .searchedSuggestionCallBack(pattern);
                            return suggestions ?? [];
                          }
                        },
                        hideKeyboardOnDrag: true,
                        hideOnEmpty: true,
                        controller: widget.customTextEditingController,
                        errorBuilder: (context, error) =>
                            const KiaText('Error!'),
                        emptyBuilder: (context) =>
                            widget.normalTextField == true
                                ? const KiaText('No items found!')
                                : const SizedBox(),
                        builder: (context, controller, focusNode) {
                          return TextField(
                            // autofocus: true,
                            inputFormatters: [
                              if (widget.isNumber) ...[
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
                              LengthLimitingTextInputFormatter(
                                  widget.maxLengthAllowed),
                            ],
                            enabled: widget.isEnabled,
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
                              suffixIcon: widget.suffixIcon ??
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      widget.clearIcon
                                          ? GestureDetector(
                                              onTap: () {
                                                widget.clearIconAction?.call();
                                                _suggestionController.refresh();
                                                _suggestionController.close();
                                                focusNode.unfocus();
                                              },
                                              child: const Icon(Icons.clear),
                                            )
                                          : const SizedBox(),
                                      InkWell(
                                        onTap: () {
                                          _onSuffixIconPressed();
                                        },
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        splashColor: Colors.transparent,

                                        child: Container(
                                          padding: const EdgeInsets.all(8.0),
                                          // child: SvgPicture.asset(
                                          //     Assets.images.suffixAutocomplete,height: 20,width: 20,),
                                        ),
                                      ),
                                    ],
                                  ),
                              hintText: widget.hint,
                              hintStyle: const TextStyle(
                                  color: ColorName.greyButtonColor,
                                  fontWeight: FontWeight.w400),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(4)),
                                borderSide: BorderSide(
                                  color: ColorName.greyButtonColor,
                                  width: 0.5,
                                ),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(4)),
                                borderSide: BorderSide(
                                  color: ColorName.greyButtonColor,
                                  width: 0.5,
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(4)),
                                borderSide: BorderSide(
                                  color: ColorName.greyButtonColor,
                                  width: 0.5,
                                ),
                              ),
                            ),
                          );
                        },
                        itemBuilder: widget.itemBuilder,
                        onSelected: (T selected) {
                          widget.onSelected(selected);
                          // Close the suggestions dropdown after selection
                          _suggestionController.close();
                          _showAllSuggestionsNotifier.value = false;
                        },
                      );
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