import 'package:flutter/material.dart';
import 'package:flutter_graduation_app/style/app_color.dart';
import 'package:flutter_graduation_app/style/app_text_styles.dart';
import 'package:flutter_graduation_app/widgets/custom_button.dart';
import 'package:flutter_graduation_app/widgets/lex_auth_footer.dart';
import 'package:flutter_graduation_app/widgets/lex_divider.dart';
import 'package:flutter_graduation_app/widgets/lex_logo.dart';
import 'package:flutter_graduation_app/widgets/custom_input_field.dart';
import 'package:easy_localization/easy_localization.dart';

class LexLoginForm extends StatefulWidget {
  final VoidCallback? onSignUp;
  final VoidCallback? onForgotPassword;
  final void Function(String email, String password)? onLogin;

  const LexLoginForm({
    super.key,
    this.onSignUp,
    this.onForgotPassword,
    this.onLogin,
  });

  @override
  State<LexLoginForm> createState() => _LexLoginFormState();
}

class _LexLoginFormState extends State<LexLoginForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool showPassword = false;

  void handleLogin() {
    widget.onLogin?.call(
      emailController.text.trim(),
      passwordController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const LexLogo(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          const SizedBox(height: 40),

          // const Text(
          //   "Welcome back 👋",
          //   style: TextStyle(
          //     fontSize: 26,
          //     fontWeight: FontWeight.w700,
          //     color: Colors.black87,
          //   ),
          //   textAlign: TextAlign.center,
          // ),
          // const SizedBox(height: 8),

           Text(
            'sign_in_title'.tr(),
            style: AppTextStyles.subtitle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 36),

          CustomInputField(
            controller: emailController,
            icon: Icons.mail_outline,
            hint: "email_or_phone".tr(),
          ),
          const SizedBox(height: 20),

          CustomInputField(
            controller: passwordController,
            icon: Icons.lock_outline,
            hint: "password".tr(),
            isPassword: true,
            showPassword: showPassword,
            onToggleVisibility: () =>
                setState(() => showPassword = !showPassword),
          ),

          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: widget.onForgotPassword,
              child:  Text(
                "forgot_password".tr(),
                style: TextStyle(color: AppColors.link, fontWeight: FontWeight.w600),
              ),
            ),
          ),

          const SizedBox(height: 8),

          CustomButton(text: "sign_in".tr(), onPressed: handleLogin),

          const SizedBox(height: 30),
          const LexDivider(),
          const SizedBox(height: 30),

          LexAuthFooter(
            question: "dont_have_account".tr(),
            actionText: "sign_up".tr(),
            onTap: widget.onSignUp,
          ),
        ],
      ),
    );
  }
}
