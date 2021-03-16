import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:therapie_clinic/constant.dart';
import 'package:therapie_clinic/screens/booking_screen.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  bool _isAsyncCall = false;

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: ModalProgressHUD(
        inAsyncCall: _isAsyncCall,
        child: ListView(
          padding: EdgeInsets.all(0.0),
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                'XYZ User',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text('xyz@example.com'),
              decoration: BoxDecoration(
                color: kAppColor,
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: kWhiteColor,
                child: SvgPicture.asset(
                  'assets/icons/profile.svg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: kTitleTextColor,
              ),
              title: Text(
                'Profile',
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.info,
                color: kTitleTextColor,
              ),
              title: Text(
                'About Us',
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.calendar_today_rounded,
                color: kTitleTextColor,
              ),
              title: Text(
                'My Bookings',
              ),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyBookings(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.share,
                color: kTitleTextColor,
              ),
              title: Text(
                'Share',
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: kTitleTextColor,
              ),
              title: Text(
                'Logout',
              ),
              onTap: () {
                _exitApp(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  _exitApp(BuildContext context) {
    return showDialog(
      builder: (context) => AlertDialog(
        title: Text('Do you want to exit this application?'),
        content: Text('We hate to see you leave...'),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              print("you choose no");
              Navigator.of(context).pop(false);
            },
            child: Text('No'),
          ),
          FlatButton(
            onPressed: () {
              SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            },
            child: Text('Yes'),
          ),
        ],
      ),
      context: context,
    );
  }
}
