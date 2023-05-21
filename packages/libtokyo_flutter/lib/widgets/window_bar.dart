import 'package:libtokyo/libtokyo.dart' as libtokyo;
import 'package:flutter/material.dart';

class WindowBar extends StatelessWidget implements libtokyo.WindowBar<Key, Widget> {
  const WindowBar({
    super.key,
    this.leading,
    this.title,
    this.onMinimize,
    this.onMaximize,
    this.onClose,
  });

  final Widget? leading;
  final Widget? title;
  final VoidCallback? onMinimize;
  final VoidCallback? onMaximize;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    final height = AppBar.preferredHeightFor(context, Size.fromHeight(kToolbarHeight)) / 2;
    final iconSize = ((IconTheme.of(context).size ?? 24) / height) * 15;

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      leading: leading != null ?
        Padding(
          padding: EdgeInsets.all((height - iconSize) / 4),
          child: leading!,
        ) : null,
      title: title,
      titleTextStyle: Theme.of(context).textTheme.labelMedium,
      toolbarHeight: height,
      actions: [
        IconButton(
          icon: const Icon(Icons.minimize),
          iconSize: iconSize,
          tooltip: 'Minimize',
          onPressed: onMinimize ?? () {},
        ),
        IconButton(
          icon: const Icon(Icons.maximize),
          iconSize: iconSize,
          tooltip: 'Mazimize',
          onPressed: onMaximize ?? () {},
        ),
        IconButton(
          icon: const Icon(Icons.close),
          iconSize: iconSize,
          tooltip: 'Close',
          onPressed: onClose ?? () {},
        ),
      ],
    );
  }
}
