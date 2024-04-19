import 'package:intl/intl.dart';

NumberFormat currencyDigitFormat =
    NumberFormat.currency(locale: 'fr_FR', symbol: '€');

NumberFormat currencyIntFormat = NumberFormat.currency(
    locale: 'fr_FR', symbol: '€', decimalDigits: 0, customPattern: "#,##0");
