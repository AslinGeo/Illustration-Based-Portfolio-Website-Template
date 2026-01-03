import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<void> sendEmailJS({
  required String name,
  required String email,
  required String message,
}) async {
  const String serviceId = 'service_6egheug';
  const String templateId = 'template_heo93oa';
  const String publicKey = 'PzLSoYeQXicY901L8';

  try {
    final response = await http.post(
      Uri.parse('https://api.emailjs.com/api/v1.0/email/send'),
      headers: {
        'origin': 'http://localhost', // Required for web
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': publicKey,
        'template_params': {
          // Make sure these match EXACTLY the variable names in your EmailJS template
          'from_name': name,
          'from_email': email,
          'to_email':
              'aslingeos@gmail.com', // REQUIRED if your template uses it
          'message': message,
        },
      }),
    );

    if (response.statusCode == 200) {
      debugPrint("✅ Email sent successfully!");
      replyEmailJS(email: email, name: name, message: message);
    } else {
      debugPrint(
        "❌ Failed to send email. Status: ${response.statusCode}, Body: ${response.body}",
      );
    }
  } catch (e) {
    debugPrint("❌ Error sending email: $e");
  }
}

Future<void> replyEmailJS({
  required String name,
  required String email,
  required String message,
}) async {
  const String serviceId = 'service_6egheug';
  const String templateId = 'template_52n6zo9';
  const String publicKey = 'PzLSoYeQXicY901L8';

  try {
    final response = await http.post(
      Uri.parse('https://api.emailjs.com/api/v1.0/email/send'),
      headers: {
        'origin': 'http://localhost', // Required for web
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': publicKey,
        'template_params': {
          // Make sure these match EXACTLY the variable names in your EmailJS template
          'from_name': name,
          'from_email': "aslingeos@gmail.com",
          'to_email': email, // REQUIRED if your template uses it
          'message': message,
        },
      }),
    );

    if (response.statusCode == 200) {
      debugPrint("✅ Email sent successfully!");
    } else {
      debugPrint(
        "❌ Failed to send email. Status: ${response.statusCode}, Body: ${response.body}",
      );
    }
  } catch (e) {
    debugPrint("❌ Error sending email: $e");
  }
}
