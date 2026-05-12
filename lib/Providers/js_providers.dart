// fetches jobs, posts, career tasks, portfolios from Firestore

import 'package:elevate_app/Data_Model_Classes/career_guidance_task_model.dart';
import 'package:elevate_app/Data_Model_Classes/portfolio_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Data_Model_Classes/job_post_model.dart';
import '../Data_Model_Classes/post_model.dart';

import 'auth_provider.dart';

// Loads all jobs from Firebase
final jobListProvider = FutureProvider<List<JobPostModel>>((ref) async {
  return ref.read(firebaseServiceProvider).getAllJobs();
});

// Loads all posts from Firebase
final postsProvider = FutureProvider<List<PostModel>>((ref) async {
  return ref.read(firebaseServiceProvider).getAllPosts();
});

// loads tasks ONLY for the logged-in user
final careerTasksProvider = FutureProvider<List<CareerGuidanceTaskModel>>((
  ref,
) async {
  final user = ref.watch(authProvider);
  if (user == null) return [];
  return ref.read(firebaseServiceProvider).getCareerTasks(user.userID);
});

// Loads portfolio ONLY for the logged-in user
final portfolioProvider = FutureProvider<List<PortfolioModel>>((ref) async {
  final user = ref.watch(authProvider);
  if (user == null) return [];
  return ref.read(firebaseServiceProvider).getPortfolios(user.userID);
});
