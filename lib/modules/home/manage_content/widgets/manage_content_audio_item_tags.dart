import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:highvibe/widgets/widgets.dart';

class ManageContenAudioItemTags extends StatelessWidget {
  final List<String> tagItems;
  final ValueChanged<String> onDelete;

  ManageContenAudioItemTags({
    @required this.tagItems,
    @required this.onDelete,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scrollbar(
          child: SingleChildScrollView(
            child: Wrap(
              children: [
                for (final item in tagItems) ...[
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: TagItem(
                      title: item,
                      backgroundColor: const Color(0xFF66CCCC),
                      removeButton: ItemTagsRemoveButtonViewModel(
                        icon: Icons.delete,
                        size: 14,
                        backgroundColor: Colors.transparent,
                        color: const Color(0xFF525366),
                        onDelete: () => onDelete(item),
                      ),
                    ),
                  ),
                ]
              ],
            ),
          ),
        );
      },
    );
  }
}
