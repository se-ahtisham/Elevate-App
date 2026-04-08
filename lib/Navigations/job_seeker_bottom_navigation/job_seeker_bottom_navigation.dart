import 'package:elevate_app/Pages/User_Screens/Job_Seeker_Screens/Job_Seeker_Community_Screens/user_community_explore_screen.dart';
import 'package:elevate_app/Pages/User_Screens/Job_Seeker_Screens/Job_Seeker_Community_Screens/user_community_screen.dart';
import 'package:elevate_app/Pages/User_Screens/Job_Seeker_Screens/Job_Seeker_Profile_Screens/job_Seeker_profile_screen.dart';
import 'package:elevate_app/Resources/Colors/Solid_Colors/solid_colors.dart';
import 'package:flutter/material.dart';

/*Scaffold
├─ body: IndexedStack
│   ├─ index: currentIndex
│   └─ children: screens
│       ├─ UserCommunityExploreScreen
│       └─ JobSeekerProfileScreen
│
└─ bottomNavigationBar: Padding
    ├─ padding: EdgeInsets.fromLTRB(20, 0, 20, 30)
    └─ child: Container
        ├─ padding: EdgeInsets.symmetric(vertical: 8)
        ├─ decoration: BoxDecoration
        │   ├─ borderRadius: 25
        │   ├─ border: ElevateColor.gray
        │   ├─ color: Colors.white
        │   └─ boxShadow: [BoxShadow(...)]
        └─ child: Row
            ├─ children: List.generate(navItems.length)
            │   └─ Expanded
            │       └─ InkWell
            │           ├─ onTap: setState(...)
            │           └─ child: Column
            │               ├─ mainAxisSize: MainAxisSize.min
            │               ├─ AnimatedScale
            │               │   ├─ scale: selected ? 1.0 : 0.9
            │               │   └─ child: Icon(item['icon'])
            │               └─ if(selected)
            │                   └─ Padding
            │                       └─ Text(item['label']) */

class JobSeekerBottomNavigation extends StatefulWidget {
  @override
  _JobSeekerBottomNavigationState createState() =>
      _JobSeekerBottomNavigationState();
}

class _JobSeekerBottomNavigationState extends State<JobSeekerBottomNavigation> {
  int currentIndex = 0;

  final screens = [
    // JobSeekerJobScreen(),          // <-- Job Seeker Job screen
    // JobSeekertestScreen(),         // <-- Job Seeker test screen
    UserCommunityScreen(), // <-- Job Seeker Community screen
    // JobSeekerPortfolio(),          // <-- Job Seeker Portfolio screen
    JobSeekerProfileScreen(), // <-- Job Seeker Profile screen
  ];
  final navItems = [
    {'icon': Icons.work_outline, 'label': 'Jobs'},
    {'icon': Icons.rule_outlined, 'label': 'Tests'},
    {'icon': Icons.send_outlined, 'label': 'Network'},
    {'icon': Icons.folder_outlined, 'label': 'Portfolio'},
    {'icon': Icons.person_outline, 'label': 'Profile'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: IndexedStack(index: currentIndex, children: screens),
      bottomNavigationBar: Padding(
        // ouside padding
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 30.0),
        child: Container(
          // inside padding
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: ElevateColor.gray),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(30),
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: List.generate(navItems.length, (i) {
              final item = navItems[i];
              bool selected = currentIndex == i;
              return Expanded(
                child: InkWell(
                  onTap: () => setState(() => currentIndex = i),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // icon animation
                      AnimatedScale(
                        scale: selected ? 1.0 : 0.9,
                        duration: Duration(milliseconds: 200),
                        child: Icon(
                          item['icon'] as IconData,
                          color: selected ? Colors.black : Colors.grey,
                        ),
                      ),

                      // text only when selected
                      if (selected) ...[
                        SizedBox(height: 4),
                        Text(
                          item['label'] as String,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
