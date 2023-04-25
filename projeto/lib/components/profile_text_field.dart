import 'package:flutter/material.dart';

class ProfileTextFieldWiget extends StatefulWidget {
  const ProfileTextFieldWiget({
    super.key,
    required this.labelText,
    required this.placeholder,
    this.isPassword = false,
  });

  final String labelText;
  final String placeholder;
  final bool isPassword;

  @override
  State<ProfileTextFieldWiget> createState() => _ProfileTextFieldWigetState();
}

class _ProfileTextFieldWigetState extends State<ProfileTextFieldWiget> {
  bool enabled = false;
  late bool isPassword;

  @override
  void initState() {
    isPassword = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(widget.labelText, style: const TextStyle(fontSize: 18)),
          const SizedBox(width: 15),
          Expanded(
            child: TextField(
              enabled: enabled,
              obscureText: isPassword,
              decoration: InputDecoration(
                  border:
                      enabled ? const UnderlineInputBorder() : InputBorder.none,
                  suffixIcon: widget.isPassword
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              isPassword = !isPassword;
                            });
                          },
                          icon: Icon(
                            isPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: enabled ? Colors.black : Color(0xff707173),
                          ),
                        )
                      : null,
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  hintText: widget.placeholder,
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    color: Color(0xff707173),
                  )),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              setState(() {
                enabled = !enabled;
              });
            },
          )
        ],
      ),
    );
  }
}
