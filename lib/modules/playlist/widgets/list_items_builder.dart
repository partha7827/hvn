import 'package:flutter/material.dart';
import 'package:highvibe/modules/playlist/resources/resources.dart';
import 'package:highvibe/modules/playlist/widgets/widgets.dart'
    show EmptyContent;
import 'package:highvibe/values/themes.dart';

typedef ItemWidgetBuilder<T> = Widget Function(BuildContext context, T item);

class ListItemsBuilder<T> extends StatelessWidget {
  final AsyncSnapshot<List<T>> snapshot;
  final ItemWidgetBuilder<T> itemBuilder;
  final bool isCurrentUser;

  const ListItemsBuilder({
    Key key,
    @required this.snapshot,
    @required this.itemBuilder,
    @required this.isCurrentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (snapshot.hasData) {
      final items = snapshot.data;
      if (items.isNotEmpty) {
        return _buildList(items);
      } else {
        return isCurrentUser
            ? const EmptyContent()
            : Center(
                child: Text(
                  "There's no content here yet",
                  style: normal16White,
                ),
              );
      }
    } else if (snapshot.hasError) {
      return const EmptyContent(
        title: PlaylistStrings.emptyContentErrorTitle,
        message: PlaylistStrings.emptyContentErrorDescription,
      );
    }
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildList(List<T> items) {
    return ListView.separated(
      itemCount: items.length + 2,
      separatorBuilder: (context, index) => const Divider(height: 0.5),
      itemBuilder: (context, index) {
        if (index == 0 || index == items.length + 1) {
          return Container();
        }
        return itemBuilder(context, items[index - 1]);
      },
    );
  }
}
