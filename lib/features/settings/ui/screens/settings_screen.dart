import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings')
      ),
      body: ListView(
        children: <Widget>[
          SwitchListTile(
            value: false, 
            title: Text('Dark Mode'),
            onChanged: null,
          ),
          ListTile(
            title: Text('Change country'),
            subtitle: Text('Select the country to receive news from'),
            onTap: null,
          ),
          ListTile(
            title: Text('News categories'),
            subtitle: Text('Select the news categories you want to see'),
            onTap: null,
          )
        ]
      ),
    );
  }
}