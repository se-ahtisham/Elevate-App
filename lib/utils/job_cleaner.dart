import 'package:elevate_app/Data_Model_Classes/job_model.dart';
import 'text_normalizer.dart';

class JobCleaner {
  static List<Job> clean(List<Job> jobs) {
    final Map<String, Job> unique = {};

    for (final job in jobs) {
      if (job.title.isEmpty || job.company.isEmpty || job.applyUrl.isEmpty) {
        continue;
      }

      final key =
          '${TextNormalizer.normalize(job.title)}@${TextNormalizer.normalize(job.company)}';

      unique.putIfAbsent(key, () => job);
    }

    return unique.values.toList();
  }
}
