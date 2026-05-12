// fetches company's jobs and employees from Firestore

import 'package:elevate_app/Data_Model_Classes/employee_model.dart';
import 'package:elevate_app/Data_Model_Classes/job_post_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth_provider.dart';

// loads jobs posted by the logged-in company
final companyJobsProvider = FutureProvider<List<JobPostModel>>((ref) async {
  final user = ref.watch(authProvider);

  if (user == null) return [];

  return ref.read(firebaseServiceProvider).getJobsByCompany(user.userID);
});

// loads employees who applied for jobs in the company
final employeesProvider = FutureProvider<List<EmployeeModel>>((ref) async {
  final user = ref.watch(authProvider);
  if (user == null) return [];
  return ref.read(firebaseServiceProvider).getEmployees(user.userID);
});
