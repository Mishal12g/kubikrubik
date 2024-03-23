import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kubikrubik/resources/colors_app.dart';

class FormTextFieldWidget extends StatelessWidget {
  final bool? isEnabled;
  final String hintText;
  final String text;
  final Widget? widget;
  final double? height;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final TextInputFormatter? formatterText;
  final bool? readOnly;

  const FormTextFieldWidget({
    super.key,
    required this.hintText,
    required this.text,
    this.widget,
    this.height,
    this.controller,
    this.textInputType,
    this.formatterText,
    this.readOnly,
    this.isEnabled,
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
            enabled: isEnabled,
            style: const TextStyle(
                fontSize: 16.0, height: 1.0, color: Colors.black),
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
            readOnly: readOnly ?? false,
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
