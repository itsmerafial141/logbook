import 'dart:convert';

HomepageModel homepageModelFromJson(String str) =>
    HomepageModel.fromJson(json.decode(str));

String homepageModelToJson(HomepageModel data) => json.encode(data.toJson());

class HomepageModel {
  HomepageModel({
    required this.name,
  });

  String name;

  factory HomepageModel.fromJson(Map<String, dynamic> json) => HomepageModel(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
