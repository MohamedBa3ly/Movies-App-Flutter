import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../navigation/screens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _iconController;
  late Animation<double> _iconAnimation;

  late AnimationController _textController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    // Icon Animation (Scaling)
    _iconController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _iconAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _iconController, curve: Curves.easeInOut),
    );

    // Text Animation (Fade In + Slide Up)
    _textController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_textController);
    _slideAnimation = Tween<Offset>(begin: const Offset(0, 0.5), end: const Offset(0, 0))
        .animate(CurvedAnimation(parent: _textController, curve: Curves.easeInOut));

    // Start text animation after 1 second delay
    Future.delayed(const Duration(seconds: 1), () {
      _textController.forward();
    });

    // Navigate to Home Screen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        GoRouter.of(context).pushReplacement(InitialScreens.login);
      }
    });
  }

  @override
  void dispose() {
    _iconController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Animated Icon
            ScaleTransition(
              scale: _iconAnimation,
              child: Image.asset(
                'assets/images/movie_icon.png',
                width: 120,
                height: 120,
              ),
            ),
            const SizedBox(height: 20), // Space between icon and text
            // Animated Text
            FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: const Text(
                  "Welcome to Movie App 🎬",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
