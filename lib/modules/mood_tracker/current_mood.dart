import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:highvibe/modules/mood_tracker/mood_tracker_module.dart';
import 'package:highvibe/utils/utils.dart';
import 'package:highvibe/values/strings.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/gradient_raised_button.dart';

class CurrentMood extends StatefulWidget {
  const CurrentMood({
    this.image,
    this.title = '',
  });

  final String image, title;

  @override
  _CurrentMoodState createState() => _CurrentMoodState();
}

class _CurrentMoodState extends State<CurrentMood> {
  final _textEditingController = TextEditingController();

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
    MoodTrackerModule.toMoodCheckInScreen();
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
            children: <Widget>[
              const ChipButton(
                label: 'Work',
              ),
              const ChipButton(
                label: 'School',
              ),
              const ChipButton(
                label: 'Family',
              ),
              const ChipButton(
                label: 'Friends',
              ),
              const ChipButton(
                label: 'Travel',
              ),
              const ChipButton(
                label: 'Self Care',
              ),
              const ChipButton(
                label: 'Relationships',
              ),
              const ChipButton(
                label: 'Calm',
              ),
              const ChipButton(
                label: 'Money',
              ),
              const ChipButton(
                label: 'Food',
              ),
              const ChipButton(
                label: 'Spirituality',
              ),
              const ChipButton(
                label: 'Health',
              ),
            ],
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
          Image.asset(widget.image),
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
}

class ChipButton extends StatefulWidget {
  const ChipButton({
    Key key,
    @required this.label,
    this.color,
    this.isEnabled = true,
  }) : super(key: key);

  final String label;
  final Color color;
  final bool isEnabled;

  @override
  _ChipButtonState createState() => _ChipButtonState();
}

class _ChipButtonState extends State<ChipButton> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !widget.isEnabled,
      child: Container(
        margin: const EdgeInsets.only(right: 16, bottom: 16),
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: () {
            setState(() {
              isSelected = !isSelected;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              gradient: isSelected ? primaryGradient : null,
              color: isSelected
                  ? null
                  : !widget.isEnabled ? Colors.white : hintTextColor,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: widget.color ?? secondaryColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Text(
                widget.label,
                style: isSelected || !widget.isEnabled
                    ? normal16White
                    : normal16Hint,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
