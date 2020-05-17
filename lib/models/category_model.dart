class CategoryModel {
  final String code;

  final String name;

  CategoryModel({this.code, this.name});

  factory CategoryModel.fromJSON(Map<String, dynamic> json) {
    return CategoryModel(code: json['code'], name: json['name']);
  }
}
