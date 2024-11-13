import 'package:flutter/material.dart';
import 'package:align_app/screens/find_match_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Intro Section
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 40.0, horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Headline
                  Text(
                    'Welcome to Align App!',
                    style: TextStyle(
                      fontSize: 42.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'ElegantFont', // A sleek, premium font
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Discover your perfect connections, whether you are looking for the right job or matching with a company. Let us help you align with your career goals.',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white70,
                      fontFamily:
                          'ElegantFont', // Elegant font for a luxurious feel
                    ),
                  ),
                  SizedBox(height: 30),
                  // Call to Action Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FindMatchScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Color(0xFF6225FC), // Brighter violet for CTA
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            50.0), // Luxurious rounded corners
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 50.0),
                      elevation: 10,
                    ),
                    child: Text(
                      'Find Your Match',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            // Services Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Our Premium Services',
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'ElegantFont',
                    ),
                  ),
                  SizedBox(height: 30),
                  // Service 1
                  ServiceCard(
                    icon: Icons.group_add,
                    title: 'Networking',
                    description:
                        'Build connections with professionals, students, and companies with ease.',
                  ),
                  SizedBox(height: 30),
                  // Service 2
                  ServiceCard(
                    icon: Icons.work,
                    title: 'Job Opportunities',
                    description:
                        'Find personalized job listings that match your skills and aspirations.',
                  ),
                  SizedBox(height: 30),
                  // Service 3
                  ServiceCard(
                    icon: Icons.search,
                    title: 'Advanced Search',
                    description:
                        'Apply filters to discover the best matches based on your preferences.',
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const ServiceCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF8608A5), // Deep violet
            Color(0xFF6225FC), // Brighter violet
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.2, 1], // Control gradient stops for smoothness
        ),
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 12.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 40.0,
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'ElegantFont', // Consistent luxurious font
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    fontFamily: 'ElegantFont',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
