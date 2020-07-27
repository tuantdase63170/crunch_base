import 'package:crunch_base/model/company.dart';
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

  String name;
  String foundedDate;
  int locationId;
  String founder;
  String numberOfEmployees;
  String aka;
  String legalName;
  String description;
  int creatorId;
  String phone;
  String email;

  void _create() {
    Company company = new Company();
    company.name = name;
    company.foundedDate = null;
    company.locationId = null;
    company.founder = null;
    company.operatingStatus = null;
    company.numberOfEmployees = null;
    company.aka= null;
    company.legalName = null;
    company.investmentStages = null;
    company.description = null;
    company.preFundingStockValue = null;
    company.postFundingStockValue = null;
    company.lastFundingTypeId = null;
    company.creatorId = null;
    company.phone = null;
    company.email = null;
    company.isApproved = null;
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
                                          foundedDate = text;
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
                                          locationId = int.tryParse(text);
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
                                          numberOfEmployees = text;
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
                                          legalName = text;
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
                                          description = text;
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
