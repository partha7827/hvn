import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:highvibe/widgets/widgets.dart';

class DesktopTab extends StatefulWidget {
  final Text titleText;
  final String tooltipMessage;
  final Image image;
  final bool isExpanded;
  final bool isVertical;

  DesktopTab({
    @required this.image,
    @required this.titleText,
    @required this.tooltipMessage,
    int tabIndex,
    TabController tabController,
    this.isVertical,
  }) : isExpanded = tabController.index == tabIndex;

  @override
  _DesktopTabState createState() => _DesktopTabState();
}

class _DesktopTabState extends State<DesktopTab>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Color _backgroundColor = const Color(0xFF212342);

  void _updateBackgroudColorOnEnter(PointerEvent details) {
    setState(() => _backgroundColor = const Color(0xFF1f2458));
  }

  void _updateBackgroudColorOnExit(PointerEvent details) {
    setState(() => _backgroundColor = const Color(0xFF212342));
  }

  @override
  Widget build(BuildContext context) {
    final _isDisplayDesktop = isDisplayDesktop(context);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: _updateBackgroudColorOnEnter,
      onExit: _updateBackgroudColorOnExit,
      child: Tooltip(
        message: widget.tooltipMessage,
        child: Container(
          color: _backgroundColor,
          padding: EdgeInsets.fromLTRB(_isDisplayDesktop ? 8 : 15, 12, 0, 12),
          child: Row(
            children: [
              widget.image,
              const SizedBox(width: 12),
              Center(child: ExcludeSemantics(child: widget.titleText)),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(DesktopTab oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isExpanded) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    if (widget.isExpanded) {
      _controller.value = 1;
    }
  }
}
