import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      decoration: BoxDecoration(
        color: AppTheme.darkCard,
        border: Border(
          top: BorderSide(color: AppTheme.purple.withOpacity(0.2), width: 1),
        ),
      ),
      child: Column(
        children: [
          ShaderMask(
            shaderCallback: (bounds) => AppTheme.mainGradient.createShader(bounds),
            child: const Text(
              '⚡ Code from anywhere, build anywhere. ⚡',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            '© 2026 YusuP28 · Built with Flutter + AI',
            style: TextStyle(fontSize: 13, color: AppTheme.textMuted),
          ),
        ],
      ),
    );
  }
}
