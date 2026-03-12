import 'package:elevate_app/Custom_Widgets/Text/custom_text.dart';
import 'package:elevate_app/Custom_Widgets/User_Widgets/community_post_card.dart';
import 'package:elevate_app/Custom_Widgets/User_Widgets/member_card.dart';
import 'package:elevate_app/Resources/Colors/Gradient_Colors/gradient_colors.dart';
import 'package:elevate_app/Resources/Colors/Solid_Colors/solid_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommunitiesScreen extends StatefulWidget {
  const CommunitiesScreen({super.key});

  @override
  State<CommunitiesScreen> createState() => _CommunitiesScreenState();
}

class _CommunitiesScreenState extends State<CommunitiesScreen> {
  // 0 = Explore, 1 = My Communities, 2 = My Post
  int _selectedTab = 1;

  final List<Map<String, String>> _members = [
    {"name": "AHTISHAM ARSHAD", "role": "Software Engineer"},
    {"name": "Muhammad Moiz", "role": "Backend Developer"},
    {"name": "Eman Shahid", "role": "Ml Engineer"},
    {"name": "Ahmad Bin Javed", "role": "Data Analysis"},
    {"name": "AHTISHAM ARSHAD", "role": "Software Engineer"},
    {"name": "AHTISHAM ARSHAD", "role": "Software Engineer"},
  ];

  final List<Map<String, dynamic>> _posts = [
    {
      "name": "AHTISHAM ARSHAD",
      "role": "SOFTWARE ENGINEER",
      "date": "12-Dec-2025",
      "title": "This is what I learned in my recent course",
      "body":
          "\"The whole secret of existence lies in the pursuit of meaning, purpose, and connection. It is a delicate dance between self-discovery, compassion for others, and embracing the ever-unfolding mysteries of life.\"",
      "comments": 24,
    },
    {
      "name": "AHTISHAM ARSHAD",
      "role": "SOFTWARE ENGINEER",
      "date": "10-Oct-2025",
      "title": "This is what I learned in my recent course",
      "body":
          "\"The whole secret of existence lies in the pursuit of meaning, purpose, and connection. It is a delicate dance between self-discovery, compassion for others, and embracing the ever-unfolding mysteries of life.\"",
      "comments": 24,
    },
  ];

  String _getInitials(String name) {
    final parts = name.trim().split(' ');
    if (parts.length == 1) {
      return parts.first.substring(0, 1).toUpperCase();
    }
    return (parts.first.substring(0, 1) + parts.last.substring(0, 1))
        .toUpperCase();
  }

  Widget _buildTabItem({
    required String label,
    required int tabIndex,
    double fontSize = 11,
  }) {
    final bool isSelected = _selectedTab == tabIndex;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = tabIndex;
        });
      },
      child: Container(
        height: 32,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          gradient:
              isSelected ? ElevateGradientColors.grayToBlack : null,
          color: isSelected ? null : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.center,
        child: CustomText(
          text: label,
          fontSize: fontSize,
          color:
              isSelected ? ElevateColor.white : ElevateColor.whitegray,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Container(
          height: double.infinity,
          color: ElevateColor.white,
          child: Column(
            children: [
              // Top spacing for status bar + header
              SizedBox(height: MediaQuery.of(context).padding.top + 12),

              // Simple header: icon + title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.groups_2_outlined,
                      size: 22,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 8),
                    CustomText(
                      text: "Communities",
                      fontSize: 18,
                      color: ElevateColor.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Tabs: Explore | My Communities | My Post
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildTabItem(
                      label: "Explore",
                      tabIndex: 0,
                      fontSize: 13,
                    ),
                    _buildTabItem(
                      label: "My Communities",
                      tabIndex: 1,
                      fontSize: 11,
                    ),
                    _buildTabItem(
                      label: "My Post",
                      tabIndex: 2,
                      fontSize: 11,
                    ),
                  ],
                ),
              ),

              if (_selectedTab != 2) ...[
                const SizedBox(height: 10),

                // Search bar (only for Explore & My Communities)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3F3F3),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          size: 20,
                          color: ElevateColor.whitegray,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search Followers",
                            ),
                            style: const TextStyle(fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 10),
              ],

              Expanded(
                child: () {
                  switch (_selectedTab) {
                    case 0:
                      return _buildExploreTab();
                    case 1:
                      return _buildMyCommunitiesTab();
                    case 2:
                    default:
                      return _buildMyPostTab();
                  }
                }(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExploreTab() {
    return Center(
      child: CustomText(
        text: "Explore communities coming soon",
        fontSize: 13,
        color: ElevateColor.whitegray,
      ),
    );
  }

  Widget _buildMyCommunitiesTab() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: _members.length,
        itemBuilder: (context, index) {
          final member = _members[index];
          final name = member["name"] ?? "";
          final role = member["role"] ?? "";
          return MemberCard(
            initials: _getInitials(name),
            name: name,
            role: role,
            onTap: () {
              // TODO: navigate to member profile
            },
          );
        },
      ),
    );
  }

  Widget _buildMyPostTab() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          final post = _posts[index];
          final name = post["name"] as String? ?? "";
          final role = post["role"] as String? ?? "";
          final date = post["date"] as String? ?? "";
          final title = post["title"] as String? ?? "";
          final body = post["body"] as String? ?? "";
          final comments = post["comments"] as int? ?? 0;

          return CommunityPostCard(
            initials: _getInitials(name),
            name: name,
            role: role,
            dateLabel: date,
            title: title,
            body: body,
            commentCount: comments,
          );
        },
      ),
    );
  }
}
