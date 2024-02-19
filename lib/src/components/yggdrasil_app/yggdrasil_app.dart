// ignore_for_file: avoid-dynamic

import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

// TODO(DEV-3148): Probably need to update all theme properties when updating
// the theme generation.
/// An application that uses Yggdrasil Design.
class YggdrasilApp extends StatefulWidget {
  const YggdrasilApp({
    super.key,
    this.navigatorKey,
    this.scaffoldMessengerKey,
    this.snackBarManagerKey,
    this.home,
    this.routes = const <String, WidgetBuilder>{},
    this.initialRoute,
    this.onGenerateRoute,
    this.onGenerateInitialRoutes,
    this.onUnknownRoute,
    this.onNavigationNotification,
    this.navigatorObservers = const <NavigatorObserver>[],
    this.builder,
    this.title = '',
    this.onGenerateTitle,
    this.color,
    this.theme,
    this.darkTheme,
    this.highContrastTheme,
    this.highContrastDarkTheme,
    this.themeMode = ThemeMode.system,
    this.themeAnimationDuration = kThemeAnimationDuration,
    this.themeAnimationCurve = Curves.linear,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.showPerformanceOverlay = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.shortcuts,
    this.actions,
    this.restorationScopeId,
    this.scrollBehavior,
  });

  /// A key to use when building the [Navigator].
  final GlobalKey<NavigatorState>? navigatorKey;

  /// A key to use when building the [ScaffoldMessenger].
  final GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey;

  /// A key to use when building the [YgSnackBarManager].
  final GlobalKey<YgSnackBarManagerState>? snackBarManagerKey;

  /// The widget for the default route of the app ([Navigator.defaultRouteName],
  /// which is /).
  final Widget? home;

  /// The application's top-level routing table.
  final Map<String, WidgetBuilder>? routes;

  /// The name of the first route to show, if a [Navigator] is built.
  final String? initialRoute;

  /// The route generator callback used when the app is navigated to a named
  /// route.
  final RouteFactory? onGenerateRoute;

  /// The routes generator callback used for generating initial routes if
  /// [initialRoute] is provided.
  final InitialRouteListFactory? onGenerateInitialRoutes;

  /// Called when [onGenerateRoute] fails to generate a route, except for the
  /// [initialRoute].
  final RouteFactory? onUnknownRoute;

  /// The callback to use when receiving a [NavigationNotification].
  final NotificationListenerCallback<NavigationNotification>? onNavigationNotification;

  /// The list of observers for the [Navigator] created for this app.
  final List<NavigatorObserver>? navigatorObservers;

  /// A builder for inserting widgets above the [Navigator] or - when the
  /// [WidgetsApp.router] constructor is used - above the [Router] but below the
  /// other widgets created by the [WidgetsApp] widget, or for replacing the
  /// [Navigator]/[Router] entirely.
  final TransitionBuilder? builder;

  /// A one-line description used by the device to identify the app for the user.
  final String title;

  /// If non-null this callback function is called to produce the app's title
  /// string, otherwise [title] is used.
  final GenerateAppTitle? onGenerateTitle;

  /// Default visual properties, like colors fonts and shapes, for this app's
  /// [Material] widgets.
  final ThemeData? theme;

  /// The [ThemeData] to use when a 'dark mode' is requested by the system.
  final ThemeData? darkTheme;

  /// The [ThemeData] to use when 'high contrast' is requested by the system.
  final ThemeData? highContrastTheme;

  /// The [ThemeData] to use when a 'dark mode' and 'high contrast' is requested
  /// by the system.
  final ThemeData? highContrastDarkTheme;

  /// Determines which theme will be used by the application if both [theme] and
  /// [darkTheme] are provided.
  final ThemeMode? themeMode;

  /// The duration of animated theme changes.
  final Duration themeAnimationDuration;

  /// The curve to apply when animating theme changes.
  final Curve themeAnimationCurve;

  /// The primary color to use for the application in the operating system
  /// interface.
  final Color? color;

  /// The initial locale for this app's [Localizations] widget is based on this
  /// value.
  final Locale? locale;

  /// The delegates for this app's [Localizations] widget.
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;

  /// This callback is responsible for choosing the app's locale when the app is
  /// started, and when the user changes the device's locale.
  final LocaleListResolutionCallback? localeListResolutionCallback;

  /// The signature of [WidgetsApp.localeResolutionCallback].
  final LocaleResolutionCallback? localeResolutionCallback;

  /// The list of locales that this app has been localized for.
  final Iterable<Locale> supportedLocales;

  /// Turns on a performance overlay.
  final bool showPerformanceOverlay;

  /// Turns on checkerboarding of raster cache images.
  final bool checkerboardRasterCacheImages;

  /// Turns on checkerboarding of layers rendered to offscreen bitmaps.
  final bool checkerboardOffscreenLayers;

  /// Turns on an overlay that shows the accessibility information reported by
  /// the framework.
  final bool showSemanticsDebugger;

  /// Turns on a little "DEBUG" banner in debug mode to indicate that the app is
  /// in debug mode. This is on by default (in debug mode), to turn it off, set
  /// the constructor argument to false. In release mode this has no effect.
  final bool debugShowCheckedModeBanner;

  /// The default map of keyboard shortcuts to intents for the application.
  final Map<ShortcutActivator, Intent>? shortcuts;

  /// The default map of intent keys to actions for the application.
  final Map<Type, Action<Intent>>? actions;

  /// The identifier to use for state restoration of this app.
  final String? restorationScopeId;

  /// The default [ScrollBehavior] for the application.
  final ScrollBehavior? scrollBehavior;

  @override
  State<YggdrasilApp> createState() => _YggdrasilAppState();
}

