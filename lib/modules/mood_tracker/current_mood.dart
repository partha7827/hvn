import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:highvibe/modules/mood_tracker/mood.dart';
import 'package:highvibe/modules/mood_tracker/mood_tracker_module.dart';
import 'package:highvibe/utils/utils.dart';
import 'package:highvibe/values/strings.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/chip_button.dart';
import 'package:highvibe/widgets/gradient_raised_button.dart';

class CurrentMood extends StatefulWidget {
  const CurrentMood({
    this.imagePath,
    this.title = '',
  });

  final String imagePath, title;

  @override
  _CurrentMoodState createState() => _CurrentMoodState();
}

class _CurrentMoodState extends State<CurrentMood> {
  final _textEditingController = TextEditingController();
  final List<String> _selectedTags = [];
  List<String> allTags = [
    'Work',
    'School',
    'Family',
    'Friends',
    'Travel',
    'Self Care',
    'Relationships',
    'Calm',
    'Money',
    'Food',
    'Spirituality',
    'Health'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Modular.to.pop();
          },
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            _currentMoodHeader(),
            _description(),
            _tagsAndNotes(context),
          ],
        ),
      ),
    );
  }

  Widget _tagsAndNotes(BuildContext context) {
    return Expanded(
      child: Container(
        width: screenWidth(context),
        decoration: const BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(child: _tags()),
            Container(
              padding: const EdgeInsets.all(20),
              child: GradientRaisedButton(
                label: 'Done',
                icon: Icons.check,
                onPressed: toMoodCheckIns,
                radius: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void toMoodCheckIns() {
    final dateTime = DateTime.now();
    final mood = Mood(
      title: widget.title,
      imagePath: widget.imagePath,
      notes: _textEditingController.text,
      tags: _selectedTags,
      dateTime: DateTime(dateTime.year, dateTime.month, dateTime.day),
    );

    print(mood.toString());

    MoodTrackerModule.toMoodCheckInScreen(mood);
  }

  Widget _tags() {
    return ListView(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(
            top: 36,
            right: 24,
            left: 24,
          ),
          child: _sectionHeader(
            iconPath: 'assets/ic_tag.svg',
            label: 'Add Tags',
            onPressed: () {},
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          child: Wrap(
            alignment: WrapAlignment.start,
            children: List.generate(
                allTags.length,
                (index) => ChipButton(
                      label: allTags[index],
                      voidCallback: (bool isSelected) {
                        if (isSelected) {
                          _selectedTags.add(allTags[index]);
                        } else {
                          _selectedTags.remove(allTags[index]);
                        }
                      },
                    )),
          ),
        ),
        Divider(
          indent: 20,
          endIndent: 20,
          height: 2,
          color: hintTextColor,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: _sectionHeader(
            label: 'Add Notes',
            iconPath: 'assets/ic_add_notes.svg',
            onPressed: () {},
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: primaryLightColor,
          ),
          child: TextFormField(
            minLines: 5,
            maxLines: 8,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(
                16,
              ),
            ),
            controller: _textEditingController,
            style: normal16White,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }

  Row _sectionHeader(
      {String label = '', String iconPath = '', Function onPressed}) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: SvgPicture.asset(iconPath),
        ),
        Expanded(
          child: Text(
            label,
            style: bold16White,
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white54,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Container _description() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Text(
        Strings.currentMoodDescription,
        style: normal20White,
      ),
    );
  }

  Container _currentMoodHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          Image.asset(widget.imagePath),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Text(
              widget.title,
              style: bold20PlayfairWhite,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController?.dispose();
    super.dispose();
  }
}
