import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:highvibe/modules/mood_tracker/mood.dart';
import 'package:highvibe/modules/mood_tracker/mood_tracker_module.dart';
import 'package:highvibe/values/themes.dart';
import 'package:date_util/date_util.dart';
import 'package:highvibe/widgets/calendar_day_widget.dart';
import 'package:highvibe/widgets/calendar_week_day_widget.dart';
import 'package:highvibe/widgets/chip_button.dart';

class Month {
  String monthStartingDay;
  int offset, totalDays;
  DateTime month;

  Month(
      {this.month,
      this.offset = 0,
      this.monthStartingDay = '',
      this.totalDays = 0});
}

class MoodCalendarScreen extends StatefulWidget {
  const MoodCalendarScreen({this.mood});
  final Mood mood;

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

  final List<Month> calendar = [];

  void setCalendar() {
    for (var i = 0; i < 25; i++) {
      calendar.add(Month());
    }
  }

  bool isFullScreenCalendar = true;
  final List<Mood> events = [
    Mood(
      dateTime: DateTime(DateTime.now().year, DateTime.now().month, 1),
      imagePath: 'assets/emoji/ic_happy.png',
      title: 'Happy',
      tags: ['Work'],
    ),
    Mood(
        dateTime: DateTime(DateTime.now().year, DateTime.now().month, 3),
        imagePath: 'assets/emoji/ic_grateful.png',
        title: 'Grateful',
        tags: ['Work', 'School', 'Family'],
        notes: 'I am feeling very happy today'),
    Mood(
      dateTime: DateTime(DateTime.now().year, DateTime.now().month, 4),
      imagePath: 'assets/emoji/ic_relaxed.png',
      title: 'Relaxed',
      tags: ['Work', 'School'],
    ),
  ];

  @override
  void initState() {
    super.initState();

    dateTime = DateTime(now.year, now.month, now.day);
    setCalendar();
    initDateTimeList();

    if (widget.mood != null) {
      events.insert(0, widget.mood);
    }
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
              ? PageView.builder(
                  itemCount: calendar.length,
                  controller: _pageController,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 24),
                          child: Text(
                            '${dateUtil.month(calendar[index].month.month)}, ${calendar[index].month.year}',
                            style: bold18PlayfairWhite,
                          ),
                        ),
                        const WeekdayWidget(),
                        const SizedBox(
                          height: 22,
                        ),
                        Expanded(
                          child: GridView.builder(
                            itemCount: calendar[index].totalDays +
                                calendar[index].offset,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 7, childAspectRatio: 0.7),
                            itemBuilder: (BuildContext context, int daysIndex) {
                              if (daysIndex - calendar[index].offset < 0) {
                                return const SizedBox();
                              }

                              for (final mood in events) {
                                if (mood.dateTime
                                        .difference(DateTime(
                                            calendar[index].month.year,
                                            calendar[index].month.month,
                                            daysIndex -
                                                calendar[index].offset +
                                                1))
                                        .inDays ==
                                    0) {
                                  return CalendarDay(
                                    offset:
                                        daysIndex - calendar[index].offset + 1,
                                    dateTime: DateTime(
                                        calendar[index].month.year,
                                        calendar[index].month.month,
                                        daysIndex - calendar[index].offset + 1),
                                    isMoodTracked: true,
                                    mood: mood,
                                  );
                                }
                              }
                              return CalendarDay(
                                offset: daysIndex - calendar[index].offset + 1,
                                dateTime: DateTime(
                                    calendar[index].month.year,
                                    calendar[index].month.month,
                                    daysIndex - calendar[index].offset + 1),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
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
            return GestureDetector(
              onTap: () => MoodTrackerModule.toEditMoodScreen(events[index]),
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Card(
                  color: secondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Image.asset(events[index].imagePath),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Text(
                                    events[index].title,
                                    style: bold18PlayfairWhite,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '${events[index].dateTime.day} ${dateUtil.month(events[index].dateTime.month)}',
                              style: normal14Hint,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Wrap(
                          children: List.generate(
                            events[index].tags.length,
                            (i) => ChipButton(
                              label: events[index].tags[i],
                              isEnabled: false,
                              color: secondaryColor,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: events[index].notes != null &&
                              events[index].notes.isNotEmpty,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Divider(
                                color: hintTextColor,
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Text(
                                events[index].notes ?? '',
                                style: normal16White,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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

  DateTime setDateTime(int page) {
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

    currentMonth(page);
    return dateTime;
  }

  void initDateTimeList() {
    for (var i = 12; i >= 0; i--) {
      calendar[i].month = setDateTime(i);
    }

    currentPage = 12;
    dateTime = DateTime(now.year, now.month, 1);

    for (var i = 12; i <= 24; i++) {
      calendar[i].month = setDateTime(i);
    }
  }

  void currentMonth(int i) {
    totalNoOfDaysInCurrentMonth =
        dateUtil.daysInMonth(dateTime.month, dateTime.year);
    monthStartingWithDay = dateUtil
        .day(dateUtil.totalLengthOfDays(dateTime.month, 1, dateTime.year));
    offset = getDayOffset(monthStartingWithDay);

    calendar[i].totalDays = totalNoOfDaysInCurrentMonth;
    calendar[i].monthStartingDay = monthStartingWithDay;
    calendar[i].offset = offset;
  }
}
