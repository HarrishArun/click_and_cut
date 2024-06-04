import 'package:flutter/material.dart';

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
