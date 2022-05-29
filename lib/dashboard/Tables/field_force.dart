import 'package:attendance_app/constants.dart';
import 'package:attendance_app/dummy.dart';
import 'package:attendance_app/edit_row.dart';
import 'package:flutter/material.dart';

class FieldForceData extends StatefulWidget {
  @override
  State<FieldForceData> createState() => _FieldForceDataState();
}

class _FieldForceDataState extends State<FieldForceData> {
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
            // header: Text("Field Force"),
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
        "Employee ID",
        style: Theme.of(context).textTheme.subtitle2,
      )),
      DataColumn(
          label: Text(
        "Name",
        style: Theme.of(context).textTheme.subtitle2,
      )),
      DataColumn(
          label: Text(
        "Designation",
        style: Theme.of(context).textTheme.subtitle2,
      )),
      DataColumn(
          label: Text(
        "Mobile Number",
        style: Theme.of(context).textTheme.subtitle2,
      )),
      DataColumn(
          label: Text(
        "E-mail",
        style: Theme.of(context).textTheme.subtitle2,
      )),
      DataColumn(
          label: Text(
        "Restrict POI user",
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
      DataCell(Center(child: Text(demoRecentFiles[index].cid))),
      DataCell(Center(child: Text(demoRecentFiles[index].poiId))),
      DataCell(Center(child: Text('${demoRecentFiles[index].name}'))),
      DataCell(Center(child: Text('${demoRecentFiles[index].poiType}'))),
      DataCell(Center(child: Text('${demoRecentFiles[index].union}'))),
      DataCell(Center(child: Text('${demoRecentFiles[index].thana}'))),
      DataCell(Center(child: Text('${demoRecentFiles[index].district}'))),
      DataCell(Center(
        child: Row(
          children: [
            EditView(),
            IconButton(
                onPressed: () {
                  print("Delete");
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                )),
          ],
        ),
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
