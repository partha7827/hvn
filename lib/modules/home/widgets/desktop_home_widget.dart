import 'package:flutter/material.dart';
import 'package:highvibe/modules/auth/resources/resources.dart';
import 'package:highvibe/modules/home/home_controller.dart';
import 'package:highvibe/modules/home/resources/resources.dart';
import 'package:highvibe/modules/home/widgets/widgets.dart'
    show
        DesktopCreatorPolicy,
        DesktopManageContentPage,
        DesktopTab,
        DesktopTabBar;
import 'package:highvibe/values/strings.dart';
import 'package:highvibe/widgets/widgets.dart';

const int _tabCount = 2;

class DesktopHomeWidget extends StatefulWidget {
  final HomeController controller;

  const DesktopHomeWidget({
    @required this.controller,
    Key key,
  }) : super(key: key);

  @override
  _DesktopHomeWidgetState createState() => _DesktopHomeWidgetState();
}

class _DesktopHomeWidgetState extends State<DesktopHomeWidget>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  Widget build(BuildContext context) {
    final _isDisplayDesktop = isDisplayDesktop(context);
    return Row(
      children: [
        Container(
          color: const Color(0xFF212342),
          width: _isDisplayDesktop ? 250 : 60,
          alignment: Alignment.topLeft,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  Padding(
                    padding: EdgeInsets.only(left: _isDisplayDesktop ? 8 : 15),
                    child: SizedBox(
                      height: _isDisplayDesktop ? 50 : 30,
                      width: _isDisplayDesktop ? 180 : 30,
                      child: _isDisplayDesktop
                          ? AuthImageAssets.webHvnLogoCompact
                          : HomeImageAssets.desktopCircleLogo,
                    ),
                  ),
                  const SizedBox(height: 24),
                  RotatedBox(
                    quarterTurns: 3,
                    child: DesktopTabBar(
                      tabController: _tabController,
                      tabs: [
                        for (final widget in _buildTabs(
                          context: context,
                          isVertical: true,
                        ))
                          RotatedBox(quarterTurns: 1, child: widget)
                      ],
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: _isDisplayDesktop ? 8 : 10,
                      bottom: _isDisplayDesktop ? 140 : 80),
                  child: Tooltip(
                    message:
                        '''${widget.controller.currentUserStore.currentUser.name}''',
                    child: CircleAvatar(
                      radius: _isDisplayDesktop ? 30 : 20,
                      backgroundImage: NetworkImage(
                        widget.controller.currentUserStore.currentUser.photoUrl,
                      ),
                    ),
                  ),
                ),
              ),
              if (_isDisplayDesktop)
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, bottom: 115),
                    child: Text(
                      widget.controller.currentUserStore.currentUser.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              if (_isDisplayDesktop)
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 8, bottom: 90),
                    child: Text(
                      'hvn.one/user_name',
                      style: TextStyle(
                        color: Color(0xFF8E8F99),
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              const Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 8, bottom: 60),
                  child: Divider(
                    color: Color(0xFF525366),
                    thickness: 1,
                    indent: 0,
                  ),
                ),
              ),
              Align(
                alignment: FractionalOffset.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: FlatButton(
                    onPressed: () async {
                      await widget.controller.tempLogoutDesktop();
                    },
                    child: Row(
                      children: [
                        Tooltip(
                          message: 'Log out',
                          child: HomeImageAssets.desktopLogoutIcon,
                        ),
                        if (_isDisplayDesktop) ...[
                          const SizedBox(width: 12),
                          const Text(
                            Strings.logout,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ), //
                          ),
                        ]
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        FocusTraversalGroup(
          policy: OrderedTraversalPolicy(),
          child: Expanded(
            child: RotatedBox(
              quarterTurns: 3,
              child: TabBarView(
                controller: _tabController,
                children: [
                  for (final widget in _buildTabViews())
                    RotatedBox(quarterTurns: 1, child: widget)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabCount, vsync: this)
      ..addListener(() => setState(() {}));
    _tabController.index = 1;
  }

  List<Widget> _buildTabs({
    BuildContext context,
    bool isVertical = false,
  }) {
    return [
      DesktopTab(
        titleText: isDisplayDesktop(context)
            ? const Text('Creator Policy')
            : const Text(''),
        tooltipMessage: 'Desktop Policy',
        image: HomeImageAssets.desktopPolicyIcon,
        tabIndex: 0,
        tabController: _tabController,
        isVertical: isVertical,
      ),
      DesktopTab(
        titleText: isDisplayDesktop(context)
            ? const Text('Manage Content')
            : const Text(''),
        tooltipMessage: 'Manage Content',
        image: HomeImageAssets.desktopManageIcon,
        tabIndex: 1,
        tabController: _tabController,
        isVertical: isVertical,
      ),
    ];
  }

  List<Widget> _buildTabViews() {
    return [
      const DesktopCreatorPolicy(),
      const DesktopManageContentPage(),
    ];
  }
}
