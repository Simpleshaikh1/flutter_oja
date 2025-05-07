import 'package:flutter/material.dart';
import 'package:oja/screens/change_password_screen.dart';
import 'package:oja/screens/edit_birthday_screen.dart';
import 'package:oja/screens/edit_email_screen.dart';
import 'package:oja/screens/edit_gender_screen.dart';
import 'package:oja/screens/edit_name_screen.dart';
import 'package:oja/screens/edit_phone_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileData = {
      'Name': 'John Doe',
      'Gender': 'Male',
      'Birthday': '1990-01-01',
      'Email': 'john.doe@example.com',
      'Phone Number': '+1234567890',
      'Password': '********',
    };

    final fields = [
      {'icon': Icons.male, 'label': 'Gender'},
      {'icon': Icons.cake_outlined, 'label': 'Birthday'},
      {'icon': Icons.email_outlined, 'label': 'Email'},
      {'icon': Icons.phone_android_outlined, 'label': 'Phone Number'},
      {'icon': Icons.lock_outline, 'label': 'Change Password'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Divider(height: 1, thickness: 1),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 16),
              children: [
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const EditNameScreen()),
                  ),
                  child: const Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/profile1.png'),
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('John Doe',
                              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                          SizedBox(height: 17,),
                          Text('@johndoe', style: TextStyle(color: Colors.grey)),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                ...fields.map((field) {
                  final label = field['label'] as String;
                  return ListTile(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) {
                          switch (label) {
                            case 'Gender':
                              return const GenderScreen();
                            case 'Birthday':
                              return const BirthdayScreen();
                            case 'Email':
                              return const EditEmailScreen();
                            case 'Phone Number':
                              return const EditPhoneScreen();
                            case 'Change Password':
                              return const ChangePasswordScreen();
                            default:
                              return const ProfileScreen();
                          }
                        },
                      ),
                    ),
                    minLeadingWidth: 9,
                    leading: Icon(field['icon'] as IconData,
                        color: const Color(0xFF223263), size: 30),
                    title: Text(label,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF223263))),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(profileData[label] ?? '',
                            style: const TextStyle(color: Colors.grey)),
                        const SizedBox(width: 10),
                        const Icon(Icons.arrow_forward_ios,
                            size: 16, color: Colors.grey),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),

    );
  }
}