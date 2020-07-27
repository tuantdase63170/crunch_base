import 'package:crunch_base/model/company.dart';
import 'package:crunch_base/view/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CreateScreen extends StatefulWidget {
  CreateScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  Company createCompany = new Company();

  static TextStyle _pageTitle() {
    return TextStyle(color: Colors.white, fontSize: 26);
  }

  static TextStyle _inputText() {
    return TextStyle(color: Colors.black, fontSize: 18);
  }

  bool loading = false;
  String name;
  String date;
  int location;
  String founder;
  String noe;
  String aka;
  String legal;
  String desc;
  int creatorId;
  String phone;
  String email;

  void _create() {
    Company company = new Company();
    company.name = name;
    company.foundedDate = date;
    company.locationId = location;
    company.founder = founder;
    company.numberOfEmployees = noe;
    company.aka= aka;
    company.legalName = legal;
    company.description = desc;
    company.creatorId = creatorId;
    company.phone = phone;
    company.email = email;
    insert(company);
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
                                        onChanged: (text) {
                                          name = text;
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
                                        onChanged: (text) {
                                          date = text;
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
                                          labelText: "Location ID",
                                          fillColor: Colors.white,
                                          border: new OutlineInputBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(25),
                                              borderSide: new BorderSide()),
                                        ),
                                        style: _inputText(),
                                        onChanged: (text) {
                                          location = int.tryParse(text);
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
                                          labelText: "Founder",
                                          fillColor: Colors.white,
                                          border: new OutlineInputBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(25),
                                              borderSide: new BorderSide()),
                                        ),
                                        style: _inputText(),
                                        onChanged: (text) {
                                          founder = text;
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
                                          labelText: "Number of employees",
                                          fillColor: Colors.white,
                                          border: new OutlineInputBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(25),
                                              borderSide: new BorderSide()),
                                        ),
                                        style: _inputText(),
                                        onChanged: (text) {
                                          noe = text;
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
                                          labelText: "Aka",
                                          fillColor: Colors.white,
                                          border: new OutlineInputBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(25),
                                              borderSide: new BorderSide()),
                                        ),
                                        style: _inputText(),
                                        onChanged: (text) {
                                          aka = text;
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
                                          labelText: "Legal name",
                                          fillColor: Colors.white,
                                          border: new OutlineInputBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(25),
                                              borderSide: new BorderSide()),
                                        ),
                                        style: _inputText(),
                                        onChanged: (text) {
                                          legal = text;
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
                                          labelText: "Description",
                                          fillColor: Colors.white,
                                          border: new OutlineInputBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(25),
                                              borderSide: new BorderSide()),
                                        ),
                                        style: _inputText(),
                                        onChanged: (text) {
                                          desc = text;
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
                                          labelText: "Creator ID",
                                          fillColor: Colors.white,
                                          border: new OutlineInputBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(25),
                                              borderSide: new BorderSide()),
                                        ),
                                        style: _inputText(),
                                        onChanged: (text) {
                                          creatorId = int.tryParse(text);
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
                                          labelText: "Phone",
                                          fillColor: Colors.white,
                                          border: new OutlineInputBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(25),
                                              borderSide: new BorderSide()),
                                        ),
                                        style: _inputText(),
                                        onChanged: (text) {
                                          phone = text;
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
                                        onChanged: (text) {
                                          email = text;
                                        },
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => new SearchScreen()));
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
