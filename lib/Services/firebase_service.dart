// All Firebase read/write operations (single bridge to Firestore & Auth)

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elevate_app/Data_Model_Classes/request_job_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Data_Model_Classes/user_model.dart';
import '../Data_Model_Classes/job_seeker_model.dart';
import '../Data_Model_Classes/company_model.dart';
import '../Data_Model_Classes/admin_model.dart';
import '../Data_Model_Classes/job_post_model.dart';
import '../Data_Model_Classes/portfolio_model.dart';
import '../Data_Model_Classes/post_model.dart';
import '../Data_Model_Classes/skill_badge_test_model.dart';
import '../Data_Model_Classes/career_guidance_task_model.dart';
import '../Data_Model_Classes/follow_request_model.dart';
import '../Data_Model_Classes/employee_model.dart';
import '../Data_Model_Classes/review_model.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  FirebaseAuth get auth => _auth;
  FirebaseFirestore get firestore => _db;

  // Creates a Firebase Auth user, saves job seeker data in Firestore users collection, and returns the created user.
  Future<JobSeekerModel> signUpJobSeeker({
    required String name,
    required String email,
    required String password,
    required String securityQuestion,
    required String securityAnswer,
  }) async {
    final credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await credential.user!.sendEmailVerification();

    final user = JobSeekerModel(
      userID: credential.user!.uid,
      name: name,
      email: email,
      password: password,
      securityQuestion: securityQuestion,
      securityAnswer: securityAnswer,
    );

    await _db.collection('users').doc(user.userID).set(user.toMap());
    return user;
  }

  //  Creates a Firebase Auth account, saves company details in Firestore users collection, and returns the company user.
  Future<CompanyModel> signUpCompany({
    required String name,
    required String email,
    required String password,
    required String companyName,
    required String securityQuestion,
    required String securityAnswer,
  }) async {
    final credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await credential.user!.sendEmailVerification();

    final user = CompanyModel(
      userID: credential.user!.uid,
      name: name,
      email: email,
      password: password,
      companyName: companyName,
      securityQuestion: securityQuestion,
      securityAnswer: securityAnswer,
    );

    await _db.collection('users').doc(user.userID).set(user.toMap());
    return user;
  }

  // Logs in the user, fetches their data from Firestore, and returns the correct user model.
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    final credential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final doc = await _db.collection('users').doc(credential.user!.uid).get();
    final data = doc.data()!;
    final type = data['userType'];

    if (type == 'JobSeeker') return JobSeekerModel.fromMap(data);
    if (type == 'Company') return CompanyModel.fromMap(data);
    if (type == 'Admin') return AdminModel.fromMap(data);

    return UserModel.fromMap(data);
  }

  // Returns true if the current user's email is verified.
  bool isEmailVerified() => _auth.currentUser?.emailVerified ?? false;

  Future<void> resendVerificationEmail() async {
    final user = _auth.currentUser;
    if (user == null) return;

    await user.sendEmailVerification();
  }

  // Sends a password reset email to the user.
  Future<void> resetPassword(String email) =>
      _auth.sendPasswordResetEmail(email: email);

  // Logs the user out
  Future<void> logout() => _auth.signOut();

  // Retrieves a user from Firestore using their ID.
  Future<UserModel?> getUserById(String id) async {
    final doc = await _db.collection('users').doc(id).get();
    if (!doc.exists) return null;

    final data = doc.data()!;
    final type = data['userType'];

    if (type == 'JobSeeker') return JobSeekerModel.fromMap(data);
    if (type == 'Company') return CompanyModel.fromMap(data);
    if (type == 'Admin') return AdminModel.fromMap(data);

    return UserModel.fromMap(data);
  }

  // Updates the profile data of a specific user.
  Future<void> updateUserProfile(String id, Map<String, dynamic> data) {
    return _db.collection('users').doc(id).update(data);
  }

  // Adds a new job to the Firestore 'jobs' collection and updates the company's job count.
  Future<void> postJob(JobPostModel job) async {
    await _db.collection('jobs').doc(job.jobID).set(job.toMap());

    await _db.collection('users').doc(job.companyID).update({
      'postedJobs': FieldValue.arrayUnion([job.jobID]),
      'activeJobs': FieldValue.increment(1),
    });
  }

  // Retrieves all job posts from the 'jobs' collection.
  Future<List<JobPostModel>> getAllJobs() async {
    final snap = await _db.collection('jobs').get();
    return snap.docs.map((d) => JobPostModel.fromMap(d.data())).toList();
  }

  // Retrieves all jobs posted by a specific company.
  Future<List<JobPostModel>> getJobsByCompany(String id) async {
    final snap = await _db
        .collection('jobs')
        .where('companyID', isEqualTo: id)
        .get();

    return snap.docs.map((d) => JobPostModel.fromMap(d.data())).toList();
  }

  // Deletes a specific job post and updates the company's job count.
  Future<void> deleteJob(String jobID, String companyID) async {
    await _db.collection('jobs').doc(jobID).delete();

    await _db.collection('users').doc(companyID).update({
      'postedJobs': FieldValue.arrayRemove([jobID]),
      'activeJobs': FieldValue.increment(-1),
    });
  }

  // Saves job application, updates job seeker, company, and job applicant lists.
  Future<void> applyForJob(RequestJobModel app) async {
    await _db
        .collection('applications')
        .doc(app.applicationID)
        .set(app.toMap());

    await _db.collection('users').doc(app.jobSeekerID).update({
      'appliedJobRequests': FieldValue.arrayUnion([app.applicationID]),
    });

    final job = await _db.collection('jobs').doc(app.jobID).get();
    final companyID = job.data()!['companyID'];

    await _db.collection('users').doc(companyID).update({
      'receivedApplications': FieldValue.arrayUnion([app.applicationID]),
    });

    await _db.collection('jobs').doc(app.jobID).update({
      'applicants': FieldValue.arrayUnion([app.applicationID]),
    });
  }

  // Updates an application's status and updates the relevant user and job collections.
  Future<void> updateApplicationStatus(String id, String status) {
    return _db.collection('applications').doc(id).update({'status': status});
  }

  // Adds a portfolio to Firestore and updates the job seeker's portfolio list.
  Future<void> addPortfolio(PortfolioModel p) async {
    await _db.collection('portfolios').doc(p.portfolioID).set(p.toMap());

    await _db.collection('users').doc(p.jobSeekerID).update({
      'portfolioList': FieldValue.arrayUnion([p.portfolioID]),
    });
  }

  // Deletes a portfolio and updates the job seeker's portfolio list.
  Future<void> deletePortfolio(String id, String userID) async {
    await _db.collection('portfolios').doc(id).delete();

    await _db.collection('users').doc(userID).update({
      'portfolioList': FieldValue.arrayRemove([id]),
    });
  }

  // Retrieves all portfolios for a specific job seeker.
  Future<List<PortfolioModel>> getPortfolios(String id) async {
    final snap = await _db
        .collection('portfolios')
        .where('jobSeekerID', isEqualTo: id)
        .get();

    return snap.docs.map((d) => PortfolioModel.fromMap(d.data())).toList();
  }

  // Creates a new post and updates the author's post list.
  Future<void> createPost(PostModel post) async {
    await _db.collection('posts').doc(post.postID).set(post.toMap());

    await _db.collection('users').doc(post.authorID).update({
      'postList': FieldValue.arrayUnion([post.postID]),
    });
  }

  // Retrieves all posts from Firestore, ordered by creation time.
  Future<List<PostModel>> getAllPosts() async {
    final snap = await _db.collection('posts').orderBy('createdAt').get();
    return snap.docs.map((d) => PostModel.fromMap(d.data())).toList();
  }

  // Deletes a post and updates the author's post list.
  Future<void> deletePost(String id, String userID) async {
    await _db.collection('posts').doc(id).delete();

    await _db.collection('users').doc(userID).update({
      'postList': FieldValue.arrayRemove([id]),
    });
  }

  // Increases the like count of a specific post.
  Future<void> likePost(String id) {
    return _db.collection('posts').doc(id).update({
      'likes': FieldValue.increment(1),
    });
  }

  // Adds a comment to a specific post.
  Future<void> addComment(String id, CommentModel c) {
    return _db.collection('posts').doc(id).update({
      'comments': FieldValue.arrayUnion([c.toMap()]),
    });
  }

  // SKILLS / BADGES / TESTS
  Future<void> createSkill(SkillModel s) =>
      _db.collection('skills').doc(s.skillID).set(s.toMap());

  Future<void> createBadge(BadgeModel b) =>
      _db.collection('badges').doc(b.badgeID).set(b.toMap());

  Future<void> createTest(TestModel t) =>
      _db.collection('tests').doc(t.testID).set(t.toMap());

  Future<List<SkillModel>> getAllSkills() async {
    final snap = await _db.collection('skills').get();
    return snap.docs.map((d) => SkillModel.fromMap(d.data())).toList();
  }

  // Retrieves all badges from Firestore.
  Future<List<BadgeModel>> getAllBadges() async {
    final snap = await _db.collection('badges').get();
    return snap.docs.map((d) => BadgeModel.fromMap(d.data())).toList();
  }

  // Retrieves all tests from Firestore.
  Future<List<TestModel>> getAllTests() async {
    final snap = await _db.collection('tests').get();
    return snap.docs.map((d) => TestModel.fromMap(d.data())).toList();
  }

  // CAREER TASKS
  Future<void> addCareerTask(CareerGuidanceTaskModel t) async {
    await _db.collection('careerTasks').doc(t.taskID).set(t.toMap());

    await _db.collection('users').doc(t.jobSeekerID).update({
      'careerGuidanceTasks': FieldValue.arrayUnion([t.taskID]),
    });
  }

  // Marks a specific career task as complete and records the completion time.
  Future<void> markTaskComplete(String id) {
    return _db.collection('careerTasks').doc(id).update({
      'isCompleted': true,
      'completedAt': DateTime.now().toIso8601String(),
    });
  }

  // Deletes a career task and removes it from the job seeker's task list.
  Future<void> deleteCareerTask(String id, String userID) async {
    await _db.collection('careerTasks').doc(id).delete();

    await _db.collection('users').doc(userID).update({
      'careerGuidanceTasks': FieldValue.arrayRemove([id]),
    });
  }

  // Retrieves career tasks for a specific job seeker.
  Future<List<CareerGuidanceTaskModel>> getCareerTasks(String id) async {
    final snap = await _db
        .collection('careerTasks')
        .where('jobSeekerID', isEqualTo: id)
        .get();

    return snap.docs
        .map((d) => CareerGuidanceTaskModel.fromMap(d.data()))
        .toList();
  }

  // FOLLOW REQUESTS
  // Sends a follow request to another user.
  Future<void> sendFollowRequest(FollowRequestModel r) async {
    await _db.collection('followRequests').doc(r.requestID).set(r.toMap());

    await _db.collection('users').doc(r.toID).update({
      'followRequests': FieldValue.arrayUnion([r.requestID]),
    });
  }

  // Accepts a follow request, updates status, and adds followers/following.
  Future<void> acceptFollowRequest(
    String id,
    String fromID,
    String toID,
  ) async {
    await _db.collection('followRequests').doc(id).update({'status': true});

    await _db.collection('users').doc(fromID).update({
      'following': FieldValue.arrayUnion([toID]),
    });

    await _db.collection('users').doc(toID).update({
      'followers': FieldValue.arrayUnion([fromID]),
    });
  }

  // Rejects a follow request and removes it from the user's request list.
  Future<void> rejectFollowRequest(String id, String toID) async {
    await _db.collection('followRequests').doc(id).delete();

    await _db.collection('users').doc(toID).update({
      'followRequests': FieldValue.arrayRemove([id]),
    });
  }

  // EMPLOYEES
  Future<void> createEmployee(EmployeeModel e) async {
    await _db.collection('employees').doc(e.employeeID).set(e.toMap());
  }

  // Updates an employee's status to terminated.
  Future<void> terminateEmployee(String id) {
    return _db.collection('employees').doc(id).update({
      'employeeStatus': 'Terminated',
    });
  }

  // Retrieves employees for a specific company.
  Future<List<EmployeeModel>> getEmployees(String id) async {
    final snap = await _db
        .collection('employees')
        .where('companyID', isEqualTo: id)
        .get();

    return snap.docs.map((d) => EmployeeModel.fromMap(d.data())).toList();
  }

  // REVIEWS
  Future<void> addReview(ReviewModel r) async {
    await _db.collection('reviews').doc(r.reviewID).set(r.toMap());
  }

  // Retrieves reviews for a specific company.
  Future<List<ReviewModel>> getReviewsForCompany(String id) async {
    final snap = await _db
        .collection('reviews')
        .where('companyID', isEqualTo: id)
        .get();

    return snap.docs.map((d) => ReviewModel.fromMap(d.data())).toList();
  }

  // ADMIN
  Future<List<UserModel>> getUsersByType(String type) async {
    final snap = await _db
        .collection('users')
        .where('userType', isEqualTo: type)
        .get();

    return snap.docs.map((d) => UserModel.fromMap(d.data())).toList();
  }

  // Deletes a user and removes their account from Firebase Authentication.
  Future<void> deleteUser(String id) async {
    await _db.collection('users').doc(id).delete();

    final user = _auth.currentUser;
    if (user != null && user.uid == id) {
      await user.delete();
    }
  }
}
