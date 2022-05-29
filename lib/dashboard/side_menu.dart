import 'package:attendance_app/constants.dart';
import 'package:attendance_app/dashboard/Tables/attendence_table.dart';
import 'package:attendance_app/dashboard/Tables/poi_table.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SideMenu extends StatefulWidget {
  Function? setString;
  SideMenu({Key? key, this.setString}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: bgColor,
      // backgroundColor: Color(0xffC7CBBA).withOpacity(0.5),
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: secondaryColor,
              // color: Color(0xffC7CBBA).withOpacity(0.5),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    'images/bg.jpg'),  
                  maxRadius: 45,
                ),
                Text(
                  "Company Name[CID]",
                  style: TextStyle(color: Colors.white54),
                )
              ],
            ),
          ),
          DrawListTile(
            setString: widget.setString!,
            title: "POI Table",
            icon: FontAwesomeIcons.addressBook,
          ),
          DrawListTile(
            setString: widget.setString!,
            title: "Field Force",
            icon: FontAwesomeIcons.userGroup,
          ),
          DrawListTile(
            setString: widget.setString!,
            title: "Attendance table",
            icon: FontAwesomeIcons.house,
          ),
        ],
      ),
    );
  }
}

class DrawListTile extends StatelessWidget {
  final String title;
  final IconData? icon;
  Function setString;

  DrawListTile({
    Key? key,
    required this.title,
    this.icon,
    required this.setString,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white54,
          ),
        ),
        onTap: () {
          title == "POI Table"
              ? setString("POI Table")
              : title == "Field Force"
                  ? setString("Field Force")
                  : setString("Attendance table");
        },
        leading: Icon(icon, size: 18, color: Colors.white54),
        horizontalTitleGap: 0.0,
      ),
    );
  }
}
