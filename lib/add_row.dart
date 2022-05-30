import 'package:attendance_app/constants.dart';
import 'package:flutter/material.dart';

class PopupView extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<PopupView> {
  final _formKey = GlobalKey<FormState>();
  ScrollController scrollController = ScrollController();
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ButtonTheme(
        minWidth: 90,
        height: 40,
        child: RaisedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: bgColor,
                    content: Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        controller: scrollController,
                        child: Column(
                          children: <Widget>[
                            Form(
                              key: _formKey,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                controller: controller,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Row(
                                      children: [
                                        Expanded(
                                          child: TextFormPopup(
                                            labelText: 'PoiId',
                                          ),
                                        ),
                                        Expanded(
                                          child: TextFormPopup(
                                            labelText: 'PoiType',
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: TextFormPopup(
                                            labelText: 'Name',
                                          ),
                                        ),
                                        Expanded(
                                          child: TextFormPopup(
                                            labelText: 'Union',
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: TextFormPopup(
                                            labelText: 'Thana',
                                          ),
                                        ),
                                        Expanded(
                                          child: TextFormPopup(
                                            labelText: 'District',
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: TextFormPopup(
                                            labelText: 'Division',
                                          ),
                                        ),
                                        Expanded(
                                          child: TextFormPopup(
                                            labelText: 'Market',
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: TextFormPopup(
                                            labelText: 'Territory',
                                          ),
                                        ),
                                        Expanded(
                                          child: TextFormPopup(
                                            labelText: 'Area',
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: TextFormPopup(
                                            labelText: 'Region',
                                          ),
                                        ),
                                        Expanded(
                                          child: TextFormPopup(
                                            labelText: 'zone',
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: TextFormPopup(
                                            labelText: 'latLong',
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: RaisedButton(
                                            color: primaryColor,
                                            child: Text(
                                              "Submit",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            onPressed: () {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                _formKey.currentState!.save();
                                              }
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          width: 14,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: RaisedButton(
                                            color: Colors.red,
                                            child: Text(
                                              "Cancel",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          },
          child: Text(
            " + Add Row",
            style: TextStyle(fontSize: 15),
          ),
        ),
      ),
    );
  }
}

class TextFormPopup extends StatelessWidget {
  final String? labelText;

  const TextFormPopup({Key? key, this.labelText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          labelStyle: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
