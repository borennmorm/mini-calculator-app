// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mini Calculator',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Version 1.0.0',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'This is a simple calculator app designed to perform basic arithmetic operations such as addition, subtraction, multiplication, and division. It provides a user-friendly interface and quick calculations for everyday use.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Developer:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.person),
                SizedBox(width: 8),
                Text(
                  'Morm Borenn',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.email),
                SizedBox(width: 8),
                Text(
                  'borinmorm5@gmail.com',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                FaIcon(FontAwesomeIcons.telegram),
                SizedBox(width: 8),
                Text(
                  '@borin_morm',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                FaIcon(FontAwesomeIcons.github),
                SizedBox(width: 8),
                Text(
                  'borinmorm21',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _launchURL('https://github.com/borinmorm21');
        },
        tooltip: 'Github',
        backgroundColor: Colors.white,
        shape: const CircleBorder(),
        child: const Icon(
          FontAwesomeIcons.github,
          color: Colors.black,
        ),
      ),
    );
  }
}
