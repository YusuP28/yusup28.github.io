import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

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
          // Section title
          _buildSectionTitle('About Me', Icons.person_outline),
          const SizedBox(height: 40),

          Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left: Story
              Flexible(
                flex: isMobile ? 0 : 1,
                child: _buildStory(context, isMobile),
              ),
              if (!isMobile) const SizedBox(width: 60),
              if (isMobile) const SizedBox(height: 40),
              // Right: Quick facts
              Flexible(
                flex: isMobile ? 0 : 1,
                child: _buildQuickFacts(context),
              ),
            ],
          ),
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

  Widget _buildStory(BuildContext context, bool isMobile) {
    return Container(
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
              Icon(Icons.auto_awesome, color: AppTheme.redBright, size: 20),
              const SizedBox(width: 8),
              Text(
                'My Story',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textLight,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildParagraph(
            "I'm not a coding expert. I'm someone who leverages AI to build real, working apps.",
            bold: true,
          ),
          const SizedBox(height: 16),
          _buildParagraph(
            "I don't memorize syntax. I don't have a CS degree. But I know how to:",
          ),
          const SizedBox(height: 16),
          _buildBullet('🎯 Ask the right questions to AI'),
          _buildBullet('🔍 Debug by trial and error (lots of errors!)'),
          _buildBullet('🚀 Ship real products that work'),
          _buildBullet('📚 Learn from every mistake'),
          const SizedBox(height: 16),
          _buildParagraph(
            "Every app here was built with AI assistance — from a phone, using Termux. This is the future of software: anyone can build, if they're willing to learn.",
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.purple.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border(
                left: BorderSide(color: AppTheme.redBright, width: 4),
              ),
            ),
            child: Text(
              '"I don\'t write code. I direct AI to write code. Then I fix what breaks."',
              style: TextStyle(
                fontSize: 15,
                fontStyle: FontStyle.italic,
                color: AppTheme.textLight.withOpacity(0.9),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildParagraph(String text, {bool bold = false}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 15,
        color: bold ? AppTheme.textLight : AppTheme.textMuted,
        fontWeight: bold ? FontWeight.w600 : FontWeight.normal,
        height: 1.6,
      ),
    );
  }

  Widget _buildBullet(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 15,
              color: AppTheme.textLight.withOpacity(0.9),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickFacts(BuildContext context) {
    final facts = [
      ('👤', 'Name', 'YusuP28'),
      ('💼', 'Role', 'Flutter Developer'),
      ('📍', 'Location', 'Indonesia 🇮🇩'),
      ('📱', 'Platform', 'Android + Termux'),
      ('🔨', 'Build', 'GitHub Actions'),
      ('🤖', 'Co-pilot', 'AI-assisted'),
    ];

    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        gradient: AppTheme.cardGradient,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppTheme.redBright.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.flash_on, color: AppTheme.redBright, size: 20),
              const SizedBox(width: 8),
              Text(
                'Quick Facts',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textLight,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ...facts.map((f) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Text(f.$1, style: const TextStyle(fontSize: 20)),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            f.$2,
                            style: TextStyle(
                              fontSize: 12,
                              color: AppTheme.textMuted,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            f.$3,
                            style: TextStyle(
                              fontSize: 15,
                              color: AppTheme.textLight,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
