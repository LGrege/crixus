class PriceModel {
  final String currencyIso;

  final String formattedValue;

  PriceModel({this.currencyIso, this.formattedValue});

  factory PriceModel.fromJson(Map<String, dynamic> json) {
    return PriceModel(
        currencyIso: json['currencyIso'],
        formattedValue: json['formattedValue']);
  }
}
