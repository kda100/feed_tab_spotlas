import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:front_developer_test/models/tag.dart';

///horizontal scroll view used to present the tags

class TagsList extends StatelessWidget {
  final List<Tag> tags;

  TagsList({
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: tags
            .map(
              (tag) => Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    tag.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
