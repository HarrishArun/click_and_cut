class Services {
  final String image;
  final String title;
  bool isSelected;
  double price;
  Duration duration;

  Services({
    required this.image,
    required this.title,
    this.isSelected = false,
    this.price = 0.0,
    this.duration = const Duration(),
  });

  factory Services.fromJson(Map<String, dynamic> json) {
    return Services(
      image: json['image'] ?? '',
      title: json['title'] ?? '',
    );
  }
}
