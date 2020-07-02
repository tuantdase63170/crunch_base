import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CrunchBase',
      home: Scaffold(
          resizeToAvoidBottomPadding: false,
          body: Center(child: MyHomePage(title: 'CrunchBase'))),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static TextStyle _hintSearchTextStyle() {
    return TextStyle(color: Colors.black, fontSize: 18);
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

  static TextStyle _tableItemTextStyle() {
    return TextStyle(color: Colors.black, fontSize: 14);
  }

  List<dataItem> dataList = new List();

  List<dataItem> loadTempData() {
    List<dataItem> dataList = new List();
    dataList.add(new dataItem("Prod 001", "Series A", "1,250", "Bill Gate"));
    dataList.add(new dataItem("Prod 002", "Series A", "1,250", "Bill Gate"));
    dataList.add(new dataItem("Prod 003", "Series B", "1,150", "Bill Gate"));
    dataList.add(new dataItem("Prod 004", "Series B", "1,150", "Bill Gate"));
    dataList.add(new dataItem("Prod 005", "Series B", "1,150", "Bill Gate"));
    dataList.add(new dataItem("Prod 006", "Series C", "1,000", "Bill Gate"));
    dataList.add(new dataItem("Prod 007", "Series C", "1,000", "Bill Gate"));
    dataList.add(new dataItem("Prod 008", "Series C", "1,000", "Bill Gate"));
    dataList.add(new dataItem("Prod 009", "Series C", "1,000", "Bill Gate"));
    dataList.add(new dataItem("Prod 010", "Series C", "1,000", "Bill Gate"));
    return dataList;
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery
        .of(context)
        .size
        .width;

    dataList = loadTempData();

    Widget dataWidget(List<dataItem> dataList) {
      return new Column(children: dataList.map((item) =>
      new Row(children: [
        Column(children: [
          Container(
              height: 40,
              alignment: Alignment.center,
              width: deviceWidth * 0.26,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12, width: 1)),
              child: Text(item.organization,
                  style: _tableColumnTextStyle(),
                  textAlign: TextAlign.center))
        ]),
        Column(children: [
          Container(
              height: 40,
              alignment: Alignment.center,
              width: deviceWidth * 0.18,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12, width: 1)),
              child: Text(item.type,
                  style: _tableColumnTextStyle(),
                  textAlign: TextAlign.center))
        ]),
        Column(children: [
          Container(
              height: 40,
              alignment: Alignment.center,
              width: deviceWidth * 0.20,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12, width: 1)),
              child: Text(item.moneyRaised,
                  style: _tableColumnTextStyle(),
                  textAlign: TextAlign.center))
        ]),
        Column(
          children: [
            Container(
                height: 40,
                alignment: Alignment.center,
                width: deviceWidth * 0.36,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12, width: 1)),
                child: Text(item.leadInvestor,
                    style: _tableColumnTextStyle(),
                    textAlign: TextAlign.center))
          ],
        )
      ])).toList());
    };

    return Scaffold(
        body: Container(
            child: SingleChildScrollView(
                child: Column(children: [
                  Container(
                      color: Colors.blueGrey,
                      height: 68,
                      width: deviceWidth,
                      child: Row(children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(icon: Icon(Icons.home), iconSize: 40)
                            ]),
                        Container(
                            margin: EdgeInsets.fromLTRB(
                                deviceWidth * 0.25 / 1.2 - 40 * 2,
                                10, deviceWidth * 0.25 / 1.2 - 40 * 2, 10),
                            color: Colors.white,
                            child: Row(children: [
                              Column(children: [
                                IconButton(
                                    icon: Icon(Icons.search), iconSize: 20)
                              ]),
                              Column(children: [
                                Container(
                                    width: deviceWidth * 0.6,
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 0, 40, 0),
                                    child: TextField(
                                        decoration: InputDecoration.collapsed(
                                            hintStyle: _hintSearchTextStyle(),
                                            hintText: 'Search CrunchBase'),
                                        textAlign: TextAlign.center))
                              ])
                            ]))
                      ])),
                  Container(
                      width: deviceWidth,
                      color: Color.fromRGBO(0, 0, 80, 100),
                      child: Column(children: [
                        Row(children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
                            width: deviceWidth,
                            child: Text(
                                'Discover innovation companies and the people behind them',
                                textAlign: TextAlign.left,
                                style: _mainTitleTextStyle(),
                                overflow: TextOverflow.visible),
                          )
                        ]),
                        Row(children: [
                          Container(
                              padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
                              child: Text(
                                  'Select one or more filters to start your search',
                                  textAlign: TextAlign.left,
                                  style: _actionTitleTextStyle()))
                        ]),
                        Container(
                          width: deviceWidth * 0.75,
                          color: Colors.white,
                          margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Row(children: [
                            Column(children: [
                              IconButton(
                                  icon: Icon(Icons.location_on), iconSize: 24)
                            ]),
                            Column(children: [
                              Container(
                                  padding: const EdgeInsets.fromLTRB(
                                      10, 0, 34, 0),
                                  width: deviceWidth * 0.6,
                                  child: TextField(
                                      decoration:
                                      InputDecoration.collapsed(
                                          hintText: 'Location')))
                            ])
                          ]),
                        ),
                        Container(
                            width: deviceWidth * 0.75,
                            color: Colors.white,
                            margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child: Row(children: [
                              Column(children: [
                                IconButton(icon: Icon(Icons.location_city),
                                    iconSize: 24)
                              ]),
                              Column(children: [
                                Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        10, 0, 34, 0),
                                    width: deviceWidth * 0.6,
                                    child: TextField(
                                        decoration: InputDecoration.collapsed(
                                            hintText: 'Industries')))
                              ])
                            ])),
                        Container(
                          width: deviceWidth * 0.75,
                          color: Colors.white,
                          margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Row(children: [
                            Column(children: [
                              IconButton(
                                  icon: Icon(Icons.attach_money), iconSize: 24)
                            ]),
                            Column(children: [
                              Container(
                                  padding: const EdgeInsets.fromLTRB(
                                      10, 0, 34, 0),
                                  width: deviceWidth * 0.6,
                                  child: TextField(
                                      decoration: InputDecoration.collapsed(
                                          hintText: 'Total Funding Amount')))
                            ])
                          ]),
                        ),
                        Container(
                          width: deviceWidth * 0.75,
                          color: Colors.white,
                          margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                          child: Row(children: [
                            Column(children: [
                              IconButton(
                                  icon: Icon(Icons.date_range), iconSize: 24)
                            ]),
                            Column(children: [
                              Container(
                                  padding: const EdgeInsets.fromLTRB(
                                      10, 0, 34, 0),
                                  width: deviceWidth * 0.6,
                                  child: TextField(
                                      decoration: InputDecoration.collapsed(
                                          hintText: 'Last Funding Date')))
                            ])
                          ]),
                        ),
                        Container(
                            margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            color: Colors.greenAccent,
                            width: deviceWidth * 0.75,
                            height: 26,
                            child: FlatButton(
                                child:
                                Text('Search Now',
                                    style: _searchButtonTextStyle()))),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          color: Colors.white,
                          width: deviceWidth,
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child:
                          Text('Features Funding Round',
                              style: _breakLineTextStyle()),
                        )
                      ])),
                  Container(
                      width: deviceWidth,
                      color: Colors.black12,
                      child: Row(children: [
                        Column(children: [
                          Container(
                              height: 40,
                              alignment: Alignment.center,
                              width: deviceWidth * 0.26,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black12, width: 1)),
                              child: Text('Organization',
                                  style: _tableColumnTextStyle(),
                                  textAlign: TextAlign.center))
                        ]),
                        Column(children: [
                          Container(
                              height: 40,
                              alignment: Alignment.center,
                              width: deviceWidth * 0.18,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black12, width: 1)),
                              child: Text('Type',
                                  style: _tableColumnTextStyle(),
                                  textAlign: TextAlign.center))
                        ]),
                        Column(children: [
                          Container(
                              height: 40,
                              alignment: Alignment.center,
                              width: deviceWidth * 0.20,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black12, width: 1)),
                              child: Text('Money Raised',
                                  style: _tableColumnTextStyle(),
                                  textAlign: TextAlign.center))
                        ]),
                        Column(
                          children: [
                            Container(
                                height: 40,
                                alignment: Alignment.center,
                                width: deviceWidth * 0.36,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black12, width: 1)),
                                child: Text('Lead Investor',
                                    style: _tableColumnTextStyle(),
                                    textAlign: TextAlign.center))
                          ],
                        )
                      ])),
                  Container(
                      width: deviceWidth,
                      color: Colors.white,
                      child: SingleChildScrollView(
                        child: dataWidget(dataList),
                      ))
                ]))));
  }
}

class dataItem {
  String organization, type, moneyRaised, leadInvestor;
  dataItem(this.organization, this.type, this.moneyRaised, this.leadInvestor);
}
