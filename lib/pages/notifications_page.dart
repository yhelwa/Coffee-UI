import 'package:flutter/material.dart';
import '../widgets/constants.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Icon(
          Icons.notifications,
          size: 150,
          color: Colors.grey.shade700,
        )),
        const SizedBox(height: 30),
        Text('No Notifications', style: CoffeeTextStyle.copyWith(fontSize: 45))
      ],
    );
  }
}
