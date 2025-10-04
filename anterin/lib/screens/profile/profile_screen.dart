import 'package:flutter/material.dart';
import 'package:anterin/models/user.dart';
import 'package:anterin/utils/user_preferences.dart';
import 'package:anterin/widgets/profile_widget/button_widget.dart';
import 'package:anterin/widgets/profile_widget/profile_widget.dart';
import 'package:anterin/screens/profile/update_profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(imagePath: user.imagePath, onClicked: () async {}),
          const SizedBox(height: 24),
          buildName(user),
          const SizedBox(height: 24),
          Center(child: buildUpdateButton()),
          const SizedBox(height: 24),
          const SizedBox(height: 48),
          buildAbout(user),
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

  Widget buildUpdateButton() =>
      ButtonWidget(text: 'Edit Profile', onClicked: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UpdateProfile()),
        );});


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
