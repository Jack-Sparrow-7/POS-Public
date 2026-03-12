import 'package:flutter/material.dart';
import 'package:uicons/uicons.dart';

class AuthField extends StatefulWidget {
  const AuthField({
    super.key,
    required this.hintText,
    required this.icon,
    this.isPassword = false,
    required this.controller,
    required this.textInputType,
    required this.textInputAction,
    this.maxLength,
    this.validator,
  });

  final String hintText;
  final IconData icon;
  final bool isPassword;
  final TextEditingController controller;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final int? maxLength;
  final String? Function(String?)? validator;

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  final ValueNotifier<bool> obsecure = ValueNotifier(true);

  @override
  void dispose() {
    obsecure.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: obsecure,
      builder: (context, value, child) {
        return TextFormField(
          controller: widget.controller,
          obscureText: widget.isPassword && value,
          validator: widget.validator,
          keyboardType: widget.textInputType,
          textInputAction: widget.textInputAction,
          maxLength: widget.maxLength,
          decoration: InputDecoration(
            counterText: '',
            hintText: widget.hintText,
            prefixIcon: Icon(widget.icon, size: 18),
            suffixIcon: widget.isPassword
                ? IconButton(
                    style: IconButton.styleFrom(
                      splashFactory: NoSplash.splashFactory,
                      hoverColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      overlayColor: Colors.transparent,
                    ),
                    iconSize: 18,
                    icon: Icon(
                      value
                          ? UIcons.regularRounded.eye
                          : UIcons.regularRounded.eye_crossed,
                    ),
                    onPressed: () => obsecure.value = !value,
                  )
                : null,
          ),
        );
      },
    );
  }
}
