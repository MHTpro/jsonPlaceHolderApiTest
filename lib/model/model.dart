class MainModel {
  final int id;
  final String title;
  final String body;

  MainModel({
    required this.id,
    required this.title,
    required this.body,
  });

  factory MainModel.fromJson(Map<String, dynamic> json) {
    return MainModel(
      id: json["id"],
      title: json["title"],
      body: json["body"],
    );
  }
}
