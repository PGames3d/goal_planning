class MutualFund {
  MutualFund({
    required this.schemeCode,
    required this.schemeName,
    required this.isinGrowth,
    required this.isinDivReinvestment,
  });

  final int? schemeCode;
  final String? schemeName;
  final dynamic isinGrowth;
  final dynamic isinDivReinvestment;
}
