
import 'package:crunch_base/model/company.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CreateScreen extends StatefulWidget {
  CreateScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  static TextStyle _pageTitle() {
    return TextStyle(color: Colors.white, fontSize: 26);
  }

  static TextStyle _inputText() {
    return TextStyle(color: Colors.black, fontSize: 18);
  }

  bool loading = false;
  String name;

  void _create() {
    setState(() {
      loading = true;
    });
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        Company company = new Company();
        company.name = name;
        createCompany(http.Client(), company);
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double device_witdh = MediaQuery.of(context).size.width;
    double device_height = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
          children: [
            Row(
              children: [
                Container(
                  width: device_witdh,
                  height: 50,
                  color: Colors.indigo,
                  alignment: Alignment.center,
                  child: Text(
                    "Create",
                    textAlign: TextAlign.center,
                    style: _pageTitle(),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Container(
                    height: device_height - 100,
                    color: Colors.white,
                    child: SingleChildScrollView(
                        child: Container(
                            width: device_witdh,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(
                                          device_witdh * 0.1,
                                          25,
                                          device_witdh * 0.1,
                                          0),
                                      width: device_witdh * 0.8,
                                      height: 75,
                                      alignment: Alignment.center,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          labelText: "Company's name",
                                          fillColor: Colors.white,
                                          border: new OutlineInputBorder(
                                              borderRadius:
                                              new BorderRadius.circular(25),
                                              borderSide: new BorderSide()),
                                        ),
                                        style: _inputText(),
                                        onChanged: (text_name){
                                          name = text_name;
                                        },
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(
                                          device_witdh * 0.1,
                                          25,
                                          device_witdh * 0.1,
                                          0),
                                      width: device_witdh * 0.8,
                                      height: 75,
                                      alignment: Alignment.center,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          labelText: "Founded date",
                                          fillColor: Colors.white,
                                          border: new OutlineInputBorder(
                                              borderRadius:
                                              new BorderRadius.circular(25),
                                              borderSide: new BorderSide()),
                                        ),
                                        style: _inputText(),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(
                                          device_witdh * 0.1,
                                          25,
                                          device_witdh * 0.1,
                                          0),
                                      width: device_witdh * 0.8,
                                      height: 75,
                                      alignment: Alignment.center,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          labelText: "Location ID",
                                          fillColor: Colors.white,
                                          border: new OutlineInputBorder(
                                              borderRadius:
                                              new BorderRadius.circular(25),
                                              borderSide: new BorderSide()),
                                        ),
                                        style: _inputText(),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(
                                          device_witdh * 0.1,
                                          25,
                                          device_witdh * 0.1,
                                          0),
                                      width: device_witdh * 0.8,
                                      height: 75,
                                      alignment: Alignment.center,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          labelText: "Founder",
                                          fillColor: Colors.white,
                                          border: new OutlineInputBorder(
                                              borderRadius:
                                              new BorderRadius.circular(25),
                                              borderSide: new BorderSide()),
                                        ),
                                        style: _inputText(),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(
                                          device_witdh * 0.1,
                                          25,
                                          device_witdh * 0.1,
                                          0),
                                      width: device_witdh * 0.8,
                                      height: 75,
                                      alignment: Alignment.center,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          labelText: "Number of employees",
                                          fillColor: Colors.white,
                                          border: new OutlineInputBorder(
                                              borderRadius:
                                              new BorderRadius.circular(25),
                                              borderSide: new BorderSide()),
                                        ),
                                        style: _inputText(),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(
                                          device_witdh * 0.1,
                                          25,
                                          device_witdh * 0.1,
                                          0),
                                      width: device_witdh * 0.8,
                                      height: 75,
                                      alignment: Alignment.center,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          labelText: "Aka",
                                          fillColor: Colors.white,
                                          border: new OutlineInputBorder(
                                              borderRadius:
                                              new BorderRadius.circular(25),
                                              borderSide: new BorderSide()),
                                        ),
                                        style: _inputText(),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(
                                          device_witdh * 0.1,
                                          25,
                                          device_witdh * 0.1,
                                          0),
                                      width: device_witdh * 0.8,
                                      height: 75,
                                      alignment: Alignment.center,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          labelText: "Legal name",
                                          fillColor: Colors.white,
                                          border: new OutlineInputBorder(
                                              borderRadius:
                                              new BorderRadius.circular(25),
                                              borderSide: new BorderSide()),
                                        ),
                                        style: _inputText(),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(
                                          device_witdh * 0.1,
                                          25,
                                          device_witdh * 0.1,
                                          0),
                                      width: device_witdh * 0.8,
                                      height: 75,
                                      alignment: Alignment.center,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          labelText: "Description",
                                          fillColor: Colors.white,
                                          border: new OutlineInputBorder(
                                              borderRadius:
                                              new BorderRadius.circular(25),
                                              borderSide: new BorderSide()),
                                        ),
                                        style: _inputText(),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(
                                          device_witdh * 0.1,
                                          25,
                                          device_witdh * 0.1,
                                          0),
                                      width: device_witdh * 0.8,
                                      height: 75,
                                      alignment: Alignment.center,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          labelText: "Creator ID",
                                          fillColor: Colors.white,
                                          border: new OutlineInputBorder(
                                              borderRadius:
                                              new BorderRadius.circular(25),
                                              borderSide: new BorderSide()),
                                        ),
                                        style: _inputText(),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(
                                          device_witdh * 0.1,
                                          25,
                                          device_witdh * 0.1,
                                          0),
                                      width: device_witdh * 0.8,
                                      height: 75,
                                      alignment: Alignment.center,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          labelText: "Phone",
                                          fillColor: Colors.white,
                                          border: new OutlineInputBorder(
                                              borderRadius:
                                              new BorderRadius.circular(25),
                                              borderSide: new BorderSide()),
                                        ),
                                        style: _inputText(),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(
                                          device_witdh * 0.1,
                                          25,
                                          device_witdh * 0.1,
                                          25),
                                      width: device_witdh * 0.8,
                                      height: 75,
                                      alignment: Alignment.center,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          labelText: "Email",
                                          fillColor: Colors.white,
                                          border: new OutlineInputBorder(
                                              borderRadius:
                                              new BorderRadius.circular(25),
                                              borderSide: new BorderSide()),
                                        ),
                                        style: _inputText(),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ))))
              ],
            ),
            Row(
              children: [
                Container(
                  width: device_witdh,
                  height: 50,
                  color: Colors.indigo,
                  child: Column(
                    children: [
                      FlatButton(
                        child: Text(
                          "Submit",
                          style: _pageTitle(),
                        ),
                        onPressed: () {
                          _create();
                        },
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ));
  }
}
