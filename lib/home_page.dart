import 'package:flutter/material.dart';

import 'dart:ui'; // Required for the glassmorphism blur effect

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // 2. Dark Gradient Overlay (Makes text and buttons pop)
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.5),
                  const Color(0xFF121212).withValues(alpha: 0.95),
                ],
              ),
            ),
          ),

          // 3. Main Content
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 20.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Custom Glass App Bar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.menu, color: Colors.white70, size: 30),
                        _buildGlassCartIcon(),
                      ],
                    ),
                    const SizedBox(height: 30),

                    // Rich Typography Logo with Alignment Fix
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'FrostByte\nJapanese Restaurant', // Added newline for clean wrapping
                            textAlign:
                                TextAlign.center, // Centers the text block
                            style: TextStyle(
                              fontSize:
                                  34, // Slightly reduced to fit screen width
                              fontWeight: FontWeight.w900,
                              letterSpacing: 2.5,
                              color: Colors.white,
                              height:
                                  1.2, // Controls spacing between the two lines
                              shadows: [
                                Shadow(
                                  color: Colors.deepOrange,
                                  blurRadius: 20,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Taste the extraordinary',
                            textAlign: TextAlign.center, // Centers the subtitle
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.orange.shade200,
                              letterSpacing: 2.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),

                    // Main Pizza Image with Glowing BoxShadow
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.deepOrangeAccent.withValues(alpha: 0.3),
                            blurRadius: 50,
                            spreadRadius: 15,
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/pizza.jpg',
                          height: 240,
                          width: 240,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                                height: 240,
                                width: 240,
                                color: Colors.grey.shade900,
                                child: const Icon(
                                  Icons.broken_image,
                                  size: 60,
                                  color: Colors.deepOrange,
                                ),
                              ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),

                    // Glassmorphic OutlinedButtons (Lab Requirement)
                    _buildRichOutlinedButton(
                      context,
                      'Our Menu',
                      Icons.restaurant_menu,
                      '/menu',
                    ),
                    const SizedBox(height: 16),
                    _buildRichOutlinedButton(
                      context,
                      'About Us',
                      Icons.info_outline,
                      '/about',
                    ),
                    const SizedBox(height: 16),
                    _buildRichOutlinedButton(
                      context,
                      'Contact Us',
                      Icons.phone_in_talk,
                      '/contact',
                    ),
                    const SizedBox(height: 40),

                    // Glowing Social Icons (Lab Requirement)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildRichSocialIcon(Icons.close, '/twitter', context),
                        const SizedBox(width: 40),
                        _buildRichSocialIcon(
                          Icons.facebook,
                          '/facebook',
                          context,
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget builder for the cart icon
  Widget _buildGlassCartIcon() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
          ),
          child: const Icon(
            Icons.shopping_cart_outlined,
            color: Colors.white,
            size: 24,
          ),
        ),
      ),
    );
  }

  // Widget builder for the OutlinedButtons
  Widget _buildRichOutlinedButton(
    BuildContext context,
    String label,
    IconData icon,
    String route,
  ) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: SizedBox(
          width: double.infinity,
          height: 60,
          child: OutlinedButton(
            onPressed: () => Navigator.pushNamed(context, route),
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.white.withValues(alpha: 0.05),
              side: const BorderSide(color: Colors.deepOrangeAccent, width: 2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24),
            ),
            child: Row(
              children: [
                Icon(icon, color: Colors.deepOrangeAccent, size: 26),
                Expanded(
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                const SizedBox(width: 26), // Balances the layout
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget builder for the Social Icons
  Widget _buildRichSocialIcon(
    IconData icon,
    String route,
    BuildContext context,
  ) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, route),
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const LinearGradient(
            colors: [Colors.deepOrange, Colors.orangeAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.deepOrange.withValues(alpha: 0.5),
              blurRadius: 15,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Icon(icon, color: Colors.white, size: 28),
      ),
    );
  }
}
