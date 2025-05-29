/*
 * Copyright (c) 2025. BeyondSouls. All rights reserved.
 * Author: Parshuram Pathave
 *
 */

class AllFlagsModel {
  AllFlagsModel({
    required this.result,
  });

  final AllFlagResult? result;

  factory AllFlagsModel.fromJson(Map<String, dynamic> json){
    return AllFlagsModel(
      result: json["result"] == null ? null : AllFlagResult.fromJson(json["result"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "result": result?.toJson(),
  };

}

class AllFlagResult {
  AllFlagResult({
    required this.ack,
    required this.code,
    required this.message,
    required this.data,
  });

  final bool? ack;
  final String? code;
  final String? message;
  final Data? data;

  factory AllFlagResult.fromJson(Map<String, dynamic> json){
    return AllFlagResult(
      ack: json["ack"],
      code: json["code"],
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "ack": ack,
    "code": code,
    "message": message,
    "data": data?.toJson(),
  };

}

class Data {
  Data({
    required this.chequeBillPic,
    required this.chequeBillPicMandatory,
    required this.neftBillPic,
    required this.neftBillPicMandatory,
    required this.fsrBillPic,
    required this.fsrBillPicMandatory,
    required this.resendBillPic,
    required this.resendBillPicMandatory,
    required this.billPic,
    required this.billPicMandatory,
  });

  final bool? chequeBillPic;
  final bool? chequeBillPicMandatory;
  final bool? neftBillPic;
  final bool? neftBillPicMandatory;
  final bool? fsrBillPic;
  final bool? fsrBillPicMandatory;
  final bool? resendBillPic;
  final bool? resendBillPicMandatory;
  final bool? billPic;
  final bool? billPicMandatory;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      chequeBillPic: json["chequeBillPic"],
      chequeBillPicMandatory: json["chequeBillPicMandatory"],
      neftBillPic: json["neftBillPic"],
      neftBillPicMandatory: json["neftBillPicMandatory"],
      fsrBillPic: json["fsrBillPic"],
      fsrBillPicMandatory: json["fsrBillPicMandatory"],
      resendBillPic: json["resendBillPic"],
      resendBillPicMandatory: json["resendBillPicMandatory"],
      billPic: json["billPic"],
      billPicMandatory: json["billPicMandatory"],
    );
  }

  Map<String, dynamic> toJson() => {
    "chequeBillPic": chequeBillPic,
    "chequeBillPicMandatory": chequeBillPicMandatory,
    "neftBillPic": neftBillPic,
    "neftBillPicMandatory": neftBillPicMandatory,
    "fsrBillPic": fsrBillPic,
    "fsrBillPicMandatory": fsrBillPicMandatory,
    "resendBillPic": resendBillPic,
    "resendBillPicMandatory": resendBillPicMandatory,
    "billPic": billPic,
    "billPicMandatory": billPicMandatory,
  };

}

