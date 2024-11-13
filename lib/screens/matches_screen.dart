import 'package:flutter/material.dart';

class MatchesScreen extends StatelessWidget {
  final List<Map<String, String>> matches = [
    {
      'name': 'TechCorp',
      'industry': 'Software Development',
      'location': 'New York, USA',
      'avatar': 'https://avatar.iran.liara.run/public/1',
    },
    {
      'name': 'HealthWorks',
      'industry': 'Healthcare',
      'location': 'Los Angeles, USA',
      'avatar': 'https://avatar.iran.liara.run/public/2',
    },
    {
      'name': 'FinPro',
      'industry': 'Finance',
      'location': 'London, UK',
      'avatar': 'https://avatar.iran.liara.run/public/3',
    },
    {
      'name': 'EduTech',
      'industry': 'EdTech',
      'location': 'San Francisco, USA',
      'avatar': 'https://avatar.iran.liara.run/public/4',
    },
    {
      'name': 'GreenTech',
      'industry': 'Sustainability',
      'location': 'Berlin, Germany',
      'avatar': 'https://avatar.iran.liara.run/public/5',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: matches.length,
          itemBuilder: (context, index) {
            return _buildMatchCard(matches[index]);
          },
        ),
      ),
    );
  }

  Widget _buildMatchCard(Map<String, String> match) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(match['avatar']!),
        ),
        title: Text(
          match['name']!,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              match['industry']!,
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
            SizedBox(height: 5),
            Text(
              match['location']!,
              style: TextStyle(fontSize: 14, color: Colors.grey[500]),
            ),
          ],
        ),
        trailing: ElevatedButton(
          onPressed: () {
            // Add logic for connection or message
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple[300],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            'Connect',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
