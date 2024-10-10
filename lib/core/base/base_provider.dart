import 'package:flutter/foundation.dart';

abstract class BaseProvider<UiState> extends ChangeNotifier {
  @protected
  UiState onInitUiState();

  late UiState _uiState;

  BaseProvider() {
    _uiState = onInitUiState();
  }

  UiState get uiState => _uiState;

  void _updateState(UiState newState) {
    _uiState = newState;
    notifyListeners();
  }

  void setState(void Function(UiState) reducer) {
    reducer(_uiState);
    _updateState(_uiState);
  }
}
