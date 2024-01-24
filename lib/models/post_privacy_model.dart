class PostPrivacyModel {
  int id;
  String title;
  String subtitle;
  String description;
  List<int> stores = [];
  PostPrivacyModel({
    required this.title,
    required this.subtitle,
    required this.id,
    required this.description,
  });
}
