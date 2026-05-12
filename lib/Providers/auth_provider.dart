// holds current logged-in user, login/logout/signup methods

/*It creates a central place to manage: 
User signup
User login
Logout
Password reset
Current logged-in user state */

import 'package:elevate_app/Services/firebase_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Data_Model_Classes/user_model.dart';

/*This creates one shared FirebaseService object.
FirebaseService is the class that actually talks to Firebase.*/

final firebaseServiceProvider = Provider<FirebaseService>(
  (ref) => FirebaseService(),
);

// This is the main authentication state manager. It stores: If user is logged in → contains user data, If user is logged out → null
final authProvider = StateNotifierProvider<AuthNotifier, UserModel?>(
  (ref) => AuthNotifier(ref),
);

// This class controls authentication logic and updates the app state.Think of it like: "Authentication Controller"
class AuthNotifier extends StateNotifier<UserModel?> {
  final Ref
  ref; // Get the FirebaseService provider, Without ref, AuthNotifier cannot access other providers.
  String?
  error; //  This stores error messages. wrong password, email already exists, nternet issue

  AuthNotifier(this.ref) : super(null);

  Future<void> signUpJobSeeker({
    required String name,
    required String email,
    required String password,
    required String securityQuestion,
    required String securityAnswer,
  }) async {
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

  Future<void> login({required String email, required String password}) async {
    try {
      state = await ref
          .read(firebaseServiceProvider)
          .login(email: email, password: password);
    } catch (e) {
      error = e.toString();
    }
  }

  Future<void> resetPassword(String email) async {
    await ref.read(firebaseServiceProvider).resetPassword(email);
  }

  Future<void> logout() async {
    await ref.read(firebaseServiceProvider).logout();
    state = null;
  }
}
