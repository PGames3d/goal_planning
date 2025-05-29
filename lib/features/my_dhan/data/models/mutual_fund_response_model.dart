import '../../domain/entities/mutual_fund.dart';

class MutualFundsResponseModel extends MutualFund {
  MutualFundsResponseModel({
    required super.schemeCode,
    required super.schemeName,
    required super.isinGrowth,
    required super.isinDivReinvestment,
  });


  MutualFundsResponseModel copyWith({
    int? schemeCode,
    String? schemeName,
    dynamic isinGrowth,
    dynamic isinDivReinvestment,
  }) {
    return MutualFundsResponseModel(
      schemeCode: schemeCode ?? this.schemeCode,
      schemeName: schemeName ?? this.schemeName,
      isinGrowth: isinGrowth ?? this.isinGrowth,
      isinDivReinvestment: isinDivReinvestment ?? this.isinDivReinvestment,
    );
  }

  factory MutualFundsResponseModel.fromJson(Map<String, dynamic> json){
    return MutualFundsResponseModel(
      schemeCode: json["schemeCode"],
      schemeName: json["schemeName"],
      isinGrowth: json["isinGrowth"],
      isinDivReinvestment: json["isinDivReinvestment"],
    );
  }

  Map<String, dynamic> toJson() => {
    "schemeCode": schemeCode,
    "schemeName": schemeName,
    "isinGrowth": isinGrowth,
    "isinDivReinvestment": isinDivReinvestment,
  };

}
