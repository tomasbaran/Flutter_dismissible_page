import 'package:flutter/cupertino.dart';

class TransparentRoute<T> extends PageRoute<T> with CupertinoRouteTransitionMixin<T> {
  final WidgetBuilder builder;

  @override
  final String? title;

  /// Builds the primary contents of the route.
  @override
  final bool maintainState;
  final Color backgroundColor;
  final Duration transitionDuration;
  final Duration reverseTransitionDuration;

  TransparentRoute({
    required this.builder,
    required this.backgroundColor,
    required this.transitionDuration,
    required this.reverseTransitionDuration,
    this.title,
    RouteSettings? settings,
    this.maintainState = true,
    bool fullscreenDialog = true,
  }) : super(settings: settings, fullscreenDialog: fullscreenDialog);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      FadeTransition(opacity: animation, child: child);

  @override
  Color get barrierColor => backgroundColor;

  @override
  Widget buildContent(BuildContext context) => builder(context);

  @override
  String get debugLabel => '${super.debugLabel}(${settings.name})';

  @override
  bool get barrierDismissible => true;

  @override
  bool get opaque => false;
}
