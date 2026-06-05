import 'package:elevate_app/Custom_Widgets/Buttons/posted_jobs_bottom_nav.dart';
import 'package:elevate_app/Custom_Widgets/User_Widgets/custom_job_card.dart';
import 'package:elevate_app/Resources/Colors/Solid_Colors/solid_colors.dart';
import 'package:flutter/material.dart';

class CompanyPostedJobsScreen extends StatefulWidget {
  const CompanyPostedJobsScreen({super.key});

  @override
  State<CompanyPostedJobsScreen> createState() =>
      _CompanyPostedJobsScreenState();
}

class _CompanyPostedJobsScreenState extends State<CompanyPostedJobsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 6, 10, 0),
          child: Column(
            children: [
              _topHeader(),
              const SizedBox(height: 10),

              _searchBar(),

              const SizedBox(height: 12),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Posted Jobs',
                  style: TextStyle(
                    color: ElevateColor.gray,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              const SizedBox(height: 8),

              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(bottom: 10),
                  children: const [
                    CustomJobCard(
                      initials: 'MS',
                      title: 'UI/UX Designer',
                      companyAndLocation: 'Microsoft • USA',
                      tags: ['Remote', 'Full Time', '600/mon'],
                    ),
                    SizedBox(height: 8),

                    CustomJobCard(
                      initials: 'GG',
                      title: 'Product Designer',
                      companyAndLocation: 'Google • USA',
                      tags: ['Hybrid', 'Full Time', '800/mon'],
                    ),
                    SizedBox(height: 8),

                    CustomJobCard(
                      initials: 'AP',
                      title: 'Mobile Engineer',
                      companyAndLocation: 'Apple • USA',
                      tags: ['Remote', 'Contract', '900/mon'],
                    ),
                    SizedBox(height: 8),

                    CustomJobCard(
                      initials: 'MS',
                      title: 'UI/UX Designer',
                      companyAndLocation: 'Microsoft • USA',
                      tags: ['Remote', 'Full Time', '600/mon'],
                    ),
                    SizedBox(height: 8),

                    CustomJobCard(
                      initials: 'AD',
                      title: 'Visual Designer',
                      companyAndLocation: 'Adobe • USA',
                      tags: ['Onsite', 'Full Time', '700/mon'],
                    ),
                  ],
                ),
              ),

              PostedJobsBottomNav(
                activeIndex: 1,
                onTap: (index) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Bottom nav $index')));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _topHeader() {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          alignment: Alignment.center,
          child: Text(
            'A',
            style: TextStyle(
              color: ElevateColor.gray,
              fontWeight: FontWeight.w800,
              fontSize: 35,
            ),
          ),
        ),
        const SizedBox(width: 10),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Let's Upload Opportunity",
                style: TextStyle(
                  fontSize: 11.5,
                  color: Color.fromARGB(255, 94, 87, 87),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'TechNova Inc.',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF4D4D4D),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Color(0xFF555555), Color(0xFF141414)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: const Icon(
            Icons.ios_share_rounded,
            size: 20,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _searchBar() {
    return Container(
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F0F0),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFE6E6E6)),
      ),
      child: const Row(
        children: [
          Icon(Icons.search_rounded, size: 20, color: Color(0xFF4D4D4D)),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              enabled: true,
              decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
                hintText: 'Search Post',
                hintStyle: TextStyle(fontSize: 13, color: Color(0xFFB0B0B0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
