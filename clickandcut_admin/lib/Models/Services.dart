class Services {
  final String image;
  final String title;

  Services({
  required this.image,
  required this.title,
  });

  factory Services.fromJson(Map<String, dynamic> json) {
    return Services(
      image: json['image'] ?? '',
      title: json['title'] ?? '',
    );
  }
}