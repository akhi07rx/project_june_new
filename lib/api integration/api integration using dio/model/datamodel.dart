// // To parse this JSON data, do
// //
// //     final dataModel = dataModelFromJson(jsonString);
//
// import 'dart:convert';
//
// List<DataModel> dataModelFromJson(String str) =>
//     List<DataModel>.from(json.decode(str).map((x) => DataModel.fromJson(x)));
//
// String dataModelToJson(List<DataModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class DataModel {
//   int? userId;
//   int? id;
//   String? title;
//   String? body;
//
//   DataModel({
//     this.userId,
//     this.id,
//     this.title,
//     this.body,
//   });
//
//   DataModel.fromJson(Map<String, dynamic> json) {
//     userId = json["userId"];
//     id = json["id"];
//     title = json["title"];
//     body = json["body"];
//   }
// }
