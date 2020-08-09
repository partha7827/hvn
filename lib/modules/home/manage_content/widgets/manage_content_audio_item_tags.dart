import 'package:flutter/material.dart';
import 'package:highvibe/widgets/widgets.dart';

class ManageContenAudioItemtTags extends StatelessWidget {
  final List<String> tagItems;
  final ValueChanged<String> onDelete;

  ManageContenAudioItemtTags({
    @required this.tagItems,
    @required this.onDelete,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('ManageContenAudioItemtTags: $tagItems');
    return Wrap(
      children: [
        for (final item in tagItems) ...[
          TagItem(
            title: item,
            backgroundColor: const Color(0xFF66CCCC),
            removeButton: ItemTagsRemoveButtonViewModel(
              icon: Icons.delete,
              size: 12,
              backgroundColor: Colors.transparent,
              onDelete: () => onDelete(item),
            ),
          ),
        ],
      ],
    );
  }
}
