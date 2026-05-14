import 'package:elevate_app/Pages/Login_Screens/forget_password_screen.dart';
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
import 'SignUp_Screen.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  String? selectedRole;
  final List<String> roleOptions = ['Job Seeker', 'Company', 'Admin'];
  bool _loading = false;
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (selectedRole == null) {
      _showSnack('Please select a role');
      return;
    }

    setState(() => _loading = true);

    final notifier = ref.read(authProvider.notifier);
    await notifier.login(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    if (!mounted) return;
    setState(() => _loading = false);

    // Show error if login failed
    if (notifier.error != null) {
      _showSnack(notifier.error!);
      return;
    }

    // Validate that the logged-in user matches the selected role
    final user = ref.read(authProvider);
    const roleMap = {
      'Job Seeker': 'JobSeeker',
      'Company': 'Company',
      'Admin': 'Admin',
    };
    final expectedType = roleMap[selectedRole];

    if (user != null && user.userType != expectedType) {
      await notifier.logout();
      if (mounted) {
        _showSnack('This account is not a $selectedRole account.');
      }
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
              title: 'Sign in to your',
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
                      const SizedBox(height: 20), // consistent top spacing

                      CustomText(
                        text:
                            'Sign in and unlock a world of endless opportunities and growth.',
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.left,
                      ),

                      const SizedBox(height: 25),

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
                        text: 'Password',
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

                      // ── Login As ───────────────────────────────────────
                      CustomText(
                        text: 'Login As',
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

                      const SizedBox(height: 20),

                      Center(
                        child: TexxtButton(
                          text: 'Forgot Password?',
                          textSize: 13,
                          textColor: Colors.black,
                          textWeight: FontWeight.w500,
                          textAlign: TextAlign.center,
                          backgroundColor: Colors.white,
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const ForgetPasswordScreen(),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      _loading
                          ? const Center(child: CircularProgressIndicator())
                          : TextButtonGradient(
                              text: 'Log In',
                              height: 50,
                              textSize: 16,
                              textWeight: FontWeight.w500,
                              borderRadius: 30,
                              onTap: _login,
                            ),

                      const SizedBox(height: 20),

                      TexxtButton(
                        text: 'Sign Up',
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
                          SlideLeftRoute(page: const SignUpScreen()),
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
