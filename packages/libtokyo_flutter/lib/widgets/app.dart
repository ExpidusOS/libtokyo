import 'package:libtokyo/libtokyo.dart' as libtokyo;
import 'package:libtokyo_flutter/logic.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart' show ColorScheme, MaterialApp, ThemeData, ThemeMode, CircularProgressIndicator;

class TokyoApp extends StatefulWidget implements libtokyo.TokyoApp<Key, Widget, Route, BuildContext> {
  const TokyoApp({
    super.key,
    this.title = '',
    this.theme,
    this.colorScheme,
    this.home,
    this.routerConfig,
    this.routerDelegate,
    this.builder,
    this.scrollBehavior,
    this.routes = const <String, WidgetBuilder>{},
  });

  final libtokyo.ThemeData? theme;
  final libtokyo.ColorScheme? colorScheme;
  final String title;
  final Widget? home;
  final RouterConfig? routerConfig;
  final RouterDelegate<Object>? routerDelegate;
  final TransitionBuilder? builder;
  final ScrollBehavior? scrollBehavior;
  final Map<String, WidgetBuilder> routes;

  @override
  State<TokyoApp> createState() => _TokyoAppState();
}

class _TokyoAppState extends State<TokyoApp> with libtokyo.TokyoAppState<Key, Widget, Route, BuildContext> {
  libtokyo.TokyoApp<Key, Widget, Route, BuildContext> get tokyoWidget => widget;

  Future<String> loadThemeJSON(libtokyo.ColorScheme colorScheme) =>
    rootBundle.loadString("packages/libtokyo/data/themes/${colorScheme.name}.json");

  Widget _tokyoBuilder(BuildContext context, Widget? child) {
    return DefaultSelectionStyle(
      child: widget.builder != null ?
        Builder(
          builder: (context) => widget.builder!(context, child),
        ) : child ?? const SizedBox.shrink(),
    );
  }

  @override
  Widget build(BuildContext context) =>
    FutureBuilder(
      future: updateTheme(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          FlutterError.reportError(FlutterErrorDetails(
            exception: snapshot.error!,
            library: 'libtokyo_flutter',
            context: ErrorSummary('Failed to update theme'),
          ));
        }

        if (snapshot.hasData) {
          return MaterialApp(
            routes: widget.routes,
            color: convertColor(snapshot.data!.backgroundColor),
            theme: convertThemeData(snapshot.data!),
            darkTheme: convertThemeData(snapshot.data!, Brightness.dark),
            title: widget.title,
            home: widget.home,
          );
        }

        return CircularProgressIndicator();
      },
    );
}
