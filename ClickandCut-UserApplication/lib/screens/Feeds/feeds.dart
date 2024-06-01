import 'package:click_and_cut/const.dart';
import 'package:flutter/material.dart';

import '../../components/Appbar.dart';
import '../../models/feed.dart';
import 'Components/feed_card.dart';

class FeedsScreen extends StatefulWidget {
  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  final List<FeedItem> items = [
    FeedItem(
      imageUrl: 'lib/assets/img1.jpeg',
      shopName: 'Shop 1',
      avatarUrl: 'assets/images/avatar1.jpg',
      caption: 'Caption for image 1',
    ),
    FeedItem(
      imageUrl: 'lib/assets/img1.jpeg',
      shopName: 'Shop 2',
      avatarUrl: 'assets/images/avatar2.jpg',
      caption: 'Caption for image 2',
    ),
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        //elevation: 2,
        title: Appbar(),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return FeedCard(item: items[index]);
        },
      ),
    );
  }
}
