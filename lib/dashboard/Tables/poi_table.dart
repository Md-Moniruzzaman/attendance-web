import 'package:attendance_app/add_row.dart';
import 'package:attendance_app/constants.dart';
import 'package:attendance_app/dummy.dart';
import 'package:attendance_app/edit_row.dart';
import 'package:flutter/material.dart';

class PoiTableData extends StatefulWidget {
  const PoiTableData({
    Key? key,
  }) : super(key: key);

  @override
  State<PoiTableData> createState() => _PoiTableDataState();
}

class _PoiTableDataState extends State<PoiTableData> {
  var tableRow = new TableRow();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Theme(
          data: Theme.of(context).copyWith(
            cardColor: secondaryColor,
            textTheme: TextTheme(
              headline6: TextStyle(color: Colors.white),
              bodyText2: TextStyle(color: Colors.white),
              caption: TextStyle(color: Colors.white),
            ),
          ),
          child: PaginatedDataTable(
            // dragStartBehavior: DragStartBehavior.start,
            // header: Text("Attendance Table"),
            onRowsPerPageChanged: (perPage) {},
            rowsPerPage: 10,
            columns: Datacolumn(context),
            source: tableRow,
            // initialFirstRowIndex: 0,
            // headingRowHeight: 0,
          ),
        ),
      ),
    );
  }

  List<DataColumn> Datacolumn(BuildContext context) {
    return <DataColumn>[
      DataColumn(
          label: Text(
        "CID",
        style: Theme.of(context).textTheme.subtitle2,
      )),
      DataColumn(
          label: Text(
        "POI ID",
        style: Theme.of(context).textTheme.subtitle2,
      )),
      DataColumn(
          label: Text(
        "Name",
        style: Theme.of(context).textTheme.subtitle2,
      )),
      DataColumn(
          label: Text(
        "POI Type",
        style: Theme.of(context).textTheme.subtitle2,
      )),
      DataColumn(
          label: Text(
        "Union",
        style: Theme.of(context).textTheme.subtitle2,
      )),
      DataColumn(
          label: Text(
        "Thana",
        style: Theme.of(context).textTheme.subtitle2,
      )),
      DataColumn(
          label: Text(
        "District",
        style: Theme.of(context).textTheme.subtitle2,
      )),
      DataColumn(
          label: Text(
        "Division",
        style: Theme.of(context).textTheme.subtitle2,
      )),
      DataColumn(
          label: Text(
        "Market",
        style: Theme.of(context).textTheme.subtitle2,
      )),
      DataColumn(
          label: Text(
        "Territory",
        style: Theme.of(context).textTheme.subtitle2,
      )),
      DataColumn(
          label: Text(
        "Area",
        style: Theme.of(context).textTheme.subtitle2,
      )),
      DataColumn(
          label: Text(
        "Region",
        style: Theme.of(context).textTheme.subtitle2,
      )),
      DataColumn(
          label: Text(
        "Zone",
        style: Theme.of(context).textTheme.subtitle2,
      )),
      DataColumn(
          label: Text(
        "Lat & Long",
        style: Theme.of(context).textTheme.subtitle2,
      )),
      DataColumn(
          label: Text(
        "Action",
        style: Theme.of(context).textTheme.subtitle2,
      )),
    ];
  }
}

class TableRow extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text("")),
      DataCell(Text(demoRecentFiles[index].poiId)),
      DataCell(Text('${demoRecentFiles[index].name}')),
      DataCell(Text('${demoRecentFiles[index].poiType}')),
      DataCell(Text('${demoRecentFiles[index].union}')),
      DataCell(Text('${demoRecentFiles[index].thana}')),
      DataCell(Text('${demoRecentFiles[index].district}')),
      DataCell(Text('${demoRecentFiles[index].division}')),
      DataCell(Text('${demoRecentFiles[index].market}')),
      DataCell(Text('${demoRecentFiles[index].territory}')),
      DataCell(Text('${demoRecentFiles[index].area}')),
      DataCell(Text('${demoRecentFiles[index].region}')),
      DataCell(Text('${demoRecentFiles[index].zone}')),
      DataCell(Text('${demoRecentFiles[index].latLong}')),
      DataCell(Row(
        children: [
          EditView(),
          IconButton(
            onPressed: () {
              print("Delete");
            },
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => demoRecentFiles.length.toInt();

  @override
  int get selectedRowCount => 0;
}
