import 'package:flutter/material.dart';

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

class FeedCard extends StatefulWidget {
  final FeedItem item;

  const FeedCard({Key? key, required this.item}) : super(key: key);

  @override
  _FeedCardState createState() => _FeedCardState();
}

class _FeedCardState extends State<FeedCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _overlayOpacity;
  bool isLiked = false;
  bool isSaved = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _overlayOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
      if (isLiked) {
        _animationController.forward(from: 0);
        Future.delayed(Duration(seconds: 1), () {
          _animationController.reverse().then((value) {
            setState(() {
              isLiked = false; // Reset isLiked after animation completes
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
                AnimatedOpacity(
                  opacity: isLiked ? _overlayOpacity.value : 0.0,
                  duration: Duration(milliseconds: 500),
                  child: Container(
                    color: Colors.red.withOpacity(0.5),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 80.0,
                    ),
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
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {
                  // Add more options for the item
                },
              ),
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
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => CommentBottomSheet(
                    comments: widget.item.comments,
                  ),
                );
              },
              child: Text(
                'View Comments (${widget.item.comments.length})',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
        ],
      ),
    );
  }
}

class CommentDialog extends StatelessWidget {
  final Function(String) onCommentAdded;

  CommentDialog({Key? key, required this.onCommentAdded}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController commentController = TextEditingController();

    return AlertDialog(
      title: Text('Add Comment'),
      content: TextField(
        controller: commentController,
        decoration: InputDecoration(hintText: 'Enter your comment'),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            String comment = commentController.text.trim();
            if (comment.isNotEmpty) {
              onCommentAdded(comment);
              commentController.clear();
              Navigator.of(context).pop();
            }
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}

class CommentBottomSheet extends StatelessWidget {
  final List<String> comments;

  CommentBottomSheet({Key? key, required this.comments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Comments',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          SizedBox(height: 8.0),
          ListView.separated(
            shrinkWrap: true,
            itemCount: comments.length,
            separatorBuilder: (context, index) => Divider(),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(comments[index]),
              );
            },
          ),
        ],
      ),
    );
  }
}

class FeedsScreen extends StatefulWidget {
  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  final List<FeedItem> items = [
    FeedItem(
      imageUrl: 'assets/images/image1.jpg',
      shopName: 'Shop 1',
      avatarUrl: 'assets/images/avatar1.jpg',
      caption: 'Caption for image 1',
    ),
    FeedItem(
      imageUrl: 'assets/images/image2.jpg',
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
        title: Text('Feeds'),
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
