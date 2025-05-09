import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../config/styles/input_decorator.dart';

class CDropDownButton extends StatelessWidget {
  const CDropDownButton({
    super.key,
    this.value,
    required this.items,
    this.onChange,
    required this.label,
    this.icon,
    this.validator,
  });
  final String label;
  final IconData? icon;
  final String? value;
  final List<String> items;
  final void Function(String?)? onChange;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,

      //  provider.selectedGender,
      decoration: InputDecorationX.decorator(
        label: label,
        icon: HugeIcons.strokeRoundedFemale02,
      ),
      items:
          items.map((String gender) {
            return DropdownMenuItem<String>(value: gender, child: Text(gender));
          }).toList(),
      onChanged: onChange,

      validator: validator,
      dropdownColor: Colors.white, // Match the filled background
      style: TextStyle(
        color: Colors.black, // Text color for selected item
        fontSize: 16,
      ),
      borderRadius: BorderRadius.circular(10),
      icon: HugeIcon(
        icon: HugeIcons.strokeRoundedArrowDown01,
        color: Color(0xff8E6E53), // Match prefix icon color
      ),
    );
  }
}
