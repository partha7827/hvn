import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:highvibe/modules/mood_tracker/mood.dart';
import 'package:highvibe/utils/utils.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/chip_button.dart';
import 'package:highvibe/widgets/gradient_outline_button.dart';

class EditMoodScreen extends StatefulWidget {
  const EditMoodScreen({
    @required this.mood,
  });

  final Mood mood;
  @override
  _EditMoodScreenState createState() => _EditMoodScreenState();
}

class _EditMoodScreenState extends State<EditMoodScreen> {
  final _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textEditingController.text = widget.mood.notes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.close,
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
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: GradientOutlineButton(
                        label: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Edit Mood',
                            style: normal14Accent,
                          ),
                        ),
                        icon: Icon(
                          Icons.edit,
                          color: accentColor,
                        ),
                        onPressed: toMoodCheckIns,
                        radius: 100,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: GradientOutlineButton(
                        label: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Delete Mood',
                            style: normal14Accent,
                          ),
                        ),
                        icon: Icon(
                          Icons.delete,
                          color: accentColor,
                        ),
                        onPressed: toMoodCheckIns,
                        radius: 100,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void toMoodCheckIns() {
    // MoodTrackerModule.toMoodCheckInScreen();
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
              widget.mood.tags.length,
              (i) => ChipButton(
                label: widget.mood.tags[i],
                color: secondaryColor,
                isEnabled: false,
              ),
            ),
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

  Container _currentMoodHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          Image.asset(widget.mood.imagePath),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Text(
              widget.mood.title,
              style: bold20PlayfairWhite,
            ),
          ),
        ],
      ),
    );
  }
}
