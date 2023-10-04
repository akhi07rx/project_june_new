class DataModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  DataModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  DataModel.fromJson(Map<String, dynamic> json) {
    userId = json["userId"];
    id = json["id"];
    title = json["title"];
    body = json["body"];
  }
}
