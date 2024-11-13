import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FindMatchScreen extends StatefulWidget {
  @override
  _FindMatchScreenState createState() => _FindMatchScreenState();
}

class _FindMatchScreenState extends State<FindMatchScreen> {
  final List<Map<String, String>> _companies = [
    {
      'name': 'TechCorp',
      'industry': 'Software Development',
      'location': 'New York, USA',
      'image': 'https://www.logologo.com/logos/circular-letter-e-logo.jpg',
      'linkedin': 'https://www.linkedin.com/company/techcorp',
    },
    {
      'name': 'HealthWorks',
      'industry': 'Healthcare',
      'location': 'Los Angeles, USA',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSk9g22VXKyqe5gwQEWbRmhO4BH049-zyccy89NaqrmJ_XNVNTlmSv-IxX-9fqn2wFqGrM&usqp=CAU',
      'linkedin': 'https://www.linkedin.com/company/healthworks',
    },
    {
      'name': 'FinPro',
      'industry': 'Finance',
      'location': 'London, UK',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHCCvvEu7UHLJZ6B88qVsU8tOoAutR5QWj4fROsnSCCYJj5wIDCwYmYIIsvRcKwScyixs&usqp=CAU',
      'linkedin': 'https://www.linkedin.com/company/finpro',
    },
    {
      'name': 'EduTech',
      'industry': 'EdTech',
      'location': 'San Francisco, USA',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjRaT2NyAnLs8z3AOIVTVjTlPASLjsRqMpjw&s',
      'linkedin': 'https://www.linkedin.com/company/edutech',
    },
    {
      'name': 'GreenTech',
      'industry': 'Sustainability',
      'location': 'Berlin, Germany',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRH6PmGvBWG_4xdDFPDRVaPuezhYli2l_P5_A&s',
      'linkedin': 'https://www.linkedin.com/company/greentech',
    },
  ];

  int _currentIndex = 0;

  void _handleSwipe(String action) {
    setState(() {
      if (_currentIndex < _companies.length - 1) {
        _currentIndex++;
      }
    });
  }

  void _launchLinkedIn(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentIndex < _companies.length
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ClipRRect(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(20)),
                            child: Image.network(
                              _companies[_currentIndex]['image']!,
                              height: 300,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _companies[_currentIndex]['name']!,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  _companies[_currentIndex]['industry']!,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                Text(
                                  _companies[_currentIndex]['location']!,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                const SizedBox(height: 16),
                                GestureDetector(
                                  onTap: () {
                                    _launchLinkedIn(
                                        _companies[_currentIndex]['linkedin']!);
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.link, color: Colors.blue),
                                      const SizedBox(width: 8),
                                      Text(
                                        'Connect on LinkedIn',
                                        style: TextStyle(
                                          color: Colors.blue,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.close, color: Colors.red, size: 40),
                        onPressed: () => _handleSwipe('reject'),
                      ),
                      const SizedBox(width: 20),
                      IconButton(
                        icon: Icon(Icons.check, color: Colors.green, size: 40),
                        onPressed: () => _handleSwipe('accept'),
                      ),
                    ],
                  ),
                ],
              ),
            )
          : Center(
              child: Text(
                'No more matches!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
    );
  }
}
