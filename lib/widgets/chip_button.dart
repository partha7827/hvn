
import 'package:flutter/material.dart';
import 'package:highvibe/values/themes.dart';

class ChipButton extends StatefulWidget {
  const ChipButton({
    Key key,
    @required this.label,
    this.color,
    this.isEnabled = true,
    this.voidCallback,
  }) : super(key: key);

  final String label;
  final Color color;
  final bool isEnabled;
  final Function voidCallback;

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
            if (widget.voidCallback != null) {
              widget.voidCallback(isSelected);
            }
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