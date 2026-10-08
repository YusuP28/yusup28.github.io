import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  static final List<Map<String, dynamic>> _projects = [
    {
      'name': 'note_app',
      'emoji': '📝',
      'desc': 'Flutter notes app with PIN lock, fingerprint, markdown, neumorphism, Google Drive backup.',
      'url': 'https://github.com/YusuP28/note_app',
      'tech': ['Flutter', 'Dart', 'SQLite'],
      'status': 'Released',
      'statusColor': 0xFF4CAF50,
    },
    {
      'name': 'take_grid',
      'emoji': '🖼️',
      'desc': 'Flutter grid photo maker — auto grid, custom picker, collage mode, 6+ layout variants.',
      'url': 'https://github.com/YusuP28/take_grid',
      'tech': ['Flutter', 'Dart', 'CustomPainter'],
      'status': 'In Progress',
      'statusColor': 0xFFFF9800,
    },
    {
      'name': 'pos_v2',
      'emoji': '💰',
      'desc': 'Offline-first POS (Point of Sale) app with SQLite database.',
      'url': 'https://github.com/YusuP28/pos_v2',
      'tech': ['Flutter', 'Dart', 'SQLite'],
      'status': 'Stable',
      'statusColor': 0xFF2196F3,
    },
  ];

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

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
          _buildSectionTitle('Projects', Icons.rocket_launch),
          const SizedBox(height: 12),
          Text(
            'Things I\'ve built from my phone 🤳',
            style: TextStyle(
              fontSize: 16,
              color: AppTheme.textMuted,
            ),
          ),
          const SizedBox(height: 40),

          // Project cards
          ..._projects.map((p) => _buildProjectCard(context, p, isMobile)),
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

  Widget _buildProjectCard(BuildContext context, Map<String, dynamic> p, bool isMobile) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _launch(p['url']),
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              gradient: AppTheme.cardGradient,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: AppTheme.purple.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(p['emoji'], style: const TextStyle(fontSize: 36)),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            p['name'],
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.textLight,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: Color(p['statusColor']).withOpacity(0.2),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              p['status'],
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: Color(p['statusColor']),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppTheme.textMuted,
                      size: 18,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  p['desc'],
                  style: TextStyle(
                    fontSize: 15,
                    color: AppTheme.textMuted,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: (p['tech'] as List<String>)
                      .map((t) => Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppTheme.purple.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                color: AppTheme.purple.withOpacity(0.3),
                              ),
                            ),
                            child: Text(
                              t,
                              style: TextStyle(
                                fontSize: 12,
                                color: AppTheme.purple,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
