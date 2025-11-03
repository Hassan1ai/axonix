import 'package:flutter/material.dart';
import '../config/theme.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _floatingController;
  late AnimationController _fadeController;

  @override
  void initState() {
    super.initState();
    
    _floatingController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
    
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..forward();

    // Navigate to signup screen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/signup');
      }
    });
  }

  @override
  void dispose() {
    _floatingController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Floating Circles Background
          ...List.generate(6, (index) {
            return _buildFloatingCircle(index);
          }),
          
          // Center Content
          Center(
            child: FadeTransition(
              opacity: _fadeController,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo Circle with A
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: AppTheme.cardBackground,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppTheme.borderPrimary,
                        width: 2,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'A',
                        style: TextStyle(
                          fontSize: 64,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.primaryCyan,
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 40),
                  
                  // Axonix Text
                  const Text(
                    'Axonix',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.primaryCyan,
                      letterSpacing: 1.2,
                    ),
                  ),
                  
                  const SizedBox(height: 12),
                  
                  // Subtitle
                  const Text(
                    'Smart Digital Memory',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.textSecondary,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingCircle(int index) {
    final sizes = [100.0, 60.0, 80.0, 120.0, 70.0, 90.0];
    final colors = [
      AppTheme.accentTeal.withOpacity(0.3),
      AppTheme.accentPurple.withOpacity(0.3),
      AppTheme.primaryCyan.withOpacity(0.2),
      AppTheme.accentPurple.withOpacity(0.4),
      AppTheme.accentTeal.withOpacity(0.4),
      AppTheme.primaryCyan.withOpacity(0.3),
    ];
    
    final positions = [
      const Offset(0.3, 0.15),
      const Offset(0.85, 0.2),
      const Offset(0.65, 0.35),
      const Offset(0.15, 0.65),
      const Offset(0.8, 0.85),
      const Offset(0.9, 0.5),
    ];

    return AnimatedBuilder(
      animation: _floatingController,
      builder: (context, child) {
        final screenWidth = MediaQuery.of(context).size.width;
        final screenHeight = MediaQuery.of(context).size.height;
        final offset = math.sin(_floatingController.value * 2 * math.pi) * 20;
        
        return Positioned(
          left: positions[index].dx * screenWidth - sizes[index] / 2,
          top: positions[index].dy * screenHeight - sizes[index] / 2 + offset,
          child: Container(
            width: sizes[index],
            height: sizes[index],
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colors[index],
              boxShadow: [
                BoxShadow(
                  color: colors[index],
                  blurRadius: 40,
                  spreadRadius: 10,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
