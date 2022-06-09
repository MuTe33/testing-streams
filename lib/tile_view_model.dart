import 'package:flutter/foundation.dart';
import 'package:streams/get_number_use_case.dart';

enum ViewState { loading, idle }

class TileViewModel extends ChangeNotifier {
  TileViewModel(this._getNumberUseCase);

  final GetNumberUseCase _getNumberUseCase;

  ViewState state = ViewState.idle;
  late int number;

  Future<void> onInit() async {
    _setLoading();

    number = await _getNumberUseCase.execute();

    _setIdle();
  }

  _setIdle() {
    state = ViewState.idle;
    notifyListeners();
  }

  _setLoading() {
    state = ViewState.loading;
    notifyListeners();
  }
}
