import 'package:flutter/material.dart';
import 'package:hvn/values/themes.dart';

class GradientChip extends StatefulWidget {
  final String label;
  final IconData icon;
  final bool selected;
  final Function(bool value) onSelected;

  const GradientChip({
    this.label,
    this.icon,
    this.selected,
    this.onSelected,
  });

  @override
  _GradientChipState createState() => _GradientChipState();
}

class _GradientChipState extends State<GradientChip> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onSelected(!widget.selected),
      borderRadius: BorderRadius.circular(50.0),
      child: Container(
        height: 40.0,
        decoration: BoxDecoration(
          gradient: (widget.selected) ? primaryGradient : null,
          border: Border.all(
            color:
                widget.selected ? Colors.transparent : const Color(0xFF8E8F99),
          ),
          borderRadius: BorderRadius.circular(50.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (widget.icon != null)
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Icon(
                  widget.icon,
                  color: (widget.selected)
                      ? Colors.white
                      : const Color(0xFF8E8F99),
                  size: 16.0,
                ),
              ),
            Text(
              widget.label,
              style: TextStyle(
                fontSize: 14.0,
                color:
                    (widget.selected) ? Colors.white : const Color(0xFF8E8F99),
              ),
            )
          ],
        ),
      ),
    );
  }
}
