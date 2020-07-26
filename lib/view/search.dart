import 'package:crunch_base/model/company.dart';
import 'package:crunch_base/view/create.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'detail.dart';

class CompanyList extends StatelessWidget {
  static TextStyle _tableItemTextStyle() {
    return TextStyle(color: Colors.black, fontSize: 14);
  }

  final List<Company> companies;

  CompanyList({Key, key, this.companies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery
        .of(context)
        .size
        .width;
    double height = 50;
    return ListView.builder(
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Container(
            child: Row(
              children: [
                Column(children: [
                  Container(
                      alignment: Alignment.center,
                      width: deviceWidth * 0.24,
                      height: height,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12, width: 1)),
                      child: Text(companies[index].name,
                          style: _tableItemTextStyle(),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis))
                ]),
                Column(children: [
                  Container(
                      alignment: Alignment.center,
                      width: deviceWidth * 0.28,
                      height: height,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12, width: 1)),
                      child: Text(companies[index].founder,
                          style: _tableItemTextStyle(),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis))
                ]),
                Column(children: [
                  Container(
                      alignment: Alignment.center,
                      width: deviceWidth * 0.16,
                      height: height,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12, width: 1)),
                      child: Text(companies[index].investmentStages.toString(),
                          style: _tableItemTextStyle(),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis))
                ]),
                Column(
                  children: [
                    Container(
                        alignment: Alignment.center,
                        width: deviceWidth * 0.32,
                        height: height,
                        decoration: BoxDecoration(
                            border:
                            Border.all(color: Colors.black12, width: 1)),
                        child: Text(companies[index].description,
                            style: _tableItemTextStyle(),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis))
                  ],
                )
              ],
            ),
          ),
          onTap: () {
            int selected_id = companies[index].id;
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => new DetailScreen(id: selected_id)));
          },
        );
      },
      itemCount: companies.length,
    );
  }
}

class CompanyData extends StatelessWidget {
  static TextStyle _tableItemTextStyle() {
    return TextStyle(color: Colors.black, fontSize: 14);
  }

  final Company companyData;

  CompanyData({Key, key, this.companyData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery
        .of(context)
        .size
        .width;
    double height = 50;
    return ListView.builder(
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Container(
            child: Row(
              children: [
                Column(children: [
                  Container(
                      alignment: Alignment.center,
                      width: deviceWidth * 0.24,
                      height: height,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12, width: 1)),
                      child: Text(companyData.name,
                          style: _tableItemTextStyle(),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis))
                ]),
                Column(children: [
                  Container(
                      alignment: Alignment.center,
                      width: deviceWidth * 0.28,
                      height: height,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12, width: 1)),
                      child: Text(companyData.founder,
                          style: _tableItemTextStyle(),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis))
                ]),
                Column(children: [
                  Container(
                      alignment: Alignment.center,
                      width: deviceWidth * 0.16,
                      height: height,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12, width: 1)),
                      child: Text(companyData.investmentStages.toString(),
                          style: _tableItemTextStyle(),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis))
                ]),
                Column(
                  children: [
                    Container(
                        alignment: Alignment.center,
                        width: deviceWidth * 0.32,
                        height: height,
                        decoration: BoxDecoration(
                            border:
                            Border.all(color: Colors.black12, width: 1)),
                        child: Text(companyData.description,
                            style: _tableItemTextStyle(),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis))
                  ],
                )
              ],
            ),
          ),
          onTap: () {
            int selected_id = companyData.id;
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => new DetailScreen(id: selected_id)));
          },
        );
      },
      itemCount: 1,
    );
  }
}

class SearchScreen extends StatefulWidget {
  SearchScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchString = "";

  static TextStyle _hintSearchTextStyle() {
    return TextStyle(color: Colors.black, fontSize: 20);
  }

  static TextStyle _mainTitleTextStyle() {
    return TextStyle(color: Colors.white, fontSize: 26);
  }

  static TextStyle _actionTitleTextStyle() {
    return TextStyle(color: Colors.white, fontSize: 18);
  }

  static TextStyle _searchButtonTextStyle() {
    return TextStyle(color: Colors.black, fontSize: 20);
  }

  static TextStyle _breakLineTextStyle() {
    return TextStyle(color: Colors.black45, fontSize: 16);
  }

  static TextStyle _tableColumnTextStyle() {
    return TextStyle(color: Colors.black, fontSize: 16);
  }

