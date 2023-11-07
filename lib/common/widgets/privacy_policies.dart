import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyPolicies {
  Future<void> _launchURLBrowser() async {
    final Uri url = Uri.parse('https://www.google.com');
    if (!await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  TextButton get privacyPoliciesButton {
    return TextButton(
      onPressed: _launchURLBrowser,
      child: const Text('Políticas de Privacidade', style: TextStyle(color: Colors.white70)),
    );
  }
}
