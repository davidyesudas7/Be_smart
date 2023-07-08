import 'package:be_smart/application/devices/devices_screen.dart';
import 'package:flutter/material.dart';

class CustumAppBar extends StatelessWidget {
  const CustumAppBar({
    super.key,
    this.image,
  });
  final Widget? image;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DevicesScreen()));
            },
            child: Image.asset('lib/icons/icons8-menu-32.png')),
        CircleAvatar(
          backgroundColor: Colors.black,
          child: image,
        )
      ],
    );
  }
}

class UserName extends StatelessWidget {
  const UserName({
    super.key,
    required this.name,
  });
  final String name;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            const Text(
              'welcome home',
              style: TextStyle(
                fontSize: 21,
              ),
            ),
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
          ],
        ),
        SizedBox(
            height: 200,
            width: 180,
            child: Image.asset('lib/icons/house gesign.png')),
      ],
    );
  }
}
