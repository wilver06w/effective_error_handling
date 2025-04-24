// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `No conexion`
  String get noConection {
    return Intl.message('No conexion', name: 'noConection', desc: '', args: []);
  }

  /// `Bievenido`
  String get welcome {
    return Intl.message('Bievenido', name: 'welcome', desc: '', args: []);
  }

  /// `Error {code} \nSi el error persiste, contacta a soporte`
  String weHaveAErrorContactSuport(Object code) {
    return Intl.message(
      'Error $code \nSi el error persiste, contacta a soporte',
      name: 'weHaveAErrorContactSuport',
      desc: '',
      args: [code],
    );
  }

  /// `Servicio no disponible`
  String get serviceNotAvailable {
    return Intl.message(
      'Servicio no disponible',
      name: 'serviceNotAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Pedido # {value}`
  String orderNumber(Object value) {
    return Intl.message(
      'Pedido # $value',
      name: 'orderNumber',
      desc: '',
      args: [value],
    );
  }

  /// `de`
  String get ofOf {
    return Intl.message('de', name: 'ofOf', desc: '', args: []);
  }

  /// `Buscar`
  String get search {
    return Intl.message('Buscar', name: 'search', desc: '', args: []);
  }

  /// `Detalles del archetype # {value}`
  String detailArchetype(Object value) {
    return Intl.message(
      'Detalles del archetype # $value',
      name: 'detailArchetype',
      desc: '',
      args: [value],
    );
  }

  /// `Cliente {value}`
  String clientValue(Object value) {
    return Intl.message(
      'Cliente $value',
      name: 'clientValue',
      desc: '',
      args: [value],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'es')];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
