import 'package:bloc/bloc.dart';

// NOTE the import
import 'package:flutter_todo/packages/repository/settings_repository.dart';

import './settings_event.dart';
import './settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc({required SettingsRepository repository})
      : _repository = repository,
        super(const SettingsState()) {
    on<SettingsSubscriptionRequested>(_onSubscriptionRequested);
  }

  final SettingsRepository _repository;

  Future<void> _onSubscriptionRequested(
    SettingsSubscriptionRequested event,
    Emitter<SettingsState> emit,
  ) async {
    print("hello world");

    _repository.getUserSettings();
  }
}
