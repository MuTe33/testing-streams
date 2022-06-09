import 'dart:math';

import 'package:rxdart/rxdart.dart';

class NumberRepository {
  final _numberStream = PublishSubject<int>();

  Future<int> get number => _numberStream.first;

  void loadNumber() async {
    // websocket call, artifically delaying response
    await Future.delayed(const Duration(seconds: 3));

    final rn = Random();
    final number = rn.nextInt(100000000);

    _numberStream.add(number);
  }
}
