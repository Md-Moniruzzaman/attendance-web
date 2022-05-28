import 'package:attendance_app/dashboard/dashboard_screen.dart';
import 'package:attendance_app/dashboard/side_menu.dart';
import 'package:attendance_app/responsive.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String which_button = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: Responsive.isMobile(context)?
      // AppBar()
      // appBar: AppBar(title: Text("Hello")),
      // drawer: Drawer(
      //   child: SideMenu(),
      // ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(Responsive.isDesktop(context))
          Expanded(
            child: Container(
              child: SideMenu(
                setString: (String value) {
                  setState(() {
                    which_button = value;
                  });
                },
              ),
            ),
          ),
          Expanded(flex: 5, child: DashboardScreen(which_button: which_button))
        ],
      ),
    );
  }
}
