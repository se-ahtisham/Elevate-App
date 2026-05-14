import 'package:elevate_app/Animation/slide_left_route.dart';
import 'package:elevate_app/Custom_Widgets/Buttons/text_button_gradient.dart';
import 'package:elevate_app/Custom_Widgets/Buttons/texxt_button.dart';
import 'package:elevate_app/Custom_Widgets/Drop_Down_Menu/custom_drop_down.dart';
import 'package:elevate_app/Custom_Widgets/Header/elevate_header.dart';
import 'package:elevate_app/Custom_Widgets/Test_Fields/custom_Text_Field.dart';
import 'package:elevate_app/Custom_Widgets/Text/custom_text.dart';
import 'package:elevate_app/Pages/Login_Screens/login_screen.dart';
import 'package:elevate_app/Resources/Colors/Solid_Colors/solid_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Providers/auth_provider.dart';

class ForgetPasswordScreen extends ConsumerStatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  ConsumerState<ForgetPasswordScreen> createState() =>
      _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends ConsumerState<ForgetPasswordScreen> {
  late TextEditingController emailController;
  late TextEditingController answerController;

  String? selectedQuestion;

  /// Step 1: user verifies security answer.
  /// Step 2 (_verified = true): reset email sent & confirmed.
  bool _verified = false;
  bool _loading = false;

  final List<String> questions = [
    "What's your hobby?",
    'Your first school?',
    'Favorite food?',
  ];

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    answerController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    answerController.dispose();
    super.dispose();
  }

  // ── Step 1: verify security answer ────────────────────────────────────────

  Future<void> _checkAnswer() async {
    if (selectedQuestion == null ||
        emailController.text.trim().isEmpty ||
        answerController.text.trim().isEmpty) {
      _showSnack('Please fill all fields');
      return;
    }

    setState(() => _loading = true);

    final matched = await ref
        .read(authProvider.notifier)
        .verifySecurityAnswer(
          email: emailController.text.trim(),
          question: selectedQuestion!,
          answer: answerController.text.trim(),
        );

    if (!mounted) return;
    setState(() => _loading = false);

    if (!matched) {
      _showSnack('Answer does not match. Try again.');
      return;
    }

    // ── Step 2: answer matched — send reset email ──────────────────────────
    setState(() => _loading = true);

    await ref
        .read(authProvider.notifier)
        .sendPasswordResetEmail(email: emailController.text.trim());

    if (!mounted) return;
    setState(() => _loading = false);
    final err = ref.read(authProvider.notifier).error;
    if (err != null) {
      _showSnack(err);
    } else {
      setState(() => _verified = true);
    }
  }

  void _showSnack(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg, style: const TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF1A1A2E),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ElevateColor.white,
      extendBodyBehindAppBar: true,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Column(
          children: [
            // FIX: use Stack + Positioned instead of hardcoded pixel offsets
            Stack(
              children: [
                ElevateHeader(
                  title: 'Lost Access?',
                  titleSize: 30,
                  subTitle: "Let's reconnect you with your account in seconds.",
                  subtitleSize: 14,
                ),
                Positioned(
                  top: 70,
                  right: 16, // responsive — not a fixed left pixel value
                  child: TexxtButton(
                    text: 'Go To Login',
                    textSize: 12,
                    textColor: Colors.black,
                    backgroundColor: Colors.white,
                    borderRadius: 20,
                    height: 40,
                    width: 120,
                    onTap: () => Navigator.pushReplacement(
                      context,
                      SlideLeftRoute(page: const LoginScreen()),
                    ),
                  ),
                ),
              ],
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),

                      // ── Step 1: security question form ─────────────────
                      if (!_verified) ...[
                        CustomText(
                          text: 'Email',
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: CustomTextField(
                              hintText: 'you@example.com',
                              controller: emailController,
                              cursorColor: ElevateColor.black,
                              underlineColor: Colors.transparent,
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        CustomText(
                          text: 'Security Question',
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: 8),
                        CustomDropDown(
                          hintText: "What's your hobby?",
                          items: questions,
                          value: selectedQuestion,
                          width: double.infinity,
                          borderWidth: 1,
                          backgroundColor: const Color(0xffF2F2F2),
                          onChanged: (value) =>
                              setState(() => selectedQuestion = value),
                        ),

                        const SizedBox(height: 20),

                        CustomText(
                          text: 'Answer',
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: CustomTextField(
                              hintText: 'Your answer',
                              controller: answerController,
                              cursorColor: ElevateColor.black,
                              underlineColor: Colors.transparent,
                            ),
                          ),
                        ),

                        const SizedBox(height: 25),

                        _loading
                            ? const Center(child: CircularProgressIndicator())
                            : TextButtonGradient(
                                text: 'Check',
                                height: 50,
                                textSize: 16,
                                textWeight: FontWeight.w500,
                                borderRadius: 30,
                                onTap: _checkAnswer,
                              ),
                      ],

                      // ── Step 2: success — reset email sent ─────────────
                      if (_verified) ...[
                        const SizedBox(height: 20),

                        const Icon(
                          Icons.mark_email_read_outlined,
                          size: 64,
                          color: Color(0xFF1A1A2E),
                        ),

                        const SizedBox(height: 20),

                        CustomText(
                          text: 'Reset Email Sent!',
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 12),

                        CustomText(
                          text:
                              'We sent a password reset link to ${emailController.text.trim()}. '
                              'Check your inbox and follow the link to set a new password.',
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 30),

                        TextButtonGradient(
                          text: 'Back to Login',
                          height: 50,
                          textSize: 16,
                          textWeight: FontWeight.w500,
                          borderRadius: 30,
                          onTap: () => Navigator.pushReplacement(
                            context,
                            SlideLeftRoute(page: const LoginScreen()),
                          ),
                        ),
                      ],

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
