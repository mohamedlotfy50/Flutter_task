class MenuModel {
  MenuModel({
    this.light,
    this.bestValue,
    this.plus,
  });

  List<BestValue> light;
  List<BestValue> bestValue;
  List<BestValue> plus;

  factory MenuModel.fromJson(Map<String, dynamic> json) => MenuModel(
        light: List<BestValue>.from(
            json["light"].map((x) => BestValue.fromJson(x))),
        bestValue: List<BestValue>.from(
            json["best_value"].map((x) => BestValue.fromJson(x))),
        plus: List<BestValue>.from(
            json["plus"].map((x) => BestValue.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "light": List<dynamic>.from(light.map((x) => x.toJson())),
        "best_value": List<dynamic>.from(bestValue.map((x) => x.toJson())),
        "plus": List<dynamic>.from(plus.map((x) => x.toJson())),
      };
}

class BestValue {
  BestValue({
    this.img,
    this.regularPrice,
    this.plusPrice,
    this.name,
    this.restaurant,
  });

  String img;
  int regularPrice;
  int plusPrice;
  String name;
  String restaurant;

  factory BestValue.fromJson(Map<String, dynamic> json) => BestValue(
        img: json["img"],
        regularPrice: json["regular_price"],
        plusPrice: json["plus_price"],
        name: json["name"],
        restaurant: json["restaurant"],
      );

  Map<String, dynamic> toJson() => {
        "img": img,
        "regular_price": regularPrice,
        "plus_price": plusPrice,
        "name": name,
        "restaurant": restaurant,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
