import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:pos_public/core/theme/app_colors.dart';
import 'package:uicons/uicons.dart';

class AuthField extends StatefulWidget {
  const AuthField({
    super.key,
    required this.labelText,
    required this.labelIcon,
    required this.hintText,
    this.isPassword = false,
    this.textInputType = TextInputType.name,
    this.textInputAction = TextInputAction.next,
    this.maxLength,
    this.validator,
    this.autovalidateMode,
    this.inputFormatters,
    required this.controller,
    this.showForgotPassword = false,
    this.focusNode,
    this.nextFocusNode,
  });

  final String labelText;
  final IconData labelIcon;
  final String hintText;
  final bool isPassword;
  final TextEditingController controller;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final int? maxLength;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final List<TextInputFormatter>? inputFormatters;
  final bool showForgotPassword;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  final obsecureText = ValueNotifier<bool>(true);

  @override
  void dispose() {
    obsecureText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // SvgPicture.asset(widget.labelIcon),
                Icon(color: AppColors.textMedium, widget.labelIcon, size: 20),
                const SizedBox(width: 8),
                Text(
                  widget.labelText,
                  style: const TextStyle(
                    color: AppColors.textMedium,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            if (widget.showForgotPassword)
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  splashFactory: NoSplash.splashFactory,
                  overlayColor: AppColors.transparent,
                ),
                onPressed: () => context.go('/forgotPassword'),
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.accent,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
          ],
        ),
        const Gap(8),
        ValueListenableBuilder(
          valueListenable: obsecureText,
          builder: (context, value, child) {
            return TextFormField(
              focusNode: widget.focusNode,
              controller: widget.controller,
              validator: widget.validator,
              autovalidateMode: widget.autovalidateMode,
              inputFormatters: widget.inputFormatters,
              style: const TextStyle(color: AppColors.textDark, fontSize: 14),
              maxLength: widget.maxLength,
              textInputAction: widget.textInputAction,
              keyboardType: widget.textInputType,
              onEditingComplete: () {
                if (widget.textInputAction == TextInputAction.next) {
                  if (widget.nextFocusNode != null) {
                    widget.nextFocusNode!.requestFocus();
                    return;
                  }
                  FocusScope.of(context).nextFocus();
                  return;
                }
                FocusScope.of(context).unfocus();
              },
              obscureText: widget.isPassword ? value : false,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                counterText: '',
                border: _border(),
                errorBorder: _border(),
                enabledBorder: _border(),
                focusedBorder: _border(color: AppColors.primary),
                focusedErrorBorder: _border(),
                hintText: widget.hintText,
                hintStyle: const TextStyle(
                  color: AppColors.textLight,
                  fontSize: 14,
                ),
                suffixIcon: widget.isPassword
                    ? IconButton(
                        style: IconButton.styleFrom(
                          hoverColor: AppColors.transparent,
                          highlightColor: AppColors.transparent,
                          splashFactory: NoSplash.splashFactory,
                        ),
                        onPressed: () =>
                            obsecureText.value = !obsecureText.value,
                        icon: Icon(
                          color: AppColors.textLight,
                          value
                              ? UIcons.regularRounded.eye
                              : UIcons.regularRounded.eye_crossed,
                        ),
                      )
                    : null,
              ),
            );
          },
        ),
      ],
    );
  }

  OutlineInputBorder _border({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color ?? AppColors.border),
    );
  }
}
