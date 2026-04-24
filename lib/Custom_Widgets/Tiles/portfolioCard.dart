import 'package:flutter/material.dart';

class PortfolioCard extends StatelessWidget {
  final bool isActive;
  final String title;
  final String description;
  final String role;

  const PortfolioCard({
    super.key,
    required this.isActive,
    required this.title,
    required this.description,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(20),
        boxShadow: isActive
            ? const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 12,
                  offset: Offset(0, 6),
                ),
              ]
            : [],
      ),

      /// ✅ IMPORTANT: content wraps only (NO extra height)
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          /// TITLE + ROLE
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: isActive ? Colors.white : Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(width: 8),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isActive ? Colors.white : Colors.grey,
                  ),
                ),
                child: Text(
                  role,
                  style: TextStyle(
                    color: isActive ? Colors.white : Colors.black54,
                    fontSize: 11,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          /// DESCRIPTION
          Text(
            description,
            style: TextStyle(
              color: isActive ? Colors.white70 : Colors.black54,
              fontSize: 13,
            ),
          ),

          const SizedBox(height: 16),

          /// BUTTON
          SizedBox(
            width: double.infinity,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: isActive ? Colors.white : Colors.grey.shade400,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Text(
                  "MORE DETAILS",
                  style: TextStyle(
                    color: isActive ? Colors.black : Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
