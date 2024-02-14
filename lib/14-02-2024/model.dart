// To parse this JSON data, do
//
//     final apiData = apiDataFromJson(jsonString);

import 'dart:convert';

List<ApiData> apiDataFromJson(String str) => List<ApiData>.from(json.decode(str).map((x) => ApiData.fromJson(x)));

String apiDataToJson(List<ApiData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ApiData {
  int? id;
  String? name;
  bool? isVisible;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  String? photoUrl;
  bool? isPremium;
  String? modelType;
  bool? isNew;

  ApiData({
    this.id,
    this.name,
    this.isVisible,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.photoUrl,
    this.isPremium,
    this.modelType,
    this.isNew,
  });

  factory ApiData.fromJson(Map<String, dynamic> json) => ApiData(
    id: json["id"],
    name: json["name"],
    isVisible: json["is_visible"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    photoUrl: json["photo_url"],
    isPremium: json["is_premium"],
    modelType: json["model_type"],
    isNew: json["is_new"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "is_visible": isVisible,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "deleted_at": deletedAt,
    "photo_url": photoUrl,
    "is_premium": isPremium,
    "model_type": modelType,
    "is_new": isNew,
  };
}
