import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'package:crunch_base/model/stock.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'industry.dart';
import 'investment.dart';

class Company {
  int id;
  String name;
  String foundedDate;
  int locationId;
  String founder;
  bool operatingStatus;
  String numberOfEmployees;
  String aka;
  String legalName;
  int investmentStages;
  String description;
  double preFundingStockValue;
  double postFundingStockValue;
  String lastFundingTypeId;
  int creatorId;
  String phone;
  String email;
  bool isApproved;
  List<Industry> industryList;
  List<Investment> investment;
  List<Stock> stockHeld;

  Company(
      {this.id,
      this.name,
      this.foundedDate,
      this.locationId,
      this.founder,
      this.operatingStatus,
      this.numberOfEmployees,
      this.aka,
      this.legalName,
      this.investmentStages,
      this.description,
      this.preFundingStockValue,
      this.postFundingStockValue,
      this.lastFundingTypeId,
      this.creatorId,
      this.phone,
      this.email,
      this.isApproved,
      this.industryList,
      this.investment,
      this.stockHeld});

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
        id: json['id'],
        name: json['name'],
        foundedDate: json['foundedDate'],
        locationId: json['locationId'],
        founder: json['founder'],
        operatingStatus: json['operatingStatus'],
        numberOfEmployees: json['numberOfEmployees'],
        aka: json['aka'],
        legalName: json['legalName'],
        investmentStages: json['investmentStages'],
        description: json['description'],
        preFundingStockValue: json['preFundingStockValue'] == null
            ? json['preFundingStockValue']
            : 0,
        postFundingStockValue: json['postFundingStockValue'] == null
            ? json['postFundingStockValue']
            : 0,
        lastFundingTypeId: json['lastFundingTypeId'],
        creatorId: json['creatorId'],
        phone: json['phone'],
        email: json['email'],
        isApproved: json['isApproved'],
        industryList:
            List<Industry>.from(json["industryList"].map((x) => x.toObject())),
        investment:
            List<Investment>.from(json["investment"].map((x) => x.toObject())),
        stockHeld:
            List<Stock>.from(json["investment"].map((x) => x.toObject())));
  }

  factory Company.fromCompany(Company temp) {
    return Company(
        id: temp.id,
        name: temp.name,
        foundedDate: temp.foundedDate,
        locationId: temp.locationId,
        founder: temp.founder,
        operatingStatus: temp.operatingStatus,
        numberOfEmployees: temp.numberOfEmployees,
        aka: temp.aka,
        legalName: temp.legalName,
        investmentStages: temp.investmentStages,
        description: temp.description,
        preFundingStockValue: temp.preFundingStockValue,
        postFundingStockValue: temp.postFundingStockValue,
        lastFundingTypeId: temp.lastFundingTypeId,
        creatorId: temp.creatorId,
        phone: temp.phone,
        email: temp.email,
        isApproved: temp.isApproved,
        industryList: temp.industryList,
        investment: temp.investment,
        stockHeld: temp.stockHeld);
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'foundedDate': foundedDate,
      'locationId': locationId,
      'founder': founder,
      'operatingStatus': true,
      'aka': aka,
      'legalName': legalName,
      'description': description,
      'preFundingStockValue': null,
      'postFundingStockValue': null,
      'lastFundingTypeId': null,
      'creatorId': 1,
      'phone': phone,
      'email': email,
      'isApproved': false
    };
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['foundedDate'] = this.foundedDate;
    data['locationId'] = this.locationId;
    data['founder'] = this.founder;
    data['operatingStatus'] = true;
    data['numberOfEmployees'] = this.numberOfEmployees;
    data['aka'] = this.aka;
    data['legalName'] = this.legalName;
    data['investmentStages'] = 0;
    data['description'] = null;
    data['preFundingStockValue'] = 0;
    data['postFundingStockValue'] = 0;
    data['lastFundingTypeId'] = null;
    data['creatorId'] = this.creatorId;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['isApproved'] = false;
    return data;
  }
}

List<Company> parseCompany(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Company>((json) => Company.fromJson(json)).toList();
}

Future<List<Company>> fetchAllCompanies(http.Client client) async {
  final response = await client.get(
      "https://crunchbaseapitest20200720082326.azurewebsites.net/api/companies");
  return compute(parseCompany, response.body);
}

Future<Company> fetchCompanyById(http.Client client, int id) async {
  final response = await client.get(
      "https://crunchbaseapitest20200720082326.azurewebsites.net/api/companies/" +
          id.toString());
  Map<String, dynamic> mapCompany = json.decode(response.body);
  return Company.fromJson(mapCompany);
}

Future<void> insert(Company company) async {
  print(company.toMap().toString());
  await http.post(
      "https://crunchbaseapitest20200720082326.azurewebsites.net/companies",
      body: company.toMap());
}
