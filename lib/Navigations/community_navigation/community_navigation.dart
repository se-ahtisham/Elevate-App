import 'package:elevate_app/Custom_Widgets/Text/custom_text.dart';
import 'package:elevate_app/Resources/Colors/Gradient_Colors/gradient_colors.dart';
import 'package:flutter/material.dart';

/*TopNavigation
└── DefaultTabController (length: titles.length)
    └── Column
        ├── Padding (vertical: 8)
        │   └── TabBar
        │       ├── isScrollable: true
        │       ├── indicatorSize: TabBarIndicatorSize.tab
        │       ├── indicator: BoxDecoration (gradient: grayToBlack, borderRadius: 30)
        │       ├── labelColor: white
        │       ├── unselectedLabelColor: grey
        │       ├── labelPadding: EdgeInsets(horizontal: 20)
        │       └── Tabs (one for each title)
        │           └── Tab
        │               └── CustomText (text: title, fontWeight: w500)
        └── Expanded
            └── TabBarView
                └── screens (children: widgets corresponding to each tab) */

class TopNavigation extends StatelessWidget {
  final List<String> titles;
  final List<Widget> screens;

  const TopNavigation({super.key, required this.titles, required this.screens});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: titles.length,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: TabBar(
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                gradient: ElevateGradientColors.grayToBlack,
                borderRadius: BorderRadius.circular(30),
              ),
              labelColor: Colors.white,
              dividerColor:
                  Colors.transparent, // Line below Color is transparent

              tabAlignment: TabAlignment.start,
              unselectedLabelColor: Colors.grey,
              labelPadding: const EdgeInsets.symmetric(horizontal: 20),
              tabs: titles.map((title) {
                return Tab(
                  child: CustomText(
                    text: title,
                    color: null,
                    fontWeight: FontWeight.w500,
                  ), // null due to tab overtake color white
                );
              }).toList(),
            ),
          ),
          Expanded(child: TabBarView(children: screens)),
        ],
      ),
    );
  }
}
