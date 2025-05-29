import 'package:goal_planning/features/financial_plan/domain/entities/mutual_fund_details.dart';

class MutualFundDetailsResponseModel extends MutualFundDetail {
  MutualFundDetailsResponseModel({
    required super.meta,
    required super.data,
    required String super.status,
  });

  factory MutualFundDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    return MutualFundDetailsResponseModel(
      meta: json["meta"] == null ? null : MetaModel.fromJson(json["meta"]),
      data: json["data"] == null
          ? []
          : List<Data>.from(json["data"].map((x) => DataModel.fromJson(x))),
      status: json["status"],
    );
  }

  Map<String, dynamic> toJson() => {
    "meta": (meta as MetaModel?)?.toJson(),
    "data": data.map((x) => (x as DataModel).toJson()).toList(),
    "status": status,
  };
}

class MetaModel extends Meta {
  MetaModel({
    required String super.fundHouse,
    required String super.schemeType,
    required String super.schemeCategory,
    required int super.schemeCode,
    required String super.schemeName,
    required super.isinGrowth,
    required super.isinDivReinvestment,
  });

  factory MetaModel.fromJson(Map<String, dynamic> json) {
    return MetaModel(
      fundHouse: json["fund_house"],
      schemeType: json["scheme_type"],
      schemeCategory: json["scheme_category"],
      schemeCode: json["scheme_code"],
      schemeName: json["scheme_name"],
      isinGrowth: json["isin_growth"],
      isinDivReinvestment: json["isin_div_reinvestment"],
    );
  }

  Map<String, dynamic> toJson() => {
    "fund_house": fundHouse,
    "scheme_type": schemeType,
    "scheme_category": schemeCategory,
    "scheme_code": schemeCode,
    "scheme_name": schemeName,
    "isin_growth": isinGrowth,
    "isin_div_reinvestment": isinDivReinvestment,
  };
}

class DataModel extends Data {
  DataModel({
    required String date,
    required String nav,
  }) : super(date: date, nav: nav);

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      date: json["date"],
      nav: json["nav"],
    );
  }

  Map<String, dynamic> toJson() => {
    "date": date,
    "nav": nav,
  };
}
