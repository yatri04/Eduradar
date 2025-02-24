import 'package:flutter/material.dart';
import 'package:trial1/auth/login.dart';
import 'package:trial1/auth/register.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/splashscreenimage.png"), 
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row for EduRadar (Left) & Login Button (Right)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // EduRadar on the left
                  Text(
                    'EduRadar',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 2.0,
                    ),
                  ),

                  // Login Button on the right
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      minimumSize: Size(120, 40), // Smaller button
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text(
                      'Login/Register',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),

            // Spacer to push content down
            SizedBox(height: 100),

            //  Tagline (Centered)
            // Center(
            //   child: Text(
            //     'Find the best tutors near you!',
            //     style: TextStyle(
            //       fontSize: 18,
            //       color: Colors.white,
            //     ),
            //     textAlign: TextAlign.center,
            //   ),
            // ),
            // SizedBox(height: 50),

            // // Location Icon (Centered)
            // Center(
            //   child: Icon(
            //     Icons.location_on,
            //     size: 100,
            //     color: Colors.white,
            //   ),
            // ),
            // SizedBox(height: 50),

            // // Register Button (Centered)
            // Center(
            //   child: ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: Colors.lightBlueAccent,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(20),
            //       ),
            //       minimumSize: Size(200, 50), // Fix button size
            //     ),
            //     onPressed: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (context) => RegisterPage()),
            //       );
            //     },
            //     child: Text(
            //       'Register',
            //       style: TextStyle(fontSize: 18, color: Colors.white),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
