import 'package:flutter/material.dart';

class JobCompactTile extends StatelessWidget {
  final String initials;
  final String title;
  final String company;
  final String location;
  final List<String> tags;
  final VoidCallback? onTap;

  const JobCompactTile({
    super.key,
    required this.initials,
    required this.title,
    required this.company,
    required this.location,
    this.tags = const ['Remote', 'Full Time', '600/month'],
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF7F7F7),
          borderRadius: BorderRadius.circular(22),
          boxShadow: const [
            BoxShadow(
              color: Color(0x12000000),
              blurRadius: 12,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: Row(
            children: [
              /// LEFT + CENTER
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /// TOP ROW
                      Row(
                        children: [
                          /// Avatar
                          Container(
                            width: 44,
                            height: 44,
                            decoration: const BoxDecoration(
                              color: Color(0xFF2F2F2F),
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              "MS",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),

                          const SizedBox(width: 12),

                          /// Title + subtitle
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF1A1A1A),
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  "$company · $location",
                                  style: const TextStyle(
                                    fontSize: 11.5,
                                    color: Color(0xFF8C8C8C),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 6),

                      /// TAGS
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (int i = 0; i < tags.length; i++) ...[
                              _buildTag(tags[i]),
                              if (i != tags.length - 1) const SizedBox(width: 6),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// RIGHT ACTION SECTION
              InkWell(
                onTap: onTap,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(22),
                  bottomRight: Radius.circular(22),
                ),
                child: Container(
                  width: 55,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF6B6B6B), Color(0xFF111111)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(22),
                      bottomRight: Radius.circular(22),
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xFFEFEFEF),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 10.5,
          fontWeight: FontWeight.w500,
          color: Color(0xFF6F6F6F),
        ),
      ),
    );
  }
}