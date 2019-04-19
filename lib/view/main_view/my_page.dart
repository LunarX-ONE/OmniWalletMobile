/// My profile page.
/// [author] Kevin Zhang
/// [time] 2019-3-21

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallet_app/l10n/WalletLocalizations.dart';
import 'package:wallet_app/model/global_model.dart';
import 'package:wallet_app/tools/Tools.dart';
import 'package:wallet_app/tools/app_data_setting.dart';
import 'package:wallet_app/view/backupwallet/backup_wallet_index.dart';
import 'package:wallet_app/view/main_view/Help.dart';
import 'package:wallet_app/view/main_view/about.dart';
import 'package:wallet_app/view/main_view/service_terms.dart';
import 'package:wallet_app/view/main_view/settings.dart';
import 'package:wallet_app/view/main_view/user_info.dart';
import 'package:wallet_app/view/main_view/wallet_address_book.dart';

class UserCenter extends StatefulWidget {

  @override
  _UserCenterState createState() => _UserCenterState();
}

class _UserCenterState extends State<UserCenter> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          backgroundColor: Colors.transparent,

          appBar: PreferredSize(
            child: AppBar(
              backgroundColor: Colors.transparent,
              brightness: Brightness.dark,
            ),
            preferredSize: Size.fromHeight(0),
          ),
          
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: 200),
              child: Column(
                children: _buildMenuList(),
              ),
            ),
          ),
        ),

        Image.asset(Tools.imagePath('title_bg2'),
          fit: BoxFit.cover,
          height: 220,
          width: MediaQuery.of(context).size.width,
        ),

        _bannerArea(),
      ],
    );
  }

  // banner area
  Widget _bannerArea() {
    return Container(
      padding: EdgeInsets.only(top: 40),
      height: 220,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // user avatar.
          Material(
            color: Colors.transparent,
            child: Ink.image(
              image: AssetImage('assets/omni-logo.png'),
              fit: BoxFit.cover,
              width: 70,
              height: 70,
              child: InkWell(
                onTap: () { Navigator.of(context).pushNamed(UserInfo.tag); },
                child: null,
              ),
            ),
          ),
          
          SizedBox(height: 10),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () { Navigator.of(context).pushNamed(UserInfo.tag); },
              child: Text(  // user nick name
                GlobalInfo.userInfo.nickname,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Build menu list
  List<Widget> _buildMenuList() {
    // list tile
    List<Widget> _list = List();

    // /* TEMP CODE
    // Icons
    List<Icon> leading_names = <Icon> [
      Icon(Icons.settings),
      Icon(Icons.book),
      Icon(Icons.help),
      Icon(Icons.assignment),
      Icon(Icons.backup),
      Icon(Icons.info),
    ]; 
    // */

    /* TEMP COMMENT
    // Icons
    List<String> leading_names = <String> [
      'icon_set',
      'icon_address',
      'icon_help',
      'icon_service',
      'icon_backup',
      'icon_about',
    ];
    */

    // item content
    List<String> items = <String> [
      WalletLocalizations.of(context).myProfilePageMenu1,
      WalletLocalizations.of(context).myProfilePageMenu2,
      WalletLocalizations.of(context).myProfilePageMenu3,
      WalletLocalizations.of(context).myProfilePageMenu4,
      WalletLocalizations.of(context).myProfilePageMenu5,
      WalletLocalizations.of(context).myProfilePageMenu6,
    ];

    // Page routes
    List<String> routes = <String> [
      Settings.tag, 
      AddressBook.tag, 
      Help.tag, 
      ServiceTerms.tag,
      BackupWalletIndex.tag,
      About.tag,
    ];

    for (int i = 0; i < items.length; i++) {
      _list.add(_menuItem(leading_names[i], items[i], routes[i]));
      _list.add(Divider(height: 0, indent: 15));
    }

    return _list;
  }

  //
  Widget _menuItem(Icon iconName, String item, String route) {
    return Ink(
      color: AppCustomColor.themeBackgroudColor,
      child: ListTile(
        // leading: Image.asset(Tools.imagePath(iconName), width: 20, height: 20),
        leading: iconName,
        title: Text(item),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          if(BackupWalletIndex.tag == route)
          {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (BuildContext context) {
                    return BackupWalletIndex(param: 1,);
                  }
              ),
            );
          }else{
            Navigator.of(context).pushNamed(route);
          }
        },
      ),
    );
  }
}
