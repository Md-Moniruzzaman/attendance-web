import 'package:attendance_app/constants.dart';
import 'package:flutter/material.dart';

class PopupView extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<PopupView> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: bgColor,
                  content: Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: Stack(
                      overflow: Overflow.visible,
                      children: <Widget>[
                        Positioned(
                          right: -40.0,
                          top: -40.0,
                          child: InkResponse(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: CircleAvatar(
                              child: Icon(Icons.close),
                              backgroundColor: Colors.red,
                            ),
                          ),
                        ),
                        Form(
                          key: _formKey,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                TextFormPopup(
                                  labelText: 'PoiId',
                                ),
                                TextFormPopup(
                                  labelText: 'Name',
                                ),
                                TextFormPopup(
                                  labelText: 'PoiType',
                                ),
                                TextFormPopup(
                                  labelText: 'Union',
                                ),
                                TextFormPopup(
                                  labelText: 'Thana',
                                ),
                                TextFormPopup(
                                  labelText: 'District',
                                ),
                                TextFormPopup(
                                  labelText: 'Division',
                                ),
                                TextFormPopup(
                                  labelText: 'Market',
                                ),
                                TextFormPopup(
                                  labelText: 'Territory',
                                ),
                                TextFormPopup(
                                  labelText: 'Area',
                                ),
                                TextFormPopup(
                                  labelText: 'Region',
                                ),
                                TextFormPopup(
                                  labelText: 'zone',
                                ),
                                TextFormPopup(
                                  labelText: 'latLong',
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: RaisedButton(
                                    color: primaryColor,
                                    child: Text(
                                      "Submit",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        _formKey.currentState!.save();
                                      }
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
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
    );
  }
}

class TextFormPopup extends StatelessWidget {
  final String? labelText;

  const TextFormPopup({Key? key, this.labelText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: Colors.white54,
        ),
      ),
    );
  }
}