class _YggdrasilAppState extends State<YggdrasilApp> {
  late HeroController _heroController;

  static const TextStyle _errorTextStyle = TextStyle(
    color: Color(0xD0FF0000),
    fontFamily: 'monospace',
    fontSize: 48.0,
    fontWeight: FontWeight.w900,
    decoration: TextDecoration.underline,
    decorationColor: Color(0xFFFFFF00),
    decorationStyle: TextDecorationStyle.double,
    debugLabel: 'fallback style; consider putting your text in a Material',
  );

  @override
  void initState() {
    super.initState();
    _heroController = MaterialApp.createMaterialHeroController();
  }

  @override
  void dispose() {
    _heroController.dispose();
    super.dispose();
  }

  // Combine the Localizations for Material with the ones contributed
  // by the localizationsDelegates parameter, if any. Only the first delegate
  // of a particular LocalizationsDelegate.type is loaded so the
  // localizationsDelegate parameter can be used to override
  // _MaterialLocalizationsDelegate.
  Iterable<LocalizationsDelegate<dynamic>> get _localizationsDelegates {
    return <LocalizationsDelegate<dynamic>>[
      if (widget.localizationsDelegates != null) ...widget.localizationsDelegates!,
      DefaultMaterialLocalizations.delegate,
      DefaultCupertinoLocalizations.delegate,
    ];
  }

  Widget _inspectorSelectButtonBuilder(BuildContext context, VoidCallback onPressed) {
    return YgIconButton(
      onPressed: onPressed,
      icon: YgIcons.search,
    );
  }

  // TODO(DEV-3148): Rewrite this when the new theme generation is done.
  ThemeData _themeBuilder(BuildContext context) {
    ThemeData? theme;
    // Resolve which theme to use based on brightness and high contrast.
    final ThemeMode mode = widget.themeMode ?? ThemeMode.system;
    final Brightness platformBrightness = MediaQuery.platformBrightnessOf(context);
    final bool useDarkTheme =
        mode == ThemeMode.dark || (mode == ThemeMode.system && platformBrightness == ui.Brightness.dark);
    final bool highContrast = MediaQuery.highContrastOf(context);
    if (useDarkTheme && highContrast && widget.highContrastDarkTheme != null) {
      theme = widget.highContrastDarkTheme;
    } else if (useDarkTheme && widget.darkTheme != null) {
      theme = widget.darkTheme;
    } else if (highContrast && widget.highContrastTheme != null) {
      theme = widget.highContrastTheme;
    }
    theme ??= widget.theme ?? ThemeData.light();

    return theme;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = _themeBuilder(context);
    final Color effectiveSelectionColor =
        theme.textSelectionTheme.selectionColor ?? theme.colorScheme.primary.withOpacity(0.40);
    final Color effectiveCursorColor = theme.textSelectionTheme.cursorColor ?? theme.colorScheme.primary;

    // TODO(Tim): This in the future should be updated to something else, not
    // sure what yet.
    final Color materialColor = widget.color ?? widget.theme?.primaryColor ?? Colors.blue;

    return ScrollConfiguration(
      behavior: widget.scrollBehavior ?? const MaterialScrollBehavior(),
      child: HeroControllerScope(
        controller: _heroController,
        child: WidgetsApp(
          key: GlobalObjectKey(this),
          navigatorKey: widget.navigatorKey,
          navigatorObservers: widget.navigatorObservers!,
          pageRouteBuilder: <T>(RouteSettings settings, WidgetBuilder builder) => MaterialPageRoute<T>(
            settings: settings,
            builder: builder,
          ),
          home: widget.home,
          routes: widget.routes!,
          initialRoute: widget.initialRoute,
          onGenerateRoute: widget.onGenerateRoute,
          onGenerateInitialRoutes: widget.onGenerateInitialRoutes,
          onUnknownRoute: widget.onUnknownRoute,
          onNavigationNotification: widget.onNavigationNotification,
          title: widget.title,
          onGenerateTitle: widget.onGenerateTitle,
          textStyle: _errorTextStyle,
          color: materialColor,
          locale: widget.locale,
          localizationsDelegates: _localizationsDelegates,
          localeResolutionCallback: widget.localeResolutionCallback,
          localeListResolutionCallback: widget.localeListResolutionCallback,
          supportedLocales: widget.supportedLocales,
          showPerformanceOverlay: widget.showPerformanceOverlay,
          checkerboardRasterCacheImages: widget.checkerboardRasterCacheImages,
          checkerboardOffscreenLayers: widget.checkerboardOffscreenLayers,
          showSemanticsDebugger: widget.showSemanticsDebugger,
          debugShowCheckedModeBanner: widget.debugShowCheckedModeBanner,
          inspectorSelectButtonBuilder: _inspectorSelectButtonBuilder,
          shortcuts: widget.shortcuts,
          actions: widget.actions,
          restorationScopeId: widget.restorationScopeId,
          builder: (BuildContext context, Widget? child) {
            return Focus(
              canRequestFocus: false,
              child: ScaffoldMessenger(
                key: widget.scaffoldMessengerKey,
                child: DefaultSelectionStyle(
                  selectionColor: effectiveSelectionColor,
                  cursorColor: effectiveCursorColor,
                  child: AnimatedTheme(
                    data: theme,
                    duration: widget.themeAnimationDuration,
                    curve: widget.themeAnimationCurve,
                    child: YgSnackBarManager(
                      key: widget.snackBarManagerKey,
                      child: _maybeWrapWithBuilder(
                        child!,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _maybeWrapWithBuilder(Widget child) {
    final TransitionBuilder? builder = widget.builder;

    if (builder == null) {
      return child;
    }

    return Builder(
      builder: (BuildContext context) {
        return builder(
          context,
          child,
        );
      },
    );
  }
}
