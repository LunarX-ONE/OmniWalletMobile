/// Settings page.
/// [author] Kevin Zhang
/// [time] 2019-3-25

import 'package:flutter/material.dart';
import 'package:wallet_app/l10n/WalletLocalizations.dart';

class Settings extends StatefulWidget {
  static String tag = "Settings";

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(WalletLocalizations.of(context).settingsPageTitle),
      ),

      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(WalletLocalizations.of(context).settingsPageItem_1_Title),
                Text(
                  'English',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Icon(
                  Icons.chevron_right, 
                  color: Colors.grey,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}