import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:highvibe/modules/mood_tracker/mood_tracker_module.dart';
import 'package:highvibe/utils/utils.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/gradient_raised_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MoodCheckInsScreen extends StatefulWidget {
  @override
  _MoodCheckInsScreenState createState() => _MoodCheckInsScreenState();
}

class _MoodCheckInsScreenState extends State<MoodCheckInsScreen> {
  int currentPage = 0;
  final _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mood Check-Ins'),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset(
              'assets/ic_date.svg',
              height: 24,
            ),
            onPressed: () => MoodTrackerModule.toMoodCalendarScreen(),
          ),
        ],
      ),
      body: Container(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Container(
              height: screenHeight(context),
              child: CustomScrollView(
                shrinkWrap: true,
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildListDelegate(
                      <Widget>[
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          margin: const EdgeInsets.only(top: 24),
                          child: Text(
                            'Recommended for you',
                            style: bold20PlayfairWhite,
                          ),
                        ),
                        Container(
                          height: 335,
                          child: PageView.builder(
                            itemCount: 4,
                            onPageChanged: onPageChanged,
                            controller: _pageController,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                margin: const EdgeInsets.only(top: 24),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Expanded(
                                      child: Stack(
                                        alignment: Alignment.bottomCenter,
                                        children: <Widget>[
                                          Container(
                                            decoration: BoxDecoration(
                                              color: secondaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 8,
                                            left: 0,
                                            child: Container(
                                              width: screenWidth(context) * 0.9,
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: <Widget>[
                                                  Text(
                                                    '85%',
                                                    style: normal12White,
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      padding: EdgeInsets.only(
                                                          right: screenWidth(
                                                                  context) *
                                                              0.2),
                                                      margin:
                                                          const EdgeInsets.only(
                                                              left: 8),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                        color: Colors.white,
                                                      ),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100),
                                                          gradient:
                                                              primaryGradient,
                                                        ),
                                                        height: 5,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 16),
                                      child: Text(
                                        'Feel your soul',
                                        style: normal16White,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(bottom: 20),
                          child: SmoothPageIndicator(
                              controller: _pageController,
                              count: 4,
                              axisDirection: Axis.horizontal,
                              effect: const ExpandingDotsEffect(
                                activeDotColor: accentColor,
                                dotHeight: 3,
                                dotWidth: 10,
                              ),
                              onDotClicked: (index) {}),
                        ),
                      ],
                    ),
                  ),
                  SliverGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 40,
                    children: <Widget>[
                      _buildSongItem(
                          title: 'Float with your \nthoughts',
                          duration: '30 mins'),
                      _buildSongItem(
                          title: 'Let the feelings \ncome & go',
                          duration: '30 mins'),
                      _buildSongItem(
                          title: 'Every dream can \ncome true',
                          duration: '30 mins'),
                      _buildSongItem(
                          title: 'Train your mind to \nsee the good',
                          duration: '30 mins'),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              child: Container(
                width: screenWidth(context),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.center,
                child: GradientRaisedButton(
                  label: 'Back to home',
                  leading: SvgPicture.asset(
                    'assets/ic_home.svg',
                    color: Colors.white,
                  ),
                  onPressed: () {},
                  radius: 100,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildSongItem({String title = '', String duration = ''}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: secondaryColor,
            ),
            padding: const EdgeInsets.all(8.0),
          ),
          Positioned(
            right: 10,
            top: 10,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.black87,
              ),
              padding: const EdgeInsets.all(8.0),
              child: Text(
                duration,
                style: normal12White,
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: normal14White,
            ),
          ),
        ],
      ),
    );
  }

  void onPageChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }
}
