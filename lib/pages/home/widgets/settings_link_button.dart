import 'package:flutter/material.dart';

// FIXME
import '../../settings/settings_page.dart';

class SettingsLinkButton extends StatelessWidget {
  const SettingsLinkButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.settings),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) {
            return const SettingsPage();
          },
        ));
      },
    );
  }
}
