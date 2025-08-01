import 'package:flutter/material.dart';
import 'package:flutter_practice/core/animation.dart';
import 'package:flutter_practice/destination.dart';
import 'package:flutter_practice/models/user.dart';
import 'package:flutter_practice/transitions/list_detail_transition.dart';
import 'package:flutter_practice/widget/email/email_list_view.dart';
import 'package:flutter_practice/widget/reply_list_view.dart';

class Feed extends StatefulWidget {
  const Feed({super.key, required this.currentUser});

  final User currentUser;

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> with SingleTickerProviderStateMixin {
  late final _colorScheme = Theme.of(context).colorScheme;
  late final _backgroundColor = Color.alphaBlend(
    _colorScheme.primary.withAlpha(36),
    _colorScheme.surface,
  );

  int selectedIndex = 0; // Add this variable
  late bool showNavigationDrawer;

  late final _controller = AnimationController(
    duration: const Duration(milliseconds: 1000),
    reverseDuration: const Duration(milliseconds: 1250),
    value: 0,
    vsync: this,
  );

  late final _railAnimation = RailAnimation(parent: _controller);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    double width = MediaQuery.of(context).size.width;
    Orientation deviceOrientation = MediaQuery.of(context).orientation;

    showNavigationDrawer = MediaQuery.of(context).size.width > 600;
    final AnimationStatus status = _controller.status;
    if (width > 600) {
      if (status != AnimationStatus.forward &&
          status != AnimationStatus.completed) {
        _controller.forward();
      }
    } else {
      if (status != AnimationStatus.reverse &&
          status != AnimationStatus.dismissed) {
        _controller.reverse();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          if (showNavigationDrawer)
            DisappearingNavigationRail(context, _backgroundColor),

          Expanded(
            child: Container(
              color: _backgroundColor,
              child: Expanded(
                child: Container(
                  color: _backgroundColor,
                  // Update from here ...
                  child: ListDetailTransition(
                    animation: _railAnimation,
                    one: EmailListView(
                      selectedIndex: selectedIndex,
                      onSelected: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      currentUser: widget.currentUser,
                    ),
                    two: const ReplyListView(),
                  ),
                  // ... to here.
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton:
          showNavigationDrawer
              ? null
              : FloatingActionButton(
                backgroundColor: _colorScheme.tertiaryContainer,
                foregroundColor: _colorScheme.onTertiaryContainer,
                onPressed: () {},
                child: const Icon(Icons.add),
              ),
      // Add from here...
      bottomNavigationBar:
          showNavigationDrawer ? null : DisappearingBottomNavigationBar(),
      // ...to here.
    );
  }

  // ignore: non_constant_identifier_names
  Widget DisappearingBottomNavigationBar() {
    return NavigationBar(
      elevation: 0,
      backgroundColor: Colors.white,
      selectedIndex: selectedIndex,
      onDestinationSelected: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
      indicatorColor: Colors.amber,
      destinations:
          destinations.map<NavigationDestination>((d) {
            return NavigationDestination(icon: Icon(d.icon), label: d.label);
          }).toList(),
    );
  }

  // ignore: non_constant_identifier_names
  Widget DisappearingNavigationRail(
    BuildContext context,
    Color backgroundColor,
  ) {
    return NavigationRail(
      // minWidth: 50,
      selectedIndex: selectedIndex,
      backgroundColor: _backgroundColor,
      useIndicator: true,
      indicatorColor: Colors.amber,
      onDestinationSelected: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
      leading: Column(
        children: [
          // FractionallySizedBox(widthFactor: 0.1,),
          IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
          SizedBox(height: 8),
          FloatingActionButton(
            backgroundColor: _colorScheme.tertiaryContainer,
            foregroundColor: _colorScheme.onTertiaryContainer,
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
        ],
      ),
      destinations:
          destinations.map<NavigationRailDestination>((destination) {
            return NavigationRailDestination(
              label: Text(destination.label),
              icon: Icon(destination.icon),
            );
          }).toList(),
    );
  }
}
