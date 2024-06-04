class FeedItem {
  final String imageUrl;
  final String shopName;
  final String avatarUrl;
  final String caption;
  List<String> comments = [];

  FeedItem({
    required this.imageUrl,
    required this.shopName,
    required this.avatarUrl,
    required this.caption,
  });
}
