import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.label,
    required this.onTap,
    this.icon,
    this.isLoading = false,
  });

  final String label;
  final Function onTap;
  final IconData? icon;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 185,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: !isLoading
                ? Color.fromARGB(255, 59, 19, 150)
                : Color(0xff707173).withOpacity(0.5),
            border: Border.all(
              color: Colors.black,
              strokeAlign: 4,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: isLoading
              ? _createProgressIndicator()
              : icon != null
                  ? _createIconLabel()
                  : _createLabel(),
        ),
        onTap: () {
          if (!isLoading) {
            onTap();
          }
        },
      ),
    );
  }

  Widget _createProgressIndicator() {
    return const SizedBox(
      height: 39,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: CircularProgressIndicator(color: Color(0xffE3F2FD)),
      ),
    );
  }

  Widget _createIconLabel() {
    return Row(
      children: [
        Icon(
          icon,
          color: Color(0xffE3F2FD),
        ),
        const SizedBox(width: 5),
        Text(
          label,
          style: const TextStyle(fontSize: 26, color: Color(0xffE3F2FD)),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _createLabel() {
    return Text(
      label,
      style: TextStyle(
          fontSize: label.length < 8 ? 26 : 22, color: Color(0xffE3F2FD)),
      textAlign: TextAlign.center,
    );
  }
}
