import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BalanceService {
  final ValueNotifier<int> _currentBalance = ValueNotifier<int>(0);
  int _topUpValue = 0;

  static final BalanceService _instance = BalanceService._internal();

  factory BalanceService() {
    return _instance;
  }

  BalanceService._internal() {
    _loadBalance();
  }

  ValueNotifier<int> get balanceNotifier => _currentBalance;

  Future<void> addBalance(String topup) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _topUpValue = int.parse(topup);
    _currentBalance.value =
        (prefs.getInt('current-balance') ?? 0) + _topUpValue;
    prefs.setInt('current-balance', _currentBalance.value);
  }

  Future<void> _loadBalance() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _currentBalance.value = (prefs.getInt('current-balance') ?? 0);
  }

  String digitsFormater(int balance) {
    // https://stackoverflow.com/questions/62580280/how-to-format-numbers-as-thousands-separators-in-dart
    String balanceStr = balance.toString();
    String formatted = '';
    int counter = 0;
    for (int i = (balanceStr.length - 1); i >= 0; i--) {
      counter++;
      String str = balanceStr[i];
      if ((counter % 3) != 0 && i != 0) {
        formatted = "$str$formatted";
      } else if (i == 0) {
        formatted = "$str$formatted";
      } else {
        formatted = ".$str$formatted";
      }
    }
    return formatted.trim();
  }
}
