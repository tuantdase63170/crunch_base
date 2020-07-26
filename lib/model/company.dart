import 'dart:async';
import 'dart:convert';
import 'package:crunch_base/model/stock.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

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
  int lastFundingTypeId;
  int creatorId;
  String phone;
  String email;
  bool isApproved;
  String creator;
  String investmentStageNavigation;
  String location;
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
      this.creator,
      this.investmentStageNavigation,
      this.location,
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
        preFundingStockValue: json['preFundingStockValue'],
        postFundingStockValue: json['postFundingStockValue'],
        lastFundingTypeId: json['lastFundingTypeId'],
        creatorId: json['creatorId'],
        phone: json['phone'],
        email: json['email'],
        isApproved: json['isApproved'],
        creator: json['creator'],
        investmentStageNavigation: json['investmentStageNavigation'],
        location: json['location'],
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
        creator: temp.creator,
        investmentStageNavigation: temp.investmentStageNavigation,
        location: temp.location,
        industryList: temp.industryList,
        investment: temp.investment,
        stockHeld: temp.stockHeld);
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

void createCompany(http.Client client, Company company) async {

}