  FutureBuilder dataList() {
    return FutureBuilder(
        future: fetchCompanyById(http.Client(), int.tryParse(searchString)),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          return snapshot.hasData
              ? CompanyData(companyData: snapshot.data)
              : Center(child: Container());
        });
  }

  FutureBuilder fullList() {
    return FutureBuilder(
        future: (fetchAllCompanies(http.Client())),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          return snapshot.hasData
              ? CompanyList(companies: snapshot.data)
              : Center(child: Container());
        });
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery
        .of(context)
        .size
        .width;
    double deviceHeight = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
          width: deviceWidth,
          child: Column(
            children: <Widget>[
              Container(
                child: Column(children: [
                  Container(
                      color: Colors.blueGrey,
                      width: deviceWidth,
                      height: 70,
                      child: Row(children: [
                        Container(
                            margin: EdgeInsets.fromLTRB(
                                deviceWidth * 0.15, 10, 0, 10),
                            color: Colors.white,
                            width: deviceWidth * 0.7,
                            child: Row(children: [
                              Column(children: [
                                IconButton(
                                  icon: Icon(Icons.search),
                                  iconSize: 25,
                                )
                              ]),
                              Column(children: [
                                Container(
                                    width: deviceWidth * 0.7 - 2 * 48,
                                    child: TextField(
                                      decoration: InputDecoration.collapsed(
                                          hintStyle: _hintSearchTextStyle(),
                                          hintText: 'Search CrunchBase'),
                                      textAlign: TextAlign.center,
                                      style: _searchButtonTextStyle(),
                                      onChanged: (value) {
                                        searchString = value.toString();
                                      },
                                    ))
                              ])
                            ]))
                      ])),
                  Container(
                      width: deviceWidth,
                      height: 130,
                      color: Color.fromRGBO(0, 0, 80, 100),
                      child: Column(children: [
                        Row(children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(
                                deviceWidth * 0.05, 20, deviceWidth * 0.05, 0),
                            width: deviceWidth,
                            child: Text(
                                'Discover innovation companies and the people behind them',
                                textAlign: TextAlign.left,
                                style: _mainTitleTextStyle(),
                                overflow: TextOverflow.visible),
                          )
                        ]),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          color: Colors.white,
                          width: deviceWidth,
                          height: 30,
                          padding: EdgeInsets.fromLTRB(
                              deviceWidth * 0.015, 5, deviceWidth * 0.015, 5),
                          child: Text('Features Funding Round',
                              style: _breakLineTextStyle()),
                        )
                      ])),
                  Container(
                      width: deviceWidth,
                      color: Colors.black12,
                      child: Row(children: [
                        Column(children: [
                          Container(
                              height: 50,
                              alignment: Alignment.center,
                              width: deviceWidth * 0.24,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black12, width: 1)),
                              child: Text('Company',
                                  style: _tableColumnTextStyle(),
                                  textAlign: TextAlign.center))
                        ]),
                        Column(children: [
                          Container(
                              height: 50,
                              alignment: Alignment.center,
                              width: deviceWidth * 0.28,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black12, width: 1)),
                              child: Text('Founder',
                                  style: _tableColumnTextStyle(),
                                  textAlign: TextAlign.center))
                        ]),
                        Column(children: [
                          Container(
                              height: 50,
                              alignment: Alignment.center,
                              width: deviceWidth * 0.16,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black12, width: 1)),
                              child: Text('Stages',
                                  style: _tableColumnTextStyle(),
                                  textAlign: TextAlign.center))
                        ]),
                        Column(
                          children: [
                            Container(
                                height: 50,
                                alignment: Alignment.center,
                                width: deviceWidth * 0.32,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black12, width: 1)),
                                child: Text('Description',
                                    style: _tableColumnTextStyle(),
                                    textAlign: TextAlign.center))
                          ],
                        )
                      ])),
                ]),
              ),
              Container(
                width: deviceWidth,
                color: Colors.white,
                child: SingleChildScrollView(
                    child: Container(
                        height: deviceHeight - 300, child: fullList())),
              ),
              Container(
                width: deviceWidth,
                height: 50,
                color: Colors.blueGrey,
                child: FlatButton(
                  child: Text(
                      "Create new Company",
                    style: _actionTitleTextStyle(),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => new CreateScreen()));
                  },
                ),
              )
            ],
          ),
        ));
  }
}
