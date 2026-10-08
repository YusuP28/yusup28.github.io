import 'package:flutter/material.dart';
import '../widgets/hero_section.dart';
import '../widgets/about_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/tech_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/footer.dart';
import '../theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.darkBg,
      body: SingleChildScrollView(
        child: Column(
          children: const [
            HeroSection(),
            AboutSection(),
            ProjectsSection(),
            TechSection(),
            ContactSection(),
            FooterWidget(),
          ],
        ),
      ),
    );
  }
}
