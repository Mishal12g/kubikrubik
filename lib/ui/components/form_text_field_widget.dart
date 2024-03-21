import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kubikrubik/resources/colors_app.dart';

class FormTextFieldWidget extends StatelessWidget {
  final String hintText;
  final String text;
  final Widget? widget;
  final double? height;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final TextInputFormatter? formatterText;

  const FormTextFieldWidget({
    super.key,
    required this.hintText,
    required this.text,
    this.widget,
    this.height,
    this.controller,
    this.textInputType,
    this.formatterText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            color: ColorsApp.grey,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          decoration: const BoxDecoration(color: ColorsApp.blueButton),
          height: height,
          child: TextField(
            keyboardType: textInputType,
            inputFormatters: formatterText != null
                ? [
                    FilteringTextInputFormatter.digitsOnly,
                    TextInputFormatter.withFunction((oldValue, newValue) {
                      if (oldValue.text.isEmpty) {
                        return oldValue;
                      } else {
                        return newValue;
                      }
                    }),
                  ]
                : [],
            controller: controller,
            maxLines: null,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                fontSize: 16,
                color: ColorsApp.grey,
              ),
              suffixIcon: widget,
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
