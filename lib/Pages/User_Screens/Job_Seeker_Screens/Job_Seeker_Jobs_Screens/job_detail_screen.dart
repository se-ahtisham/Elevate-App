import 'package:elevate_app/Data_Model_Classes/job_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class JobDetailScreen extends StatelessWidget {
  final Job job;

  const JobDetailScreen({super.key, required this.job});

  Future<void> openApply(BuildContext context) async {
    final uri = Uri.parse(job.applyUrl);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Cannot open link")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(job.title)),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// COMPANY + LOCATION
            Text(
              "${job.company} · ${job.location}",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 10),

            /// DETAILS
            Text("Salary: ${job.salary ?? "Not disclosed"}"),
            Text("Type: ${job.jobType ?? "Full Time"}"),
            Text("Platform: ${job.platform}"),
            Text(job.isRemote ? "Remote" : "On-site"),

            const SizedBox(height: 20),

            /// DESCRIPTION
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  job.description ?? "No description available",
                  style: const TextStyle(height: 1.5),
                ),
              ),
            ),

            /// APPLY BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => openApply(context),
                child: const Text("Apply Now"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
