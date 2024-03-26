import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
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
  final Function onTap;

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
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: GoogleFonts.rubik(
            color: ColorsApp.grey,
            fontWeight: FontWeight.w400,
            fontSize: 16.0,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          decoration: const BoxDecoration(color: ColorsApp.blueButton),
          height: height,
          child: TextField(
            onTap: () => onTap(),
            enabled: isEnabled,
            style: GoogleFonts.rubik(
              fontSize: 16.0,
              height: 1.0,
              fontWeight: FontWeight.w300,
              color: Colors.black,
            ),
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
              hintStyle: GoogleFonts.rubik(
                color: ColorsApp.grey,
                fontWeight: FontWeight.w300,
                fontSize: 16.0,
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
