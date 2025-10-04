import 'package:anterin/screens/profile/update_password.dart';
import 'package:anterin/widgets/provider_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:anterin/models/user.dart';
import 'package:anterin/utils/user_preferences.dart';
import 'package:anterin/widgets/profile_widget/profile_widget.dart';
import 'package:anterin/screens/profile/update_profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;
    final buttonMargin = EdgeInsets.symmetric(vertical: 4.0, horizontal: 0.0);

    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: ProfileWidget(
              imagePath: user.imagePath,
              onClicked: () async {},
            ),
          ),
          const SizedBox(height: 24),
          buildName(user),
          const SizedBox(height: 24),
          // Center(child: buildUpdateButton()),
          Container(
            margin: EdgeInsets.only(left: 16.0),
            child: const Text(
              'Preferensi Pengguna',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          ProviderButtonWidget(
            buttonMargin: buttonMargin,
            goRoute: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UpdateProfile()),
            ),
            buttonTitle: 'Edit Profil Anda',
            iconName: Icons.person_2_outlined,
          ),
          ProviderButtonWidget(
            buttonMargin: buttonMargin,
            goRoute: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UpdatePassword()),
            ),
            buttonTitle: 'Ubah Password Anda',
            iconName: Icons.security_outlined,
          ),
          Container(
            margin: EdgeInsets.only(left: 16.0),
            child: const Text(
              'Pengaturan Aplikasi',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          ProviderButtonWidget(
            buttonMargin: buttonMargin,
            goRoute: () => Placeholder(),
            buttonTitle: 'Tema Aplikasi ',
            iconName: Icons.person_2_outlined,
          ),
          ProviderButtonWidget(
            buttonMargin: buttonMargin,
            goRoute: () => Placeholder(),
            buttonTitle: 'Aksesibilitas',
            iconName: Icons.accessibility_outlined,
          ),
          ProviderButtonWidget(
            buttonMargin: buttonMargin,
            goRoute: () => Placeholder(),
            buttonTitle: 'Bahasa',
            iconName: Icons.language_outlined,
          ),
          // const SizedBox(height: 24),
          // const SizedBox(height: 48),
          // buildAbout(user),
        ],
      ),
    );
  }

  Widget buildName(User user) => Column(
    children: [
      Text(
        user.name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
      const SizedBox(height: 4),
      Text(user.email, style: TextStyle(color: Colors.black)),
      Text(user.no, style: TextStyle(color: Colors.black)),
    ],
  );

  Widget buildAbout(User user) => Container(
    padding: EdgeInsets.symmetric(horizontal: 48),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Text(user.about, style: TextStyle(fontSize: 16, height: 1.4)),
      ],
    ),
  );
}
