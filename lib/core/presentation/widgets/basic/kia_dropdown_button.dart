import 'package:kias/gen/colors.gen.dart';
import 'package:flutter/material.dart';

class KiaDropdownButton extends StatelessWidget {
  final List<String> options;
  final String selectedOption;
  final ValueChanged onChanged;
  double? horizontal;
  double? vertical;
  double? width;
  double? height;
  Color? backgroundColor;

  KiaDropdownButton({
    super.key,
    this.horizontal,
    this.vertical,
    this.height,
    this.backgroundColor,
    this.width,
    required this.options,
    required this.selectedOption,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: DropdownButtonFormField<String>(
        value: selectedOption,
        onChanged: onChanged,
        icon: const Icon(
          Icons.expand_more_outlined,
          color: ColorName.dividerPurpleColor,
        ),
        decoration: InputDecoration(
          // suffixIcon: Padding(
          //   padding: const EdgeInsets.all(4.0),
          //   child: SvgPicture.asset(Assets.images.suffixAutocomplete),
          // ),
          fillColor: backgroundColor ?? ColorName.whiteColor,
          contentPadding: EdgeInsets.symmetric(
              horizontal: horizontal ?? 16, vertical: vertical ?? 12),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                  color: ColorName.greyButtonColor, width: 0.5)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                  color: ColorName.greyButtonColor, width: 0.6)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                  color: ColorName.greyButtonColor, width: 0.6)),
        ),
        items: options.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(fontWeight: FontWeight.w400),
            ),
          );
        }).toList(),
      ),
    );
  }
}
