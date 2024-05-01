import 'package:flutter/material.dart';

import '../../../packages/api/models/word_pair.dart';

class WordPairListTile extends StatelessWidget {
  const WordPairListTile({
    required this.wordPair,
    super.key,
    this.onDismissed,
    this.onTap,
  });

  final WordPair wordPair;
  final DismissDirectionCallback? onDismissed;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);

    return Dismissible(
      key: Key('wordPairListTile_dismissible_${wordPair.id}'),
      onDismissed: onDismissed,
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: const Icon(
          Icons.delete,
          color: Color(0xAAFFFFFF),
        ),
      ),
      child: ListTile(
        onTap: onTap,
        title: Text(
          wordPair.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
