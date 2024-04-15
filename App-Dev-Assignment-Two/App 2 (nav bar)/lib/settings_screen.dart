import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isLockedInBackground = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings UI',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView(
        children: [
          _buildSectionLabel('Common'),
          _buildCommonSettings(),
          SizedBox(height: 20), // Add spacing between sections
          _buildSectionLabel('Account'),
          _buildAccountSettings(),
          SizedBox(height: 20), // Add spacing between sections
          _buildSectionLabel('Security'),
          _buildSecuritySettings(),
        ],
      ),
    );
  }

  Widget _buildSectionLabel(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.deepOrange[700],
        ),
      ),
    );
  }

  Widget _buildCommonSettings() {
    return Column(
      children: ListTile.divideTiles(
        context: context,
        tiles: [
          ListTile(
            title: Text('Language'),
            subtitle: Text('English'),
            leading: Icon(Icons.language),
          ),
          ListTile(
            title: Text('Environment'),
            subtitle: Text('Production'),
            leading: Icon(Icons.cloud_queue),
          ),
        ],
      ).toList(),
    );
  }

  Widget _buildAccountSettings() {
    return Column(
      children: ListTile.divideTiles(
        context: context,
        tiles: [
          ListTile(
            title: Text('Phone number'),
            leading: Icon(Icons.phone),
          ),
          ListTile(
            title: Text('Email'),
            leading: Icon(Icons.email),
          ),
          ListTile(
            title: Text('Sign out'),
            leading: Icon(Icons.exit_to_app),
          ),
        ],
      ).toList(),
    );
  }

  Widget _buildSecuritySettings() {
    return Column(
      children: ListTile.divideTiles(
        context: context,
        tiles: [
          ListTile(
            title: Text('Lock app in background'),
            leading: Icon(Icons.lock),
            trailing: Switch(
              value: isLockedInBackground,
              onChanged: (bool value) {
                setState(() {
                  isLockedInBackground = value;
                });
              },
            ),
          ),
        ],
      ).toList(),
    );
  }
}
