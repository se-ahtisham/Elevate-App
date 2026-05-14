import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:elevate_app/Animation/slide_left_route.dart';
import 'package:elevate_app/Custom_Widgets/Buttons/text_button_gradient.dart';
import 'package:elevate_app/Custom_Widgets/Buttons/texxt_button.dart';
import 'package:elevate_app/Custom_Widgets/Drop_Down_Menu/custom_drop_down.dart';
import 'package:elevate_app/Custom_Widgets/Header/elevate_header.dart';
import 'package:elevate_app/Custom_Widgets/Test_Fields/custom_Text_Field.dart';
import 'package:elevate_app/Custom_Widgets/Text/custom_text.dart';
import 'package:elevate_app/Resources/Colors/Solid_Colors/solid_colors.dart';
import '../../Providers/auth_provider.dart';
import 'login_screen.dart';

// FIX: renamed from SignupScreen → SignUpScreen to match the reference in login_screen.dart
class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController answerController;

  String? selectedQuestion;
  String? selectedRole;
  bool _loading = false;
  bool _obscurePassword = true;

  final List<String> questions = [
    "What's your hobby?",
    'Your first school?',
    'Favorite food?',
  ];

  final List<String> roleOptions = ['Job Seeker', 'Company'];

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    answerController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    answerController.dispose();
    super.dispose();
  }

  Future<void> _signup() async {
    // Basic validation
    if (nameController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty ||
        answerController.text.trim().isEmpty ||
        selectedRole == null ||
        selectedQuestion == null) {
      _showSnack('Please fill all fields');
      return;
    }

    setState(() => _loading = true);
    final notifier = ref.read(authProvider.notifier);

    if (selectedRole == 'Job Seeker') {
      await notifier.signUpJobSeeker(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        securityQuestion: selectedQuestion!,
        securityAnswer: answerController.text.trim(),
      );
    } else {
      await notifier.signUpCompany(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        companyName: nameController.text
            .trim(), // TODO: add separate company name field
        securityQuestion: selectedQuestion!,
        securityAnswer: answerController.text.trim(),
      );
    }

    if (!mounted) return;
    setState(() => _loading = false);

    if (notifier.error != null) {
      _showSnack(notifier.error!);
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
            ElevateHeader(
              title: 'Sign Up to your',
              titleSize: 30,
              subTitle: 'Account',
              subtitleSize: 20,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),

                      // ── Name ───────────────────────────────────────────
                      CustomText(
                        text: 'Name',
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
                            hintText: 'Your full name',
                            controller: nameController,
                            cursorColor: ElevateColor.black,
                            underlineColor: Colors.transparent,
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // ── Email ──────────────────────────────────────────
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

                      // ── Password ───────────────────────────────────────
                      CustomText(
                        text: 'Set Password',
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
                          child: Row(
                            children: [
                              Expanded(
                                child: CustomTextField(
                                  hintText: '**************',
                                  controller: passwordController,
                                  cursorColor: ElevateColor.black,
                                  underlineColor: Colors.transparent,
                                  obscureText: _obscurePassword,
                                ),
                              ),
                              GestureDetector(
                                onTap: () => setState(
                                  () => _obscurePassword = !_obscurePassword,
                                ),
                                child: Icon(
                                  _obscurePassword
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // ── Security Question ──────────────────────────────
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

                      // ── Answer ─────────────────────────────────────────
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

                      const SizedBox(height: 20),

                      // ── Join As ────────────────────────────────────────
                      CustomText(
                        text: 'Join as',
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 8),
                      CustomDropDown(
                        hintText: 'Job Seeker / Company',
                        items: roleOptions,
                        value: selectedRole,
                        width: double.infinity,
                        borderWidth: 1,
                        backgroundColor: const Color(0xffF2F2F2),
                        onChanged: (value) =>
                            setState(() => selectedRole = value),
                      ),

                      const SizedBox(height: 25),

                      _loading
                          ? const Center(child: CircularProgressIndicator())
                          : TextButtonGradient(
                              text: 'Register',
                              height: 50,
                              textSize: 16,
                              textWeight: FontWeight.w500,
                              borderRadius: 30,
                              onTap: _signup,
                            ),

                      const SizedBox(height: 20),

                      TexxtButton(
                        text: 'Cancel',
                        textSize: 13,
                        textColor: Colors.black,
                        textWeight: FontWeight.w500,
                        textAlign: TextAlign.center,
                        backgroundColor: Colors.white,
                        borderColor: Colors.black,
                        borderRadius: 30,
                        borderWidth: 1,
                        height: 50,
                        onTap: () => Navigator.pushReplacement(
                          context,
                          SlideLeftRoute(page: const LoginScreen()),
                        ),
                      ),

                      const SizedBox(height: 30),
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
