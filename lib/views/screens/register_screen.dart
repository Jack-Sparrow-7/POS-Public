import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:pos_public/blocs/auth/auth_bloc.dart';
import 'package:pos_public/core/theme/app_colors.dart';
import 'package:pos_public/core/theme/app_font_sizes.dart';
import 'package:pos_public/validators/register_validators.dart';
import 'package:pos_public/widgets/auth_field.dart';
import 'package:pos_public/widgets/auth_submit_button.dart';
import 'package:toastification/toastification.dart';
import 'package:uicons/uicons.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  AutovalidateMode _autovalidateMode = .disabled;

  @override
  void dispose() {
    nameController.dispose();
    mobileNumberController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            toastification.show(
              alignment: .topCenter,
              type: .error,
              style: .fillColored,
              showIcon: false,
              title: Text(state.message),
              autoCloseDuration: Duration(seconds: 3),
            );
          }
        },
        builder: (context, state) {
          final isLoading =
              state is AuthLoading && state.action == AuthLoadingAction.login;
          return Center(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 440),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Form(
                    key: _formKey,
                    autovalidateMode: _autovalidateMode,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Branding",
                          style: TextStyle(
                            fontFamily: 'Arizonia',
                            color: AppColors.primary,
                            fontSize: AppFontSizes.display,
                          ),
                        ),
                        const Gap(16),
                        Text(
                          "Create Account",
                          style: TextStyle(
                            fontSize: AppFontSizes.xl,
                            fontWeight: .bold,
                          ),
                        ),
                        const Gap(8),
                        Text(
                          "Join us and start ordering",
                          style: TextStyle(color: AppColors.mutedForeground),
                        ),
                        const Gap(40),
                        AuthField(
                          hintText: "Full Name",
                          icon: UIcons.regularRounded.user,
                          controller: nameController,
                          textInputAction: .next,
                          textInputType: .name,
                          validator: (value) =>
                              RegisterValidators.validateName(value),
                        ),
                        const Gap(16),
                        AuthField(
                          hintText: "Mobile number",
                          icon: UIcons.regularRounded.mobile,
                          controller: mobileNumberController,
                          textInputAction: .next,
                          textInputType: .number,
                          validator: (value) =>
                              RegisterValidators.validateMobileNumber(value),
                        ),
                        const Gap(16),
                        AuthField(
                          hintText: "Email",
                          icon: UIcons.regularRounded.envelope,
                          controller: emailController,
                          textInputAction: .next,
                          textInputType: .emailAddress,
                          validator: (value) =>
                              RegisterValidators.validateEmail(value),
                        ),
                        const Gap(16),
                        AuthField(
                          hintText: "Password",
                          icon: UIcons.regularRounded.lock,
                          isPassword: true,
                          controller: passwordController,
                          textInputAction: .done,
                          textInputType: .visiblePassword,
                          validator: (value) =>
                              RegisterValidators.validatePassword(value),
                        ),
                        const Gap(16),
                        AuthSubmitButton(
                          onPressed: isLoading
                              ? null
                              : () {
                                  final isValid =
                                      _formKey.currentState?.validate() ??
                                      false;

                                  if (!isValid) {
                                    setState(() {
                                      _autovalidateMode = .always;
                                    });

                                    return;
                                  }
                                  final name = nameController.text.trim();
                                  final mobileNumber = mobileNumberController
                                      .text
                                      .trim();
                                  final email = emailController.text.trim();
                                  final password = passwordController.text
                                      .trim();

                                  context.read<AuthBloc>().add(
                                    RegisterRequested(
                                      email: email,
                                      password: password,
                                      name: name,
                                      mobileNumber: mobileNumber,
                                    ),
                                  );
                                },
                          child: Row(
                            mainAxisAlignment: .center,
                            spacing: 8,
                            children: [
                              if (isLoading)
                                SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: CircularProgressIndicator(
                                    color: AppColors.primaryForeground,
                                    strokeWidth: 2,
                                  ),
                                ),
                              const Text(
                                "Create Account",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: .w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Gap(32),
                        Row(
                          spacing: 4,
                          mainAxisAlignment: .center,
                          children: [
                            Text("Already have an account?"),
                            InkWell(
                              onTap: () => context.go('/login'),
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: Text(
                                'Sign in',
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: .w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
