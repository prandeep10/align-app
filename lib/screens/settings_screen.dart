import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Color.fromARGB(255, 115, 15, 182),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildProfileSection(),
          const SizedBox(height: 20),
          _buildSettingsOptions(context),
          const SizedBox(height: 20),
          _buildSupportSection(),
          const SizedBox(height: 20),
          _buildSignOutButton(context),
        ],
      ),
    );
  }

  Widget _buildProfileSection() {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage:
                  NetworkImage('https://avatar.iran.liara.run/public/6'),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'John Doe',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'john.doe@example.com',
                  style: TextStyle(color: Colors.grey[600]),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to Edit Profile
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Edit Profile'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsOptions(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          _buildSettingsTile(
            icon: Icons.lock,
            title: 'Privacy Settings',
            onTap: () {
              // Navigate to Privacy Settings
            },
          ),
          _buildDivider(),
          _buildSettingsTile(
            icon: Icons.notifications,
            title: 'Notifications',
            onTap: () {
              // Navigate to Notifications Settings
            },
          ),
          _buildDivider(),
          _buildSettingsTile(
            icon: Icons.palette,
            title: 'Theme',
            onTap: () {
              // Navigate to Theme Settings
            },
          ),
          _buildDivider(),
          _buildSettingsTile(
            icon: Icons.security,
            title: 'Account Security',
            onTap: () {
              // Navigate to Account Security Settings
            },
          ),
          _buildDivider(),
          _buildSettingsTile(
            icon: Icons.language,
            title: 'Language',
            onTap: () {
              // Navigate to Language Settings
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.purple[300]),
      title: Text(title, style: TextStyle(fontSize: 16)),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      color: Colors.grey[300],
      indent: 16,
      endIndent: 16,
    );
  }

  Widget _buildSupportSection() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          _buildSettingsTile(
            icon: Icons.help_outline,
            title: 'Help & Support',
            onTap: () {
              // Navigate to Help & Support
            },
          ),
          _buildDivider(),
          _buildSettingsTile(
            icon: Icons.feedback_outlined,
            title: 'Send Feedback',
            onTap: () {
              // Navigate to Feedback Page
            },
          ),
          _buildDivider(),
          _buildSettingsTile(
            icon: Icons.info_outline,
            title: 'About Us',
            onTap: () {
              // Navigate to About Us Page
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSignOutButton(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        onPressed: () {
          // Handle Sign Out Logic
        },
        icon: Icon(Icons.logout, color: Colors.white),
        label: Text('Sign Out'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red[400],
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
