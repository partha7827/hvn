import 'package:flutter/material.dart';
import 'package:highvibe/modules/playlist/resources/resources.dart';
import 'package:highvibe/modules/playlist/widgets/widgets.dart'
    show EmptyContent;

typedef ItemWidgetBuilder<T> = Widget Function(BuildContext context, T item);

class ListItemsBuilder<T> extends StatelessWidget {
  final AsyncSnapshot<List<T>> snapshot;
  final ItemWidgetBuilder<T> itemBuilder;

  const ListItemsBuilder({
    Key key,
    @required this.snapshot,
    @required this.itemBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (snapshot.hasData) {
      final items = snapshot.data;
      print('=====ListItemsBuilder=====: \n $items');
      if (items.isNotEmpty) {
        return _buildList(items);
      } else {
        return const EmptyContent();
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
