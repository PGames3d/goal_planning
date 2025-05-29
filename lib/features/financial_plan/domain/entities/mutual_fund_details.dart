class MutualFundDetail {
  MutualFundDetail({
    required this.meta,
    required this.data,
    required this.status,
  });

  final Meta? meta;
  final List<Data> data;
  final String? status;
}

class Data {
  Data({
    required this.date,
    required this.nav,
  });

  final String? date;
  final String? nav;
}

class Meta {
  Meta({
    required this.fundHouse,
    required this.schemeType,
    required this.schemeCategory,
    required this.schemeCode,
    required this.schemeName,
    required this.isinGrowth,
    required this.isinDivReinvestment,
  });

  final String? fundHouse;
  final String? schemeType;
  final String? schemeCategory;
  final int? schemeCode;
  final String? schemeName;
  final String? isinGrowth;
  final dynamic isinDivReinvestment;

}
