/*
 * Copyright (c) 2025. BeyondSouls. All rights reserved.
 * Author: Parshuram Pathave
 *
 */

class SwitchModel {
  SwitchModel({
    required this.result,
  });

  final Result? result;

  factory SwitchModel.fromJson(Map<String, dynamic> json){
    return SwitchModel(
      result: json["result"] == null ? null : Result.fromJson(json["result"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "result": result?.toJson(),
  };

}

class Result {
  Result({
    required this.ack,
    required this.code,
    required this.data,
  });

  final bool? ack;
  final String? code;
  final Data? data;

  factory Result.fromJson(Map<String, dynamic> json){
    return Result(
      ack: json["ack"],
      code: json["code"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "ack": ack,
    "code": code,
    "data": data?.toJson(),
  };

}

class Data {
  Data({
    required this.otpConfirm,
    required this.allowExceptionWithoutOtp,
    required this.retailerButtonFlag,
    required this.qrCodePath,
  });

  final bool? otpConfirm;
  final bool? allowExceptionWithoutOtp;
  final bool? retailerButtonFlag;
  final String? qrCodePath;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      otpConfirm: json["otpConfirm"],
      allowExceptionWithoutOtp: json["allowExceptionWithoutOTP"],
      retailerButtonFlag: json["retailerButtonFlag"],
      qrCodePath: json["qrCodePath"],
    );
  }

  Map<String, dynamic> toJson() => {
    "otpConfirm": otpConfirm,
    "allowExceptionWithoutOTP": allowExceptionWithoutOtp,
    "retailerButtonFlag": retailerButtonFlag,
    "qrCodePath": qrCodePath,
  };

}
