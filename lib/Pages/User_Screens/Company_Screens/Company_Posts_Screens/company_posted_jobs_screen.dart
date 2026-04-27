import 'package:elevate_app/Custom_Widgets/Buttons/posted_jobs_bottom_nav.dart';
import 'package:elevate_app/Custom_Widgets/Tiles/posted_job_card.dart';
import 'package:elevate_app/Resources/Colors/Solid_Colors/solid_colors.dart';
import 'package:flutter/material.dart';

class CompanyPostedJobsScreen extends StatefulWidget {
  const CompanyPostedJobsScreen({super.key});

  @override
  State<CompanyPostedJobsScreen> createState() => _CompanyPostedJobsScreenState();
}

class _CompanyPostedJobsScreenState extends State<CompanyPostedJobsScreen> {
  final TextEditingController _searchCtrl = TextEditingController();
  String _query = '';

  final List<Map<String, dynamic>> _allJobs = const [
    {
      'initials': 'MS',
      'title': 'UI/UX Designer',
      'company': 'Microsoft',
      'location': 'USA',
      'tags': ['Remote', 'Full Time', '600/mon']
    },
    {
      'initials': 'GG',
      'title': 'Product Designer',
      'company': 'Google',
      'location': 'USA',
      'tags': ['Hybrid', 'Full Time', '800/mon']
    },
    {
      'initials': 'AP',
      'title': 'Mobile Engineer',
      'company': 'Apple',
      'location': 'USA',
      'tags': ['Remote', 'Contract', '900/mon']
    },
    {
      'initials': 'MS',
      'title': 'UI/UX Designer',
      'company': 'Microsoft',
      'location': 'USA',
      'tags': ['Remote', 'Full Time', '600/mon']
    },
    {
      'initials': 'AD',
      'title': 'Visual Designer',
      'company': 'Adobe',
      'location': 'USA',
      'tags': ['Onsite', 'Full Time', '700/mon']
    },
  ];

  List<Map<String, dynamic>> get _filteredJobs {
    final q = _query.trim().toLowerCase();
    if (q.isEmpty) return _allJobs;
    return _allJobs.where((j) {
      final title = (j['title'] as String).toLowerCase();
      final company = (j['company'] as String).toLowerCase();
      final location = (j['location'] as String).toLowerCase();
      final tags = (j['tags'] as List).join(' ').toLowerCase();
      return title.contains(q) || company.contains(q) || location.contains(q) || tags.contains(q);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
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
                child: ListView.separated(
                  itemCount: _filteredJobs.length,
                  padding: const EdgeInsets.only(bottom: 10),
                  separatorBuilder: (_, _) => const SizedBox(height: 8),
                  itemBuilder: (_, index) {
                    final job = _filteredJobs[index];
                    final companyAndLocation = '${job['company']}  •  ${job['location']}';
                    return PostedJobCard(
                      initials: job['initials'] as String,
                      title: job['title'] as String,
                      companyAndLocation: companyAndLocation,
                      tags: (job['tags'] as List).cast<String>(),
                      isSelected: false,
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Open ${job['title']}')),
                        );
                      },
                    );
                  },
                ),
              ),
              PostedJobsBottomNav(
                activeIndex: 1,
                onTap: (index) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Bottom nav $index')),
                  );
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
          width: 46,
          height: 46,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFE4E4E4),
          ),
          alignment: Alignment.center,
          child: Text(
            'A',
            style: TextStyle(
              color: ElevateColor.gray,
              fontWeight: FontWeight.w700,
              fontSize: 30,
              height: 1.0,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Let's Upload Opportunity",
                style: TextStyle(
                  fontSize: 11.5,
                  color: Color(0xFF9A9A9A),
                  fontWeight: FontWeight.w500,
                  height: 1.1,
                ),
              ),
              Text(
                'TechNova Inc.',
                style: TextStyle(
                  fontSize: 25,
                  color: ElevateColor.gray,
                  fontWeight: FontWeight.w700,
                  height: 1.0,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 40,
          height: 40,
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
            size: 17,
            color: ElevateColor.white,
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
      child: Row(
        children: [
          const Icon(Icons.search_rounded, size: 20, color: Color(0xFF4D4D4D)),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: _searchCtrl,
              onChanged: (v) => setState(() => _query = v),
              cursorColor: ElevateColor.gray,
              decoration: const InputDecoration(
                isDense: true,
                border: InputBorder.none,
                hintText: 'Search Post',
                hintStyle: TextStyle(
                  fontSize: 13,
                  color: Color.fromARGB(255, 143, 143, 143),
                  fontWeight: FontWeight.w500,
                ),
              ),
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF4D4D4D),
              ),
            ),
          ),
          if (_query.isNotEmpty)
            GestureDetector(
              onTap: () {
                _searchCtrl.clear();
                setState(() => _query = '');
              },
              child: const Icon(Icons.close_rounded, size: 18, color: Color(0xFF9A9A9A)),
            ),
        ],
      ),
    );
  }
}
