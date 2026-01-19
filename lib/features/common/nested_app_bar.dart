import 'package:flutter/material.dart';
import 'package:hiddify/features/common/adaptive_root_scaffold.dart';
import 'package:hiddify/utils/utils.dart';

// Desktop: always show drawer button
bool showDrawerButton(BuildContext context) => true;

class NestedAppBar extends StatelessWidget {
  const NestedAppBar({
    super.key,
    this.title,
    this.actions,
    this.pinned = true,
    this.forceElevated = false,
    this.bottom,
  });

  final Widget? title;
  final List<Widget>? actions;
  final bool pinned;
  final bool forceElevated;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    RootScaffold.canShowDrawer(context);

    return SliverAppBar(
      leading: (RootScaffold.stateKey.currentState?.hasDrawer ?? false) && showDrawerButton(context)
          ? DrawerButton(
              onPressed: () {
                RootScaffold.stateKey.currentState?.openDrawer();
              },
            )
          : (Navigator.of(context).canPop()
              ? IconButton(
                  icon: Icon(context.isRtl ? Icons.arrow_forward : Icons.arrow_back),
                  padding: EdgeInsets.only(right: context.isRtl ? 50 : 0),
                  onPressed: () {
                    Navigator.of(context).pop(); // Pops the current route off the navigator stack
                  },
                )
              : null),
      title: title,
      actions: actions,
      pinned: pinned,
      forceElevated: forceElevated,
      bottom: bottom,
    );
  }
}
