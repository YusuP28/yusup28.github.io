import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class TechSection extends StatelessWidget {
  const TechSection({super.key});

  static final List<Map<String, dynamic>> _categories = [
    {
      'title': '📱 Mobile Development',
      'items': [
        {'name': 'Flutter', 'color': 0xFF02569B},
        {'name': 'Dart', 'color': 0xFF0175C2},
        {'name': 'Kotlin', 'color': 0xFF7F52FF},
      ],
    },
    {
      'title': '🌐 Backend & Database',
      'items': [
        {'name': 'Python', 'color': 0xFF3776AB},
        {'name': 'Node.js', 'color': 0xFF339933},
        {'name': 'SQLite', 'color': 0xFF003B57},
      ],
    },
    {
      'title': '⚙️ Tools & Environment',
      'items': [
        {'name': 'Linux', 'color': 0xFFFCC624},
        {'name': 'Termux', 'color': 0xFF1F1F1F},
        {'name': 'Git', 'color': 0xFFF05032},
        {'name': 'GH Actions', 'color': 0xFF2088FF},
        {'name': 'VSCode', 'color': 0xFF007ACC},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 60 : 100,
        horizontal: isMobile ? 24 : 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('Tech Stack', Icons.code),
          const SizedBox(height: 12),
          Text(
            'Tools I use daily to build things',
            style: TextStyle(fontSize: 16, color: AppTheme.textMuted),
          ),
          const SizedBox(height: 40),
          ..._categories.map((cat) => _buildCategory(cat)),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, IconData icon) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            gradient: AppTheme.mainGradient,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.white, size: 24),
        ),
        const SizedBox(width: 16),
        ShaderMask(
          shaderCallback: (bounds) => AppTheme.mainGradient.createShader(bounds),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategory(Map<String, dynamic> cat) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            cat['title'],
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppTheme.textLight,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: (cat['items'] as List<Map<String, dynamic>>)
                .map((item) => _buildBadge(item))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildBadge(Map<String, dynamic> item) {
    final color = Color(item['color']);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.5), width: 1.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            item['name'],
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: AppTheme.textLight,
            ),
          ),
        ],
      ),
    );
  }
}
