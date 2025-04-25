import '../../../generated/l10n.dart';

class UtilGlobals {
  static String formatDateDayAndMothAndYear({required DateTime date}) {
    final String day = date.day.toString().padLeft(2, '0');
    final String month = date.month.toString().padLeft(2, '0');
    final int year = date.year;

    return '$day ${numeroAMesShort(int.parse(month))} ${S.current.ofOf} $year';
  }

  static String numeroAMesShort(int numero) {
    final List<String> meses = <String>[
      'ene',
      'feb',
      'mar',
      'abr',
      'may',
      'jun',
      'jul',
      'ago',
      'sept',
      'oct',
      'nov',
      'dic',
    ];

    if (numero < 1 || numero > 12) {
      return 'ene';
    }

    return meses[numero - 1];
  }
}
