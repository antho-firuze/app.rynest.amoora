import 'package:amoora/features/emergency/views/emergency_view.dart';
import 'package:amoora/utils/page_utils.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:amoora/localization/string_hardcoded.dart';
import 'package:amoora/core/app_color.dart';

// Stateful navigation based on:
// https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
class RouterDashboard extends StatelessWidget {
  const RouterDashboard({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('RouterDashboard'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    if (size.width < 450) {
      return ScaffoldWithNavigationBar(
        body: navigationShell,
        currentIndex: navigationShell.currentIndex,
        onDestinationSelected: _goBranch,
      );
    } else {
      return ScaffoldWithNavigationRail(
        body: navigationShell,
        currentIndex: navigationShell.currentIndex,
        onDestinationSelected: _goBranch,
      );
    }
  }
}

class ScaffoldWithNavigationBar extends StatelessWidget {
  const ScaffoldWithNavigationBar({
    super.key,
    required this.body,
    required this.currentIndex,
    required this.onDestinationSelected,
  });
  final Widget body;
  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaler: const TextScaler.linear(.7),
      ),
      child: Scaffold(
        body: body,
        floatingActionButton: AvatarGlow(
          glowColor: oRed,
          child: FloatingActionButton(
            onPressed: () => context.goto(page: const EmergencyView()),
            backgroundColor: primaryLight,
            shape: CircleBorder(
              side: BorderSide(
                color: Colors.red.shade700,
                width: 7,
              ),
            ),
            elevation: 0,
            child: AvatarGlow(
              child: const Icon(
                Icons.sos,
                color: oWhite,
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: NavigationBar(
          height: 55,
          indicatorShape: const CircleBorder(eccentricity: 1.0),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          indicatorColor: Colors.transparent,
          selectedIndex: currentIndex,
          destinations: [
            NavigationDestination(
              icon: const Icon(Icons.home_outlined),
              selectedIcon: const Icon(Icons.home),
              label: 'Home'.hardcoded,
            ),
            // NavigationDestination(
            //   icon: const Icon(Icons.message_outlined),
            //   selectedIcon: const Icon(Icons.message),
            //   label: 'Pesan'.hardcoded,
            // ),
            NavigationDestination(
              icon: Container(),
              label: '',
              enabled: false,
            ),
            // NavigationDestination(
            //   icon: const Icon(Icons.notifications_outlined),
            //   selectedIcon: const Icon(Icons.notifications),
            //   label: 'Alert'.hardcoded,
            // ),
            NavigationDestination(
              icon: const Icon(Icons.person_outline),
              selectedIcon: const Icon(Icons.person),
              label: 'Akun'.hardcoded,
            ),
          ],
          onDestinationSelected: onDestinationSelected,
        ),
      ),
    );
  }
}

class ScaffoldWithNavigationRail extends StatelessWidget {
  const ScaffoldWithNavigationRail({
    super.key,
    required this.body,
    required this.currentIndex,
    required this.onDestinationSelected,
  });
  final Widget body;
  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaler: const TextScaler.linear(.7),
      ),
      child: Scaffold(
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: currentIndex,
              onDestinationSelected: onDestinationSelected,
              labelType: NavigationRailLabelType.all,
              destinations: <NavigationRailDestination>[
                NavigationRailDestination(
                  icon: const Icon(Icons.home_outlined),
                  selectedIcon: const Icon(Icons.home),
                  label: Text('Home'.hardcoded),
                ),
                // NavigationRailDestination(
                //   icon: const Icon(Icons.message_outlined),
                //   selectedIcon: const Icon(Icons.message),
                //   label: Text('Pesan'.hardcoded),
                // ),
                NavigationRailDestination(
                  icon: GestureDetector(
                    onTap: () => context.push('/emergency'),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.red.shade700,
                          width: 7,
                        ),
                      ),
                      child: const CircleAvatar(
                        backgroundColor: primaryLight,
                        child: Icon(
                          Icons.sos,
                          color: oWhite,
                        ),
                      ),
                    ),
                  ),
                  label: Container(),
                  disabled: true,
                ),
                // NavigationRailDestination(
                //   icon: const Icon(Icons.notifications_outlined),
                //   selectedIcon: const Icon(Icons.notifications),
                //   label: Text('Alert'.hardcoded),
                // ),
                NavigationRailDestination(
                  icon: const Icon(Icons.person_outline),
                  selectedIcon: const Icon(Icons.person),
                  label: Text('Akun'.hardcoded),
                ),
              ],
            ),
            const VerticalDivider(thickness: 1, width: 1),
            // This is the main content.
            Expanded(
              child: body,
            ),
          ],
        ),
      ),
    );
  }
}
