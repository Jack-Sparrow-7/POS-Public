import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos_public/core/extensions/context_extensions.dart';
import 'package:pos_public/core/theme/app_colors.dart';
import 'package:pos_public/presentation/bloc/auth/auth_bloc.dart';
import 'package:pos_public/presentation/bloc/auth/auth_event.dart';
import 'package:pos_public/presentation/bloc/auth/auth_state.dart';
import 'package:pos_public/presentation/validators/register_validators.dart';
import 'package:pos_public/presentation/widgets/auth_field.dart';
import 'package:pos_public/presentation/widgets/auth_form_card.dart';
import 'package:pos_public/presentation/widgets/auth_submit_button.dart';
import 'package:uicons/uicons.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _mobileCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _mobileCtrl.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.neutral,
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailure) {
              context.showErrorSnackBar(
                state.message ?? 'Something went wrong.',
              );
            }
            if (state is AuthAuthenticated) {
              context.go('/home');
            }
          },
          builder: (context, state) {
            final isLoading = state is AuthLoading;
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 512),
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(
                      context,
                    ).copyWith(scrollbars: false),
                    child: SingleChildScrollView(
                      clipBehavior: Clip.none,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 8,
                      ),
                      child: Column(
                        children: [
                          const Gap(48),
                          Text(
                            'Branding',
                            style: GoogleFonts.arizonia(
                              color: AppColors.primary,
                              fontSize: 40,
                            ),
                          ),
                          const Gap(16),
                          const Text(
                            'Create Your Account',
                            style: TextStyle(
                              color: AppColors.textDark,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Gap(8),
                          const Text(
                            'Create your account to order quickly\nand track your purchases.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.textMedium,
                              fontSize: 16,
                            ),
                          ),
                          const Gap(32),
                          AuthFormCard(
                            child: Form(
                              key: _formKey,
                              autovalidateMode: _autovalidateMode,
                              child: Column(
                                children: [
                                  AuthField(
                                    labelText: 'Full Name',
                                    labelIcon: UIcons.regularRounded.user,
                                    hintText: 'Jack Sparrow',
                                    controller: _nameCtrl,
                                    validator: RegisterValidators.validateName,
                                  ),
                                  const Gap(24),
                                  AuthField(
                                    labelText: 'Mobile Number',
                                    labelIcon: UIcons.regularRounded.mobile,
                                    hintText: '7449261057',
                                    textInputType: TextInputType.number,
                                    maxLength: 10,
                                    controller: _mobileCtrl,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    validator:
                                        RegisterValidators.validateMobileNumber,
                                  ),
                                  const Gap(24),
                                  AuthField(
                                    labelText: 'Email Address',
                                    labelIcon: UIcons.regularRounded.envelope,
                                    hintText: 'jacksparrow@example.com',
                                    textInputType: TextInputType.emailAddress,
                                    controller: _emailCtrl,
                                    validator: RegisterValidators.validateEmail,
                                  ),
                                  const Gap(24),
                                  AuthField(
                                    labelText: 'Password',
                                    labelIcon: UIcons.regularRounded.lock,
                                    hintText: '*********',
                                    isPassword: true,
                                    textInputAction: TextInputAction.done,
                                    controller: _passwordCtrl,
                                    validator:
                                        RegisterValidators.validatePassword,
                                  ),
                                  const Gap(24),
                                  Container(
                                    padding: const EdgeInsets.fromLTRB(
                                      12,
                                      12,
                                      48,
                                      12,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.neutral,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Row(
                                      children: [
                                        Icon(
                                          Icons.check_circle_outline,
                                          color: AppColors.accent,
                                        ),
                                        SizedBox(width: 8),
                                        Expanded(
                                          child: Text(
                                            'Password must be at least 6 characters with a mix of letters and numbers.',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: AppColors.textMedium,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Gap(44),
                                  AuthSubmitButton(
                                    onPressed: isLoading
                                        ? null
                                        : () {
                                            final isValid =
                                                _formKey.currentState
                                                    ?.validate() ??
                                                false;
                                            if (!isValid) {
                                              setState(() {
                                                _autovalidateMode =
                                                    AutovalidateMode.always;
                                              });
                                              return;
                                            }
                                            context.read<AuthBloc>().add(
                                              AuthRegisterRequested(
                                                name: _nameCtrl.text.trim(),
                                                mobileNumber: _mobileCtrl.text
                                                    .trim(),
                                                email: _emailCtrl.text.trim(),
                                                password: _passwordCtrl.text,
                                              ),
                                            );
                                          },
                                    child: Builder(
                                      builder: (context) {
                                        final textColor =
                                            DefaultTextStyle.of(
                                              context,
                                            ).style.color ??
                                            AppColors.surface;
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            if (isLoading)
                                              SizedBox(
                                                width: 16,
                                                height: 16,
                                                child:
                                                    CircularProgressIndicator(
                                                      color: textColor,
                                                      strokeWidth: 2,
                                                    ),
                                              ),
                                            const SizedBox(width: 8),
                                            const Text(
                                              'Create Account',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                  const Gap(24),
                                  const Text(
                                    'By clicking "Create Account", you agree to our Terms of Service and Privacy Policy.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.textMedium,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Gap(32),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Already have an account?',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.textDark,
                                ),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  splashFactory: NoSplash.splashFactory,
                                  overlayColor: AppColors.transparent,
                                ),
                                onPressed: isLoading
                                    ? null
                                    : () => context.go('/login'),
                                child: const Text(
                                  'Sign in',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.accent,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Gap(48),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
