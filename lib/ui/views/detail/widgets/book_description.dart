import 'package:flutter/material.dart';
import 'package:thuprai_clone/base/widgets/base_list_tile.dart';

class BookDescription extends StatelessWidget {
  final String? description;

  const BookDescription({Key? key, this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseListTile(
      title: 'Description',
      subtitle: description ?? '',
    );
  }
}
