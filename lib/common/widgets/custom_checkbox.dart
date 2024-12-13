import 'package:flutter/material.dart';
import 'package:amoora/core/app_color.dart';
import 'package:amoora/utils/ui_helper.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
    required this.value,
    required this.onChanged,
    this.caption,
  });

  final bool value;
  final Widget? caption;
  final Function(bool val)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
          width: 20,
          child: Checkbox(
            value: value,
            activeColor: Colors.transparent,
            onChanged: (value) {
              onChanged!(value!);
            },
          ),
        ), // Container(
        //   height: 20,
        //   width: 20,
        //   decoration: BoxDecoration(
        //     color: Colors.transparent,
        //     border: const Border.fromBorderSide(
        //       BorderSide(
        //         color: secondaryLight,
        //         width: 1.5,
        //       ),
        //     ),
        //     borderRadius: BorderRadius.circular(3),
        //   ),
        //   child: Checkbox(
        //     value: value,
        //     activeColor: Colors.transparent,
        //     onChanged: (value) {
        //       onChanged!(value!);
        //     },
        //     side: const BorderSide(
        //       color: Colors.transparent,
        //     ),
        //     checkColor: secondaryLight,
        //   ),
        // ),
        10.width,
        Expanded(
          child: InkWell(
            onTap: () => onChanged!(!value),
            child: Align(
              alignment: Alignment.centerLeft,
              child: caption,
            ),
          ),
        ),
      ],
    );
  }
}
