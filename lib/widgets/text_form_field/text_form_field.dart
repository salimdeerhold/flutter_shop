import 'package:flutter/material.dart';

import '../../const/const.dart';

final OutlineInputBorder enabledOutLineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8),
  borderSide: const BorderSide(color: AppColor.kBlack),
);

final OutlineInputBorder focousedOutLineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8),
  borderSide: const BorderSide(color: AppColor.kPrimary),
);

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {Key? key, required this.label, this.suffixIcon, this.validator})
      : super(key: key);
  final String label;
  final IconData? suffixIcon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14.0),
      child: TextFormField(
        cursorColor: AppColor.kPrimary,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
          label: Text(
            label,
            style: const TextStyle(color: AppColor.kBlack),
          ),
          suffixIcon: suffixIcon != null
              ? Icon(
                  suffixIcon,
                  color: AppColor.kPrimary,
                )
              : null,
          focusedBorder: focousedOutLineInputBorder,
          enabledBorder: enabledOutLineInputBorder,
          border: focousedOutLineInputBorder,
          disabledBorder: enabledOutLineInputBorder,
        ),
        validator: validator,
      ),
    );
  }
}
