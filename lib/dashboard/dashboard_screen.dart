import 'package:attendance_app/add_row.dart';
import 'package:attendance_app/batch_upload.dart';
import 'package:attendance_app/dashboard/Tables/attendence_table.dart';
import 'package:attendance_app/dashboard/Tables/field_force.dart';
import 'package:attendance_app/dashboard/Tables/poi_table.dart';
import 'package:attendance_app/dashboard/side_menu.dart';
import 'package:attendance_app/widgets/responsive_login.dart';
import 'package:flutter/material.dart';
import 'package:../attendance_app/constants.dart';

class DashboardScreen extends StatefulWidget {
  String? which_button = '';
  DashboardScreen({Key? key, this.which_button}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    print(widget.which_button);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(defultPadding),
        child: Column(
          children: [
            Header(),
            SizedBox(
              height: defultPadding,
            ),
            Row(
              children: [
                Text(
                  widget.which_button.toString(),
                  style: Theme.of(context).textTheme.headline6,
                ),

                SizedBox(
                  width: 14,
                ),
                PopupView(),
                // ElevatedButton.icon(
                //     onPressed: () {
                //       PopupView();
                //     },
                //     icon: Icon(Icons.add),
                //     label: Text("Add Row")),
                Spacer(),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(100, 40),
                    // maximumSize: const Size(150, 50),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CsvToList(),
                      ),
                    );
                  },
                  icon: Icon(Icons.add),
                  label: Text("Batch Upload"),
                ),

                SizedBox(
                  width: 8,
                ),
                ResponsiveWidget.isSmallScreen(context)
                    ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(100, 40),

                          // maximumSize: const Size(150, 50),
                        ),
                        onPressed: () {},
                        child: Icon(Icons.download),
                      )
                    : ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(100, 40),

                          // maximumSize: const Size(150, 50),
                        ),
                        onPressed: () {},
                        icon: Icon(Icons.download),
                        label: Text("Download"),
                      )
              ],
            ),
            // : Text("Not Attendance"),
            SizedBox(
              height: defultPadding,
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: widget.which_button == "Attendance table"
                    ? AttendenceTableData()
                    : widget.which_button == "Field Force"
                        ? FieldForceData()
                        : PoiTableData(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Header extends StatefulWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    List<String> items = ['POI Id', 'POI type', 'User id'];
    String? selectedItem = 'POI Id';
    return Row(
      children: [
        if (!ResponsiveWidget.isLargeScreen(context))
          IconButton(
            // onPressed: context.read<MenuController>().controlMenu,
            onPressed: () {
              Scaffold.of(context).openDrawer();
              // _scaffoldKey.currentState?.openEndDrawer();
            },
            icon: Icon(Icons.menu),
          ),
        if (ResponsiveWidget.isLargeScreen(context))
          Text(
            "Dashboard",
            style: Theme.of(context).textTheme.headline5,
          ),
        if (!ResponsiveWidget.isSmallScreen(context))
          Spacer(flex: ResponsiveWidget.isLargeScreen(context) ? 2 : 1),
        // if (Responsive.isDesktop(context))
        //   DropdownButton<String>(
        //     value: selectedItem,
        //     items: items
        //         .map(
        //           (item) => DropdownMenuItem<String>(
        //             value: item,
        //             child: Padding(
        //               padding: const EdgeInsets.all(8.0),
        //               child: Text(
        //                 item,
        //                 style: Theme.of(context).textTheme.subtitle2,
        //               ),
        //             ),
        //           ),
        //         )
        //         .toList(),
        //     onChanged: (item) => setState(() => selectedItem = item),
        //   ),
        SizedBox(
          width: 14,
        ),
        Expanded(
          child: SearchField(),
        )
      ],
    );
  }
}

class SearchField extends StatefulWidget {
  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search Field",
        fillColor: secondaryColor,
        filled: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide.none),
        suffixIcon: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          onTap: () {},
          child: Icon(Icons.search),
        ),
      ),
    );
  }
}
// child: Container(
//               padding: EdgeInsets.all(16.0 * 0.75),
//               decoration: BoxDecoration(
//                   color: primaryColor,
//                   borderRadius: BorderRadius.all(Radius.circular(10))),
//               child: Icon(Icons.search),
