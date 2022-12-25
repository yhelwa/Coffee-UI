import 'package:coffee_ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class CoffeeDrawer extends StatelessWidget {
  const CoffeeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey.shade900,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/coffee.png'),
                  radius: 40,
                ),
                Text(
                  'Youssef Helwa',
                  style: CoffeeTextStyle,
                )
              ],
            ),
            Column(
              children: [
                ListTile(
                  title: Text(
                    'Home',
                    style: CoffeeTextStyle,
                  ),
                  leading: Icon(Icons.home, color: Colors.orange.shade700),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                ListTile(
                  title: Text(
                    'Profile',
                    style: CoffeeTextStyle,
                  ),
                  leading: Icon(Icons.person, color: Colors.orange.shade700),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                ListTile(
                  title: Text(
                    'Notifications',
                    style: CoffeeTextStyle,
                  ),
                  leading: Icon(Icons.settings, color: Colors.orange.shade700),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                ListTile(
                  title: Text(
                    'Settings',
                    style: CoffeeTextStyle,
                  ),
                  leading: Icon(Icons.settings, color: Colors.orange.shade700),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            // Spacer(),
            CustomButton(
                onTapped: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/welcome', (route) => false);
                },
                buttonText: 'Log out'),
            // SizedBox(
            //   height: 30,
            // )
          ],
        ),
      ),
    );
  }
}
