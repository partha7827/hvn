import 'package:flutter/material.dart';
import 'package:highvibe/models/models.dart' show Audio;
import 'package:highvibe/utils/date_formater.dart';
import 'package:highvibe/widgets/widgets.dart' show isDisplayDesktop;

class ManageContentListTile extends StatelessWidget {
  final Audio audioItem;
  final ValueChanged<Audio> onTap;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onMore;

  const ManageContentListTile({
    @required this.audioItem,
    @required this.onTap,
    this.onEdit,
    this.onDelete,
    this.onMore,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _isDisplayDesktop = isDisplayDesktop(context);
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    audioItem.artworkUrlPath,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 30),
                Text(
                  audioItem.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          if (_isDisplayDesktop) ...[
            Expanded(
              child: Row(
                children: [
                  Text(
                    formatLongDate(
                      stringDate: audioItem.createdAt.toIso8601String(),
                    ),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF8E8F99),
                    ),
                  ),
                  const SizedBox(width: 30),
                  Text(
                    '${audioItem.duration}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF8E8F99),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 180,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    iconSize: 20,
                    color: const Color(0xFF8E8F99),
                    icon: const Icon(Icons.edit),
                    tooltip: 'Edit',
                    onPressed: onEdit,
                  ),
                  IconButton(
                    iconSize: 20,
                    color: const Color(0xFF8E8F99),
                    icon: const Icon(Icons.delete),
                    tooltip: 'Delete',
                    onPressed: onDelete,
                  ),
                  IconButton(
                    iconSize: 20,
                    color: const Color(0xFF8E8F99),
                    icon: const Icon(Icons.more_vert),
                    tooltip: 'More...',
                    onPressed: onMore,
                  ),
                ],
              ),
            )
          ],
          if (!_isDisplayDesktop)
            IconButton(
              iconSize: 20,
              color: const Color(0xFF8E8F99),
              icon: const Icon(Icons.more_vert),
              tooltip: 'Context menu...',
              onPressed: onMore,
            ),
        ],
      ),
    );
  }
}
