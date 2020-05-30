import 'package:flutter/material.dart';
import 'package:highvibe/values/themes.dart';

class PastMeditations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 32),
      child: ListView(
        padding: const EdgeInsets.only(bottom: 80.0),
        children: <Widget>[
          _dateWidget('Today'),
          _item(
            title: 'Deep Meditation',
            duration: '10 Mins',
            time: '3:45 PM',
            status: 'Completed',
            note:
                '''I love this exercise, I will do this every day at least 3 times. Reduced stress, feeling...''',
            exp: 20,
          ),
          _item(
            title: 'Yoga',
            duration: '5 Mins',
            time: '7:18 PM',
            status: 'Incomplete',
            note:
                '''I love this exercise, I will do this every day at least 3 times. Reduced stress, feeling...''',
          ),
          _dateWidget('Yesterday'),
          _item(
            title: 'MindFulness Meditation',
            duration: '20 Mins',
            time: '9:18 PM',
            status: 'Completed',
            exp: 40,
          ),
        ],
      ),
    );
  }

  Widget _dateWidget(String s) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            height: 1,
            color: const Color(0xFF8E8F99),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            s,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF8E8F99),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 1,
            color: const Color(0xFF8E8F99),
          ),
        ),
      ],
    );
  }

  Widget _item({
    String title,
    String duration,
    String time,
    String status,
    String note,
    int exp,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: const Color(0xFF212342),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    duration,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      time,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF8E8F99),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 4.0, right: 4.0),
                      child: CircleAvatar(
                        backgroundColor: Color(0xFF8E8F99),
                        radius: 2,
                      ),
                    ),
                    Text(
                      status,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF8E8F99),
                      ),
                    ),
                  ],
                ),
              ),
              if (note != null)
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        note,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              if (exp != null)
                Row(
                  children: <Widget>[
                    Chip(
                      label: RichText(
                        text: TextSpan(
                            text: '$exp ',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF525366),
                            ),
                            children: [
                              TextSpan(
                                text: 'XP Earned',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal,
                                  color: const Color(0xFF525366),
                                ),
                              )
                            ]),
                      ),
                      avatar: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          gradient: secondaryGradient,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Image.asset(
                          'assets/ic_xp.png',
                        ),
                      ),
                      backgroundColor: Colors.white,
                    ),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
