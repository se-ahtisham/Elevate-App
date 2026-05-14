// Holds current logged-in user state + login / logout / signup / password-recovery methods.

import 'package:elevate_app/Services/firebase_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Data_Model_Classes/user_model.dart';

/// Shared FirebaseService instance — the only object that talks to Firebase.
final firebaseServiceProvider = Provider<FirebaseService>(
  (ref) => FirebaseService(),
);

/// Authentication state:
///   • non-null  →  user is logged in
///   • null      →  user is logged out
final authProvider = StateNotifierProvider<AuthNotifier, UserModel?>(
  (ref) => AuthNotifier(ref),
);

/// Controls all authentication logic and exposes the current [UserModel] state.
class AuthNotifier extends StateNotifier<UserModel?> {
  final Ref ref;

  /// Holds the latest error message (wrong password, email already exists, etc.).
  /// Reset to null at the start of every operation.
  String? error;

  AuthNotifier(this.ref) : super(null);

  // ── SIGN UP ────────────────────────────────────────────────────────────────

  Future<void> signUpJobSeeker({
    required String name,
    required String email,
    required String password,
    required String securityQuestion,
    required String securityAnswer,
  }) async {
    error = null;
    try {
      state = await ref
          .read(firebaseServiceProvider)
          .signUpJobSeeker(
            name: name,
            email: email,
            password: password,
            securityQuestion: securityQuestion,
            securityAnswer: securityAnswer,
          );
    } catch (e) {
      error = e.toString();
    }
  }

  Future<void> signUpCompany({
    required String name,
    required String email,
    required String password,
    required String companyName,
    required String securityQuestion,
    required String securityAnswer,
  }) async {
    error = null;
    try {
      state = await ref
          .read(firebaseServiceProvider)
          .signUpCompany(
            name: name,
            email: email,
            password: password,
            companyName: companyName,
            securityQuestion: securityQuestion,
            securityAnswer: securityAnswer,
          );
    } catch (e) {
      error = e.toString();
    }
  }

  // ── LOGIN / LOGOUT ────────────────────────────────────────────────────────

  Future<void> login({required String email, required String password}) async {
    error = null;
    try {
      state = await ref
          .read(firebaseServiceProvider)
          .login(email: email, password: password);
    } catch (e) {
      error = e.toString();
    }
  }

  /// Signs the user out and clears the local auth state.
  Future<void> logout() async {
    error = null;
    await ref.read(firebaseServiceProvider).logout();
    state = null;
  }

  // ── PASSWORD RECOVERY ─────────────────────────────────────────────────────

  /// Checks the security question/answer against Firestore.
  /// Returns true if they match, false otherwise.
  Future<bool> verifySecurityAnswer({
    required String email,
    required String question,
    required String answer,
  }) async {
    error = null;
    try {
      return await ref
          .read(firebaseServiceProvider)
          .verifySecurityAnswer(
            email: email,
            question: question,
            answer: answer,
          );
    } catch (e) {
      error = e.toString();
      return false;
    }
  }

  /// Sends a Firebase password-reset email.
  /// Call this after [verifySecurityAnswer] returns true.
  /// The user receives an email with a secure reset link — no plaintext
  /// password is ever stored or transmitted through the app.
  Future<void> sendPasswordResetEmail({required String email}) async {
    error = null;
    try {
      await ref
          .read(firebaseServiceProvider)
          .sendPasswordResetEmail(email: email);
    } catch (e) {
      error = e.toString();
    }
  }
}
