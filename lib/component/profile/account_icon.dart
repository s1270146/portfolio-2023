import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AccountIcon extends StatelessWidget {
  const AccountIcon({
    super.key,
    required this.imagePath,
    required this.radius,
    required this.accountPath,
  });
  final String imagePath;
  final double radius;
  final String accountPath;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          launchUrl(Uri.parse(accountPath));
        },
        child: Container(
          margin: const EdgeInsets.all(3),
          child: CircleAvatar(
            radius: radius,
            backgroundImage: AssetImage(imagePath),
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
