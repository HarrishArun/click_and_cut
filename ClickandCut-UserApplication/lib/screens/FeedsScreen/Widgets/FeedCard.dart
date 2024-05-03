import 'package:flutter/material.dart';

import '../FeedModel.dart';
import '../FeedsScreen.dart';
import 'CommentBottomSheet.dart';
import 'CommentDialog.dart';

class FeedCard extends StatefulWidget {
  final FeedItem item;

  const FeedCard({Key? key, required this.item}) : super(key: key);

  @override
  _FeedCardState createState() => _FeedCardState();
}

class _FeedCardState extends State<FeedCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool isLiked = false;
  bool isSaved = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void toggleLike() {
    bool isLikedTemp = !isLiked;
    setState(() {
      isLiked = isLikedTemp;
      if (isLikedTemp) {
        _animationController.forward(from: 0);
        Future.delayed(Duration(seconds: 1), () {
          _animationController.reverse().then((value) {
            setState(() {
              // isLiked remains true after the animation completes
            });
          });
        });
      }
    });
  }

  void toggleSaved() {
    setState(() {
      isSaved = !isSaved;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      elevation: 4.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(widget.item.avatarUrl),
            ),
            title: Text(widget.item.shopName),
            trailing: IconButton(
              icon: Icon(isSaved ? Icons.bookmark : Icons.bookmark_border),
              onPressed: toggleSaved,
            ),
          ),
          GestureDetector(
            onDoubleTap: toggleLike,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  widget.item.imageUrl,
                  fit: BoxFit.cover,
                ),
                if (isLiked)
                  ScaleTransition(
                    scale: _animationController
                        .drive(CurveTween(curve: Curves.easeInOut)),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 80.0,
                    ),
                  ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon:
                        Icon(isLiked ? Icons.favorite : Icons.favorite_border),
                    onPressed: toggleLike,
                  ),
                  IconButton(
                    icon: Icon(Icons.comment),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => CommentDialog(
                          onCommentAdded: (comment) {
                            setState(() {
                              widget.item.comments.add(comment);
                            });
                          },
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.share),
                    onPressed: () {
                      // Add share functionality
                    },
                  ),
                ],
              ),
              // IconButton(
              //   icon: Icon(Icons.more_vert),
              //   onPressed: () {
              //     // Add more options for the item
              //   },
              // ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.item.caption,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          if (widget.item.comments.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => CommentBottomSheet(
                        comments: widget.item.comments,
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'View  all Comments (${widget.item.comments.length})',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade600
                          //  decoration: TextDecoration.underline
                          ),
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
