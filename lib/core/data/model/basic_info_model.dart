/*
 * Copyright (c) 2025. BeyondSouls. All rights reserved.
 * Author: Parshuram Pathave
 *
 */

class BasicInfoModel {
  BasicInfoModel({
    required this.result,
    required this.data,
  });

  final BasicInfoResult? result;
  final Data? data;

  factory BasicInfoModel.fromJson(Map<String, dynamic> json){
    return BasicInfoModel(
      result: json["result"] == null ? null : BasicInfoResult.fromJson(json["result"]),
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "result": result?.toJson(),
    "data": data?.toJson(),
  };

}

class Data {
  Data({
    required this.banks,
    required this.company,
    required this.employees,
    required this.routes,
  });

  final List<Bank> banks;
  final List<Company> company;
  final List<Bank> employees;
  final List<Route> routes;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      banks: json["banks"] == null ? [] : List<Bank>.from(json["banks"]!.map((x) => Bank.fromJson(x))),
      company: json["company"] == null ? [] : List<Company>.from(json["company"]!.map((x) => Company.fromJson(x))),
      employees: json["employees"] == null ? [] : List<Bank>.from(json["employees"]!.map((x) => Bank.fromJson(x))),
      routes: json["routes"] == null ? [] : List<Route>.from(json["routes"]!.map((x) => Route.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "banks": banks.map((x) => x?.toJson()).toList(),
    "company": company.map((x) => x?.toJson()).toList(),
    "employees": employees.map((x) => x?.toJson()).toList(),
    "routes": routes.map((x) => x?.toJson()).toList(),
  };

}

class Bank {
  Bank({
    required this.id,
    required this.name,
  });

  final dynamic id;
  final String? name;

  factory Bank.fromJson(Map<String, dynamic> json){
    return Bank(
      id: json["id"],
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };

}

class Company {
  Company({
    required this.id,
    required this.name,
    required this.reportSw,
  });

  final dynamic id;
  final String? name;
  final String? reportSw;

  factory Company.fromJson(Map<String, dynamic> json){
    return Company(
      id: json["id"],
      name: json["name"],
      reportSw: json["reportSW"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "reportSW": reportSw,
  };

}

class Route {
  Route({
    required this.id,
    required this.code,
    required this.name,
    required this.company,
    required this.salesmanCode,
    required this.salesmanName,
    required this.days,
    required this.dataChecked,
    required this.isDeleted,
  });

  final dynamic id;
  final String? code;
  final String? name;
  final String? company;
  final String? salesmanCode;
  final String? salesmanName;
  final String? days;
  final dynamic dataChecked;
  final dynamic isDeleted;

  factory Route.fromJson(Map<String, dynamic> json){
    return Route(
      id: json["id"],
      code: json["code"],
      name: json["name"],
      company: json["company"],
      salesmanCode: json["salesmanCode"],
      salesmanName: json["salesmanName"],
      days: json["days"],
      dataChecked: json["dataChecked"],
      isDeleted: json["isDeleted"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "name": name,
    "company": company,
    "salesmanCode": salesmanCode,
    "salesmanName": salesmanName,
    "days": days,
    "dataChecked": dataChecked,
    "isDeleted": isDeleted,
  };

}

class BasicInfoResult {
  BasicInfoResult({
    required this.ack,
    required this.code,
    required this.message,
  });

  final bool? ack;
  final String? code;
  final String? message;

  factory BasicInfoResult.fromJson(Map<String, dynamic> json){
    return BasicInfoResult(
      ack: json["ack"],
      code: json["code"],
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() => {
    "ack": ack,
    "code": code,
    "message": message,
  };

}
