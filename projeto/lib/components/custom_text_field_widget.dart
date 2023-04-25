import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    super.key,
    required this.title,
    this.hintText,
    this.iconData,
    this.maxLength,
    this.maxLines = 1,
    this.isPassword = false,
    this.isSpaceAllowed = false,
    this.isSpecialAllowed = true,
    this.isNonNumericAllowed = true,
    this.isDarkMode = true,
  });

  final String title;
  final String? hintText;
  final IconData? iconData;
  final int? maxLength;
  final int maxLines;
  final bool isPassword;
  final bool isSpaceAllowed;
  final bool isSpecialAllowed;
  final bool isNonNumericAllowed;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    String regexExpression = _generateRegexExpression();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 24,
              color: isDarkMode ? const Color(0xffE3F2FD) : Colors.black,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 7),
              ),
            ],
          ),
          child: TextFormField(
            minLines: 1,
            maxLines: maxLines,
            decoration: InputDecoration(
              counterStyle: TextStyle(
                color: isDarkMode ? const Color(0xffE3F2FD) : Colors.black,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              filled: true,
              fillColor: const Color(0xffE3F2FD),
              contentPadding: const EdgeInsets.all(25),
              hintText: hintText,
              prefixIcon: iconData != null ? Icon(iconData) : null,
            ),
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp(regexExpression)),
              LengthLimitingTextInputFormatter(maxLength)
            ],
            obscureText: isPassword,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }

  String _generateRegexExpression() {
    String regexExpression = r'^\s|';

    if (!isSpaceAllowed) {
      regexExpression += r'\s|';
    } else {
      regexExpression += r'\s{2}|';
    }
    if (!isSpecialAllowed) {
      regexExpression += r'[^a-zA-Z\s]|';
    }
    if (!isNonNumericAllowed) {
      regexExpression += r'\D|';
    }
    return regexExpression;
  }
}
