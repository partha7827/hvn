import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:highvibe/modules/mood_tracker/current_mood.dart';
import 'package:highvibe/values/themes.dart';
import 'package:date_util/date_util.dart';

class MoodCalendarScreen extends StatefulWidget {
  @override
  _MoodCalendarScreenState createState() => _MoodCalendarScreenState();
}

class _MoodCalendarScreenState extends State<MoodCalendarScreen> {
  final DateTime now = DateTime.now();
  DateTime dateTime;
  int totalNoOfDaysInCurrentMonth = 0;
  final DateUtil dateUtil = DateUtil();
  String monthStartingWithDay;
  int offset = 0;

  final _pageController = PageController(initialPage: 12);
  int currentPage = 12;

  bool isFullScreenCalendar = true;
  final List<String> events = [''];

  @override
  void initState() {
    super.initState();
    dateTime = DateTime(now.year, now.month, now.day);
    initCurrentMonth();
  }

  int getDayOffset(String day) {
    var offset = 0;
    switch (day) {
      case 'Monday':
        offset = 0;
        break;
      case 'Tuesday':
        offset = 1;
        break;
      case 'Wednesday':
        offset = 2;
        break;
      case 'Thursday':
        offset = 3;
        break;
      case 'Friday':
        offset = 4;
        break;
      case 'Saturday':
        offset = 5;
        break;
      case 'Sunday':
        offset = 6;
        break;
    }
    return offset;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mood Check-ins'),
        actions: <Widget>[
          _buildCalendarButton(),
          _buildMinimisedCalendarButton(),
        ],
      ),
      body: Container(
          child: isFullScreenCalendar
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 24),
                      child: Text(
                        '${dateUtil.month(dateTime.month)}, ${dateTime.year}',
                        style: bold18PlayfairWhite,
                      ),
                    ),
                    const WeekdayWidget(),
                    const SizedBox(
                      height: 22,
                    ),
                    Expanded(
                      child: PageView.builder(
                        onPageChanged: onPageChanged,
                        controller: _pageController,
                        itemBuilder: (BuildContext context, int index) {
                          return GridView.builder(
                            itemCount: totalNoOfDaysInCurrentMonth + offset,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 7, childAspectRatio: 0.7),
                            itemBuilder: (BuildContext context, int daysIndex) {
                              if (daysIndex - offset < 0) {
                                return const SizedBox();
                              }
                              return CalendarDay(
                                offset: daysIndex - offset + 1,
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                )
              : (events.isEmpty)
                  ? Container(
                      alignment: Alignment.center,
                      child: Text(
                        'No events available',
                        style: normal16White,
                      ),
                    )
                  : _minimisedCalendarView()),
    );
  }

  Widget _minimisedCalendarView() {
    return Container(
      child: ListView.builder(
          itemCount: events.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Card(
                color: secondaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  padding:
                      const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Image.asset('assets/emoji/ic_happy.png'),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  'Happy',
                                  style: bold18PlayfairWhite,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Today: 12:44 AM',
                            style: normal14Hint,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Wrap(
                        children: <Widget>[
                          ChipButton(
                            label: 'Work',
                            color: secondaryColor,
                            isEnabled: false,
                          ),
                          ChipButton(
                            label: 'School',
                            color: secondaryColor,
                            isEnabled: false,
                          ),
                          ChipButton(
                            label: 'Family',
                            color: secondaryColor,
                            isEnabled: false,
                          ),
                        ],
                      ),
                      Divider(
                        color: hintTextColor,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        'I am feeling very happy today',
                        style: normal16White,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  InkWell _buildMinimisedCalendarButton() {
    return InkWell(
      onTap: () {
        setState(() {
          isFullScreenCalendar = false;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(top: 4, bottom: 4, right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
          border: Border.all(
            color: hintTextColor,
          ),
          gradient: !isFullScreenCalendar ? primaryGradient : null,
        ),
        child: Icon(
          Icons.menu,
        ),
      ),
    );
  }

  InkWell _buildCalendarButton() {
    return InkWell(
      onTap: () {
        setState(() {
          isFullScreenCalendar = true;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(top: 4, bottom: 4, left: 4),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            bottomLeft: Radius.circular(8),
          ),
          border: Border.all(
            color: hintTextColor,
          ),
          gradient: isFullScreenCalendar ? primaryGradient : null,
        ),
        child: SvgPicture.asset(
          'assets/ic_date.svg',
          height: 24,
        ),
      ),
    );
  }

  void onPageChanged(int page) {
    if (currentPage < page) {
      // Going forward
      if (dateTime.month < 12) {
        dateTime = dateTime.add(
          Duration(
            days: dateUtil.daysInMonth(dateTime.month, dateTime.year),
          ),
        );
      } else {
        dateTime = DateTime(dateTime.year + 1);
      }
    } else if (currentPage > page) {
      // Going backward
      if (dateTime.month > 1) {
        dateTime = DateTime(dateTime.year, dateTime.month - 1);
      } else {
        dateTime = DateTime(dateTime.year - 1, 12);
      }
    }

    currentPage = page;

    initCurrentMonth();
    setState(() {});
  }

  void initCurrentMonth() {
    totalNoOfDaysInCurrentMonth =
        dateUtil.daysInMonth(dateTime.month, dateTime.year);
    monthStartingWithDay = dateUtil
        .day(dateUtil.totalLengthOfDays(dateTime.month, 1, dateTime.year));
    offset = getDayOffset(monthStartingWithDay);
  }
}

class CalendarDay extends StatelessWidget {
  const CalendarDay({
    Key key,
    @required this.offset,
  }) : super(key: key);

  final int offset;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 36,
            width: 36,
            margin: const EdgeInsets.only(bottom: 4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: calendarDayBorderColor,
                width: 2,
              ),
            ),
          ),
          Text(
            '$offset',
            style: normal14White,
          ),
        ],
      ),
    );
  }
}

class WeekdayWidget extends StatelessWidget {
  const WeekdayWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _buildDay('MON'),
        _buildDay('TUE'),
        _buildDay('WED'),
        _buildDay('THU'),
        _buildDay('FRI'),
        _buildDay('SAT'),
        _buildDay('SUN'),
      ],
    );
  }

  Expanded _buildDay(String label) {
    return Expanded(
      child: Text(
        label,
        style: normal14Hint,
        textAlign: TextAlign.center,
      ),
    );
  }
}
