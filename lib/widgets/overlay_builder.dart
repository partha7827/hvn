import 'package:flutter/material.dart';

class OverlayBuilder extends StatefulWidget {
  final Widget Function(BuildContext) overlayBuilder;
  final Widget child;
  final bool showOverlay;

  const OverlayBuilder({
    @required this.overlayBuilder,
    @required this.child,
    this.showOverlay = false,
  });

  @override
  _OverlayBuilderState createState() => _OverlayBuilderState();
}

class _OverlayBuilderState extends State<OverlayBuilder> {
  OverlayEntry overlayEntry;

  void addToOverlay(OverlayEntry entry) async {
    print('addToOverlay');
    Overlay.of(context).insert(entry);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void didUpdateWidget(OverlayBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    WidgetsBinding.instance.addPostFrameCallback((_) => syncWidgetAndOverlay());
  }

  @override
  void dispose() {
    if (isShowingOverlay()) {
      hideOverlay();
    }

    super.dispose();
  }

  void hideOverlay() {
    print('hideOverlay');
    overlayEntry.remove();
    overlayEntry = null;
  }

  @override
  void initState() {
    super.initState();

    if (widget.showOverlay) {
      WidgetsBinding.instance.addPostFrameCallback((_) => showOverlay());
    }
  }

  bool isShowingOverlay() => overlayEntry != null;

  @override
  void reassemble() {
    super.reassemble();
    WidgetsBinding.instance.addPostFrameCallback((_) => syncWidgetAndOverlay());
  }

  void showOverlay() {
    overlayEntry = OverlayEntry(builder: widget.overlayBuilder);
    addToOverlay(overlayEntry);
  }

  void syncWidgetAndOverlay() {
    if (isShowingOverlay() && !widget.showOverlay) {
      hideOverlay();
    } else if (!isShowingOverlay() && widget.showOverlay) {
      showOverlay();
    }
  }
}
