import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:highvibe/modules/wallet/components/transactions/transaction_item_row_text.dart';

class TransactionItemRow extends StatelessWidget {
  const TransactionItemRow(
      {Key key,
      this.title,
      this.property,
      this.color,
      this.copy = false,
      this.borderRadius})
      : super(key: key);

  final String title;
  final String property;
  final Color color;
  final bool copy;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius,
        ),
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            TransactionItemRowText(
              title: title,
              color: const Color(0xff818181),
              fontSize: 14,
              height: 50,
            ),
            _showItemWithCopy(context)
          ],
        ),
      );

  Widget _showItemWithCopy(BuildContext context) {
    if (copy) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Text(
              '$property',
              style: const TextStyle(color: Color(0xff696969), fontSize: 12),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            //color: Colors.greenAccent,
            width: 30,
            child: IconButton(
              icon: const Icon(Icons.content_copy),
              iconSize: 20,
              tooltip: 'copy address',
              onPressed: () {
                Clipboard.setData(
                  ClipboardData(text: property),
                );
                Scaffold.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Copied'),
                  ),
                );
              },
              color: const Color(0xff858585),
            ),
          ),
        ],
      );
    }
    return Text(
      '$property',
      style: const TextStyle(color: Color(0xff696969), fontSize: 14),
    );
  }
}
