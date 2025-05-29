import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../gen/colors.gen.dart';
import '../basic/goal_text.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> items;
  final String label;
  final double topMargin;
  final double bottomMargin;
  const CustomDropdown(
      {super.key,
      required this.items,
      required this.label,
      required this.topMargin,
      required this.bottomMargin});

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? selectedItem; // Allow null for initial value

  @override
  void initState() {
    super.initState();
    selectedItem = widget.items.isNotEmpty ? widget.items[0] : null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GoalText(
          widget.label,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(
              top: widget.topMargin, bottom: widget.bottomMargin),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            border: Border.all(color: ColorName.greyColor),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedItem,
              onChanged: (String? newValue) {
                setState(() {
                  selectedItem = newValue;
                });
              },
              items: widget.items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: GoalText(
                    item,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

class FilterDropdown extends StatefulWidget {
  final List<String> items;
  final bool? isDateDateFilter;
  final double topMargin;
  final double bottomMargin;
  const FilterDropdown(
      {super.key,
      required this.items,
      required this.topMargin,
      required this.bottomMargin,
      this.isDateDateFilter});

  @override
  _FilterDropdownState createState() => _FilterDropdownState();
}

class _FilterDropdownState extends State<FilterDropdown> {
  String? selectedItem;
  DateTime _selectedDate = DateTime.now();
  @override
  void initState() {
    super.initState();
    selectedItem = widget.items.isNotEmpty ? widget.items[0] : null;
  }

  @override
  Widget build(BuildContext context) {
    return (widget.isDateDateFilter ?? false)
        ? dateFilter()
        : Container(
            width: double.infinity,
            height: 35,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              border: Border.all(color: ColorName.greyColor),
              borderRadius: BorderRadius.circular(8),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedItem,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedItem = newValue;
                  });
                },
                items: widget.items.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: GoalText(
                      item,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  );
                }).toList(),
              ),
            ),
          );
  }

  dateFilter() {
    return Container(
        width: double.infinity,
        height: 35,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: ColorName.greyColor),
          borderRadius: BorderRadius.circular(8),
        ),
        child: GestureDetector(
          onTap: () async {
            DateTime? selectedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime(2101),
            );
            if (selectedDate != null && selectedDate != _selectedDate) {
              // Update the selected date and rebuild the components
              setState(() {
                _selectedDate = selectedDate;
              });
            }
          },
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            GoalText(
              DateFormat('dd-MM-yyyy').format(_selectedDate.toLocal()),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Icon(Icons.arrow_drop_down_outlined),
          ]),
        ));
  }
}

// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';
//
// class RetailDropDown extends StatefulWidget {
//   const RetailDropDown({super.key});
//
//   @override
//   State<RetailDropDown> createState() => _RetailDropDownState();
// }
//
// class _RetailDropDownState extends State<RetailDropDown> {
//   final List<String> items = [
//     'Item1',
//     'Item2',
//     'Item3',
//     'Item4',
//   ];
//   String? selectedValue;
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//         child: DropdownButtonHideUnderline(
//           child: DropdownButton2<String>(
//             isExpanded: true,
//             hint: Text(
//               'Select Item',
//               style: TextStyle(
//                 fontSize: 14,
//                 color: Theme.of(context).hintColor,
//               ),
//             ),
//             items: items
//                 .map((String item) => DropdownMenuItem<String>(
//               value: item,
//               child: Text(
//                 item,
//                 style: const TextStyle(
//                   fontSize: 14,
//                 ),
//               ),
//             ))
//                 .toList(),
//             value: selectedValue,
//             onChanged: (String? value) {
//               setState(() {
//                 selectedValue = value;
//               });
//             },
//             buttonStyleData: const ButtonStyleData(
//               padding: EdgeInsets.symmetric(horizontal: 16),
//               height: 40,
//               width: double.infinity,
//             ),
//             menuItemStyleData: const MenuItemStyleData(
//               height: 50,
//             ),
//           ),
//         ),
//       );
//   }
// }
