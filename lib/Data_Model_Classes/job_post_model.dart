


class JobPostModel {
  final String jobID;                  // PK
  final String companyID;              // FK → users/
  final String title;
  final String description;
  final List<String> requiredSkills;   // skillIDs → collection: skills/
  final List<String> requiredBadges;   // badgeIDs → collection: badges/
  final String salary;                 // e.g. "50k–80k"
  final String jobType;                // 'Full-time' | 'Part-time' | 'Remote'
  final String location;
  final String experienceLevel;        // 'Junior' | 'Mid' | 'Senior'
  final DateTime postedAt;
  final List<String> applicants;       // applicationIDs → collection: applications/

  JobPostModel({
    required this.jobID,
    required this.companyID,
    required this.title,
    this.description = '',
    this.requiredSkills = const [],
    this.requiredBadges = const [],
    this.salary = '',
    this.jobType = 'Full-time',
    this.location = '',
    this.experienceLevel = 'Junior',
    this.applicants = const [],
    DateTime? postedAt,
  }) : postedAt = postedAt ?? DateTime.now();

  Map<String, dynamic> toMap() {
    return {
      'jobID': jobID,
      'companyID': companyID,
      'title': title,
      'description': description,
      'requiredSkills': requiredSkills,
      'requiredBadges': requiredBadges,
      'salary': salary,
      'jobType': jobType,
      'location': location,
      'experienceLevel': experienceLevel,
      'postedAt': postedAt.toIso8601String(),
      'applicants': applicants,
    };
  }

  factory JobPostModel.fromMap(Map<String, dynamic> map) {
    return JobPostModel(
      jobID: map['jobID'] ?? '',
      companyID: map['companyID'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      requiredSkills: List<String>.from(map['requiredSkills'] ?? []),
      requiredBadges: List<String>.from(map['requiredBadges'] ?? []),
      salary: map['salary'] ?? '',
      jobType: map['jobType'] ?? 'Full-time',
      location: map['location'] ?? '',
      experienceLevel: map['experienceLevel'] ?? 'Junior',
      postedAt: map['postedAt'] != null
          ? DateTime.parse(map['postedAt'])
          : DateTime.now(),
      applicants: List<String>.from(map['applicants'] ?? []),
    );
  }
}

// ─────────────────────────────────────────────────────────────────
//  REQUEST JOB  (Job Application — from draw.io "Request Job" box)
//
//  Firebase collection: applications/
//  JobSeeker stores ID in appliedJobRequests.
//  Company stores ID in receivedApplications.
// ─────────────────────────────────────────────────────────────────

class RequestJobModel {
  final String applicationID;   // PK
  final String jobID;           // FK → jobs/
  final String jobSeekerID;     // FK → users/
  final String status;          // 'Pending' | 'Accepted' | 'Rejected'
  final DateTime appliedAt;

  RequestJobModel({
    required this.applicationID,
    required this.jobID,
    required this.jobSeekerID,
    this.status = 'Pending',
    DateTime? appliedAt,
  }) : appliedAt = appliedAt ?? DateTime.now();

  Map<String, dynamic> toMap() {
    return {
      'applicationID': applicationID,
      'jobID': jobID,
      'jobSeekerID': jobSeekerID,
      'status': status,
      'appliedAt': appliedAt.toIso8601String(),
    };
  }

  factory RequestJobModel.fromMap(Map<String, dynamic> map) {
    return RequestJobModel(
      applicationID: map['applicationID'] ?? '',
      jobID: map['jobID'] ?? '',
      jobSeekerID: map['jobSeekerID'] ?? '',
      status: map['status'] ?? 'Pending',
      appliedAt: map['appliedAt'] != null
          ? DateTime.parse(map['appliedAt'])
          : DateTime.now(),
    );
  }
}
