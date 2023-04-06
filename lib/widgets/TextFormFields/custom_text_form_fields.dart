import 'package:flutter/material.dart';

class CustomTextFormFields extends StatelessWidget {
  const CustomTextFormFields({
    Key? key,
    required this.ctrl,
    required this.icon,
    required this.titleLabel,
  }) : super(key: key);
  final TextEditingController ctrl;
  final IconData icon;
  final String titleLabel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(
        0,
        0,
        0,
        15,
      ),
      child: TextFormField(
        controller: ctrl,
        obscureText: false,
        decoration: InputDecoration(
          labelText: titleLabel,
          enabledBorder: UnderlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0x00000000),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0x00000000),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0x00000000),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0x00000000),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          filled: true,
          fillColor: const Color(0x1AFFFFFF),
          prefixIcon: Icon(
            icon,
            size: 20,
          ),
        ),
      ),
    );
  }
}
