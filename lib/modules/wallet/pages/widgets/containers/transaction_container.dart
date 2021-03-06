import 'package:flutter/material.dart';
import 'package:highvibe/modules/wallet/resources/app_colors.dart';
import 'package:timeago/timeago.dart' as timeago;

class TransactionContainer extends StatelessWidget {
  final EdgeInsets margin;
  final Function onPressed;
  final bool incomeTransaction = true;

  TransactionContainer({this.margin, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    'https://www.fillmurray.com/300/300',
                    width: 50,
                    height: 50,
                  ),
                ),
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Bill Murray fdssf ddf ',
                          maxLines: 1,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Text(
                            timeago.format(DateTime.now()
                                .subtract(const Duration(minutes: 10))),
                            style: const TextStyle(
                                color: AppColors.textGrey, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                const Text(
                  '12345',
                  maxLines: 1,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: incomeTransaction
                        ? Icon(Icons.arrow_downward,
                            color: AppColors.green.withOpacity(0.8), size: 12)
                        : Icon(Icons.arrow_upward,
                            color: AppColors.red.withOpacity(0.8), size: 12))
              ],
            ),
          )
        ],
      ),
    );
  }
}
