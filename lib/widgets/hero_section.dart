import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

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
        vertical: isMobile ? 80 : 140,
        horizontal: isMobile ? 24 : 80,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1A0B2E), Color(0xFF0D1117)],
        ),
      ),
      child: Column(
        children: [
          // Profile avatar
          Container(
            width: isMobile ? 100 : 140,
            height: isMobile ? 100 : 140,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppTheme.mainGradient,
              boxShadow: [
                BoxShadow(
                  color: AppTheme.purple.withOpacity(0.5),
                  blurRadius: 40,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: Center(
              child: Text(
                'Y',
                style: TextStyle(
                  fontSize: isMobile ? 48 : 64,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),

          // Name
          ShaderMask(
            shaderCallback: (bounds) => AppTheme.mainGradient.createShader(bounds),
            child: Text(
              'YusuP28',
              style: TextStyle(
                fontSize: isMobile ? 40 : 72,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: -1.5,
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Role
          Text(
            'Flutter Developer  ·  Mobile Enthusiast',
            style: TextStyle(
              fontSize: isMobile ? 16 : 22,
              color: AppTheme.textMuted,
              letterSpacing: 0.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),

          // CTA buttons
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: [
              _buildPrimaryButton(
                'View Projects',
                Icons.rocket_launch,
                () => _launch('https://github.com/YusuP28?tab=repositories'),
              ),
              _buildSecondaryButton(
                'GitHub',
                () => _launch('https://github.com/YusuP28'),
              ),
              _buildSecondaryButton(
                'Email',
                () => _launch('mailto:muhamadyusup070420@gmail.com'),
              ),
            ],
          ),
          const SizedBox(height: 60),

          // Scroll indicator
          if (!isMobile)
            Icon(
              Icons.keyboard_arrow_down,
              color: AppTheme.textMuted,
              size: 32,
            ),
        ],
      ),
    );
  }

  Widget _buildPrimaryButton(String label, IconData icon, VoidCallback onTap) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(50),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          decoration: BoxDecoration(
            gradient: AppTheme.mainGradient,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: AppTheme.redDeep.withOpacity(0.4),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Colors.white, size: 20),
              const SizedBox(width: 10),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSecondaryButton(String label, VoidCallback onTap) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(50),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: AppTheme.textMuted.withOpacity(0.3), width: 1.5),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: AppTheme.textLight,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
