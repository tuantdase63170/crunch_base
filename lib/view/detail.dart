
import 'package:crunch_base/model/company.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DetailScreen extends StatefulWidget {
  final int id;

  DetailScreen({this.id}) : super();

  @override
  State<StatefulWidget> createState() {
    return _DetailScreenState();
  }
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: fetchCompanyById(http.Client(), widget.id),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          return snapshot.hasData
              ? CompanyDetail(company: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class CompanyDetail extends StatefulWidget {
  final Company company;

  CompanyDetail({Key key, this.company}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CompanyDetailState();
  }
}

class CompanyData extends StatelessWidget {
  static TextStyle _companyIdStyle() {
    return TextStyle(color: Colors.white, fontSize: 36);
  }

  static TextStyle _companyDataStyle() {
    return TextStyle(color: Colors.white, fontSize: 18);
  }

  final Company company;

  CompanyData({Key, key, this.company}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return ListView.builder(
      itemBuilder: (context, index) {
        return GestureDetector(
            child: SingleChildScrollView(
                child: Container(
          color: Color.fromRGBO(0, 0, 80, 100),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: deviceWidth,
                    child: Text(
                        company.id == null
                            ? "None"
                            : "Company ID-" + company.id.toString(),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.fade,
                        style: _companyIdStyle()),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    width: deviceWidth,
                    padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: Text(
                        company.name == null
                            ? "Company's name: None"
                            : "Company's name: " + company.name.toString(),
                        overflow: TextOverflow.fade,
                        style: _companyDataStyle()),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    width: deviceWidth,
                    padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 20),
                    child: Text(
                        company.foundedDate == null
                            ? "Founded date: None"
                            : "Founded date: " +
                                company.foundedDate.toString().substring(0, 10),
                        overflow: TextOverflow.fade,
                        style: _companyDataStyle()),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    width: deviceWidth,
                    padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 20),
                    child: Text(
                        company.locationId == null
                            ? "Location id: None"
                            : "Location id: " + company.locationId.toString(),
                        overflow: TextOverflow.fade,
                        style: _companyDataStyle()),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    width: deviceWidth,
                    padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 20),
                    child: Text(
                        company.founder == null
                            ? "Founder: None"
                            : "Founder: " + company.founder.toString(),
                        overflow: TextOverflow.fade,
                        style: _companyDataStyle()),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    width: deviceWidth,
                    padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 20),
                    child: Text(
                        company.operatingStatus == true
                            ? "Operating status: On going"
                            : "Operating status: Closed",
                        overflow: TextOverflow.fade,
                        style: _companyDataStyle()),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    width: deviceWidth,
                    padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 20),
                    child: Text(
                        company.numberOfEmployees == null
                            ? "Number of employees: None"
                            : "Number of employees: " +
                                company.numberOfEmployees.toString(),
                        overflow: TextOverflow.fade,
                        style: _companyDataStyle()),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    width: deviceWidth,
                    padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 20),
                    child: Text(
                        company.aka == null
                            ? "Aka: None"
                            : "Aka: " + company.aka.toString(),
                        overflow: TextOverflow.fade,
                        style: _companyDataStyle()),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    width: deviceWidth,
                    padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 20),
                    child: Text(
                        company.legalName == null
                            ? "Legal name: None"
                            : "Legal name: " + company.legalName.toString(),
                        overflow: TextOverflow.fade,
                        style: _companyDataStyle()),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    width: deviceWidth,
                    padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 20),
                    child: Text(
                        company.investmentStages == null
                            ? "Investment stages: None"
                            : "Investment stages: " +
                                company.investmentStages.toString(),
                        overflow: TextOverflow.fade,
                        style: _companyDataStyle()),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    width: deviceWidth,
                    padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 20),
                    child: Text(
                        company.description == null
                            ? "Description: None"
                            : "Description: " + company.description.toString(),
                        overflow: TextOverflow.fade,
                        style: _companyDataStyle()),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    width: deviceWidth,
                    padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 20),
                    child: Text(
                        company.preFundingStockValue == null
                            ? "Pre-funding stock value: None"
                            : "Pre-funding stock value: " +
                                company.preFundingStockValue.toString(),
                        overflow: TextOverflow.fade,
                        style: _companyDataStyle()),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    width: deviceWidth,
                    padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 20),
                    child: Text(
                        company.postFundingStockValue == null
                            ? "Post-funding stock value: None"
                            : "Post-funding stock value: " +
                                company.postFundingStockValue.toString(),
                        overflow: TextOverflow.fade,
                        style: _companyDataStyle()),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    width: deviceWidth,
                    padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 20),
                    child: Text(
                        company.creatorId == null
                            ? "Creator id: None"
                            : "Creator id: " + company.creatorId.toString(),
                        overflow: TextOverflow.fade,
                        style: _companyDataStyle()),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    width: deviceWidth,
                    padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 20),
                    child: Text(
                        company.phone == null
                            ? "Phone: None"
                            : "Phone: " + company.phone.toString(),
                        overflow: TextOverflow.fade,
                        style: _companyDataStyle()),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    width: deviceWidth,
                    padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 20),
                    child: Text(
                        company.email == null
                            ? "E-mail: None"
                            : "E-mail: " + company.email.toString(),
                        overflow: TextOverflow.fade,
                        style: _companyDataStyle()),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    width: deviceWidth,
                    padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 20),
                    child: Text(
                        company.isApproved == 0
                            ? "Is approved: False"
                            : "Is approved: True",
                        overflow: TextOverflow.fade,
                        style: _companyDataStyle()),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    width: deviceWidth,
                    padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 20),
                    child: Text(
                        company.industryList.length == 0
                            ? "Industries: Empty"
                            : "Industries: " + company.industryList.toString(),
                        overflow: TextOverflow.fade,
                        style: _companyDataStyle()),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    width: deviceWidth,
                    padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 20),
                    child: Text(
                        company.investment.length == 0
                            ? "Investments: Empty"
                            : "Investments: " + company.investment.toString(),
                        overflow: TextOverflow.fade,
                        style: _companyDataStyle()),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    width: deviceWidth,
                    padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 20),
                    child: Text(
                        company.stockHeld.length == 0
                            ? "Stocks held: Empty"
                            : "Stocks held: " + company.stockHeld.toString(),
                        overflow: TextOverflow.fade,
                        style: _companyDataStyle()),
                  )
                ],
              ),
            ],
          ),
        )));
      },
      itemCount: 1,
    );
  }
}

class _CompanyDetailState extends State<CompanyDetail> {
  static TextStyle _tableItemTextStyle() {
    return TextStyle(color: Colors.black, fontSize: 14);
  }

  Company company = new Company();
  bool isLoadedCompany = false;

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double height = 50;
    if (isLoadedCompany == false) {
      setState(() {
        this.company = Company.fromCompany(widget.company);
        this.isLoadedCompany = true;
      });
    }
    return Scaffold(
        body: FutureBuilder(
            future: fetchCompanyById(http.Client(), widget.company.id),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print(snapshot.error);
              }
              return snapshot.hasData
                  ? CompanyData(company: snapshot.data)
                  : Center(child: CircularProgressIndicator());
            }));
  }
}
