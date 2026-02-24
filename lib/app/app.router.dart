// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i7;
import 'package:flutter/material.dart';
import 'package:flutter_task_adeel/ui/bottom_sheets/notice/notice_sheet.dart'
    as _i5;
import 'package:flutter_task_adeel/ui/dialogs/info_alert/info_alert_dialog.dart'
    as _i6;
import 'package:flutter_task_adeel/ui/views/bundles/bundles_view.dart' as _i4;
import 'package:flutter_task_adeel/ui/views/main/main_view.dart' as _i3;
import 'package:flutter_task_adeel/ui/views/startup/startup_view.dart' as _i2;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i8;

class Routes {
  static const startupView = '/startup-view';

  static const mainView = '/';

  static const bundlesView = '/bundles-view';

  static const noticeSheet = '/notice-sheet';

  static const infoAlertDialog = '/info-alert-dialog';

  static const all = <String>{
    startupView,
    mainView,
    bundlesView,
    noticeSheet,
    infoAlertDialog,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.startupView,
      page: _i2.StartupView,
    ),
    _i1.RouteDef(
      Routes.mainView,
      page: _i3.MainView,
    ),
    _i1.RouteDef(
      Routes.bundlesView,
      page: _i4.BundlesView,
    ),
    _i1.RouteDef(
      Routes.noticeSheet,
      page: _i5.NoticeSheet,
    ),
    _i1.RouteDef(
      Routes.infoAlertDialog,
      page: _i6.InfoAlertDialog,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.StartupView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.StartupView(),
        settings: data,
      );
    },
    _i3.MainView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.MainView(),
        settings: data,
      );
    },
    _i4.BundlesView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.BundlesView(),
        settings: data,
      );
    },
    _i5.NoticeSheet: (data) {
      final args = data.getArgs<NoticeSheetArguments>(nullOk: false);
      return _i7.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            _i5.NoticeSheet(
                key: args.key,
                completer: args.completer,
                request: args.request),
        settings: data,
        transitionsBuilder: data.transition ??
            (context, animation, secondaryAnimation, child) {
              return child;
            },
      );
    },
    _i6.InfoAlertDialog: (data) {
      final args = data.getArgs<InfoAlertDialogArguments>(nullOk: false);
      return _i7.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            _i6.InfoAlertDialog(
                key: args.key,
                request: args.request,
                completer: args.completer),
        settings: data,
        transitionsBuilder: data.transition ??
            (context, animation, secondaryAnimation, child) {
              return child;
            },
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class NoticeSheetArguments {
  const NoticeSheetArguments({
    this.key,
    required this.completer,
    required this.request,
  });

  final _i7.Key? key;

  final dynamic Function(_i8.SheetResponse<dynamic>)? completer;

  final _i8.SheetRequest<dynamic> request;

  @override
  String toString() {
    return '{"key": "$key", "completer": "$completer", "request": "$request"}';
  }

  @override
  bool operator ==(covariant NoticeSheetArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.completer == completer &&
        other.request == request;
  }

  @override
  int get hashCode {
    return key.hashCode ^ completer.hashCode ^ request.hashCode;
  }
}

class InfoAlertDialogArguments {
  const InfoAlertDialogArguments({
    this.key,
    required this.request,
    required this.completer,
  });

  final _i7.Key? key;

  final _i8.DialogRequest<dynamic> request;

  final dynamic Function(_i8.DialogResponse<dynamic>) completer;

  @override
  String toString() {
    return '{"key": "$key", "request": "$request", "completer": "$completer"}';
  }

  @override
  bool operator ==(covariant InfoAlertDialogArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.request == request &&
        other.completer == completer;
  }

  @override
  int get hashCode {
    return key.hashCode ^ request.hashCode ^ completer.hashCode;
  }
}

extension NavigatorStateExtension on _i8.NavigationService {
  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMainView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.mainView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBundlesView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.bundlesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNoticeSheet({
    _i7.Key? key,
    required dynamic Function(_i8.SheetResponse<dynamic>)? completer,
    required _i8.SheetRequest<dynamic> request,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.noticeSheet,
        arguments: NoticeSheetArguments(
            key: key, completer: completer, request: request),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInfoAlertDialog({
    _i7.Key? key,
    required _i8.DialogRequest<dynamic> request,
    required dynamic Function(_i8.DialogResponse<dynamic>) completer,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.infoAlertDialog,
        arguments: InfoAlertDialogArguments(
            key: key, request: request, completer: completer),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMainView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.mainView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBundlesView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.bundlesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNoticeSheet({
    _i7.Key? key,
    required dynamic Function(_i8.SheetResponse<dynamic>)? completer,
    required _i8.SheetRequest<dynamic> request,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.noticeSheet,
        arguments: NoticeSheetArguments(
            key: key, completer: completer, request: request),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithInfoAlertDialog({
    _i7.Key? key,
    required _i8.DialogRequest<dynamic> request,
    required dynamic Function(_i8.DialogResponse<dynamic>) completer,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.infoAlertDialog,
        arguments: InfoAlertDialogArguments(
            key: key, request: request, completer: completer),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
