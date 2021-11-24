// To parse this JSON data, do
//
//     final modelPost = modelPostFromJson(jsonString);

import 'dart:convert';

ModelPost modelPostFromJson(String str) => ModelPost.fromJson(json.decode(str));

String modelPostToJson(ModelPost data) => json.encode(data.toJson());

class ModelPost {
  ModelPost({
    required this.name,
    required this.job,
    required this.id,
    required this.createdAt,
  });

  String name;
  String job;
  String id;
  DateTime createdAt;

  factory ModelPost.fromJson(Map<String, dynamic> json) => ModelPost(
    name: json["name"],
    job: json["job"],
    id: json["id"],
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "job": job,
    "id": id,
    "createdAt": createdAt.toIso8601String(),
  };
}
