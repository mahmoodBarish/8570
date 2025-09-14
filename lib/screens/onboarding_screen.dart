import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    const double figmaWidth = 375;
    const double figmaHeight = 812;

    return Scaffold(
      // The background color is primarily black, matching the gradient's end color and overall theme.
      backgroundColor: const Color.fromRGBO(5, 5, 5, 1.0),
      body: Stack(
        children: [
          // Background Image (id: I156:95;417:719)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            // Original height: 536px. Scale proportionally to screen height.
            height: screenHeight * (536 / figmaHeight),
            child: Image.asset(
              'assets/images/I156_95_417_719.png',
              fit: BoxFit.cover, // Use BoxFit.cover to fill the space while maintaining aspect ratio
            ),
          ),

          // Gradient Overlay (id: 156:97 "Shadow Container")
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            // Original height: 360px. Scale proportionally to screen height.
            height: screenHeight * (360 / figmaHeight),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(5, 5, 5, 0.0), // Figma r: 0.0196..., g: 0.0196..., b: 0.0196..., a: 0
                    Color.fromRGBO(5, 5, 5, 1.0), // Figma r: 0.0196..., g: 0.0196..., b: 0.0196..., a: 1
                  ],
                  stops: [0.0, 0.23670603334903717], // Figma gradient stops
                ),
              ),
            ),
          ),

          // Main Content (Title, Description, Button)
          // The content block's position is derived from the button's bottom edge.
          // Button's absoluteBoundingBox.y is 702, height is 56. So its bottom is 702 + 56 = 758.
          // Screen height is 812. Thus, 812 - 758 = 54px from the screen bottom.
          Positioned(
            bottom: screenHeight * (54 / figmaHeight),
            left: 0,
            right: 0,
            child: Padding(
              // Original x=24 margin for the content. Scale proportionally.
              padding: EdgeInsets.symmetric(horizontal: screenWidth * (24 / figmaWidth)),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Make column wrap its children's height
                crossAxisAlignment: CrossAxisAlignment.center, // Center children horizontally
                children: [
                  // Title Text (id: 156:101)
                  Text(
                    'Fall in Love with Coffee in Blissful Delight!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.sora(
                      fontSize: screenWidth * (32 / figmaWidth), // Scale font size responsively
                      fontWeight: FontWeight.w600, // Sora-SemiBold
                      color: Colors.white,
                      height: 1.5, // Line height 48px / font size 32px = 1.5
                      letterSpacing: 0.16,
                    ),
                  ),
                  SizedBox(height: screenHeight * (8 / figmaHeight)), // Item spacing 8px between texts
                  // Description Text (id: 156:102)
                  Text(
                    'Welcome to our cozy coffee corner, where every cup is a delightful for you.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.sora(
                      fontSize: screenWidth * (14 / figmaWidth), // Scale font size responsively
                      fontWeight: FontWeight.w400, // Sora-Regular
                      color: const Color.fromRGBO(167, 167, 167, 1.0), // Figma r: 0.635, g: 0.635, b: 0.635, a: 1
                      height: 1.5, // Line height 21px / font size 14px = 1.5
                      letterSpacing: 0.14,
                    ),
                  ),
                  // Gap between text frame bottom (y=670) and button frame top (y=702) is 32px (702-670)
                  SizedBox(height: screenHeight * (32 / figmaHeight)),
                  // Get Started Button (id: 156:98)
                  SizedBox(
                    width: double.infinity, // Make button take full available width (respecting padding)
                    height: screenHeight * (56 / figmaHeight), // Original height 56px. Scale responsively.
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to the home screen using go_router.
                        context.go('/home');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(198, 124, 78, 1.0), // Figma r: 0.776, g: 0.486, b: 0.305, a: 1
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16), // cornerRadius 16
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * (20 / figmaWidth), // paddingLeft/Right 20. Scale responsively.
                          vertical: screenHeight * (16 / figmaHeight), // paddingTop/Bottom 16. Scale responsively.
                        ),
                      ),
                      child: Text(
                        'Get Started',
                        style: GoogleFonts.sora(
                          fontSize: screenWidth * (16 / figmaWidth), // Scale font size responsively
                          fontWeight: FontWeight.w600, // Sora-SemiBold
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Custom Status Bar (Top) (id: 156:104 "Iphone" variant "Time")
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            // Original height 44px. Scale responsively.
            height: screenHeight * (44 / figmaHeight),
            child: SafeArea(
              bottom: false, // Status bar is at the top, so no bottom safe area needed for this widget.
              child: Padding(
                // Original horizontal padding 24px for the content within the status bar.
                padding: EdgeInsets.symmetric(horizontal: screenWidth * (24 / figmaWidth)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribute children to the ends
                  children: [
                    Text(
                      '9:41', // Original time text
                      style: GoogleFonts.sora(
                        fontSize: screenWidth * (15 / figmaWidth), // Adjusted to commonly seen status bar time size (was 12px in render bounds, but visually often larger)
                        fontWeight: FontWeight.w600, // Inferring SemiBold for status bar time for readability
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: [
                        // Mobile Signal Icon (id: I156:104;417:339)
                        Icon(Icons.signal_cellular_alt, color: Colors.white, size: screenWidth * (17 / figmaWidth)),
                        SizedBox(width: screenWidth * (5 / figmaWidth)), // Small spacing between icons
                        // Wifi Icon (id: I156:104;417:335)
                        Icon(Icons.wifi, color: Colors.white, size: screenWidth * (17 / figmaWidth)),
                        SizedBox(width: screenWidth * (5 / figmaWidth)), // Small spacing between icons
                        // Battery Icon (id: I156:104;417:331)
                        Icon(Icons.battery_full_rounded, color: Colors.white, size: screenWidth * (20 / figmaWidth)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Home Indicator (Bottom) (id: 156:103 "Iphone" variant "Home Indicator")
          Positioned(
            // Calculated bottom position: absoluteBoundingBox.y (799) + height (5) = 804. Screen height 812.
            // So, 812 - 804 = 8px from the screen bottom.
            bottom: screenHeight * (8 / figmaHeight),
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: screenWidth * (134 / figmaWidth), // Original width 134px. Scale responsively.
                height: screenHeight * (5 / figmaHeight), // Original height 5px. Scale responsively.
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(36, 36, 36, 1.0), // Figma r: 0.141, g: 0.141, b: 0.141, a: 1
                  borderRadius: BorderRadius.circular(100), // cornerRadius 100 makes it a pill shape
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}