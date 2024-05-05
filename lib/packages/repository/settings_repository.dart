import '../data_provider/models.dart';
import '../data_provider/database_provider.dart';

class SettingsRepository {
  SettingsRepository({
    required ObjectBoxDBProvider dbProvider,
  }) : _dbProvider = dbProvider;

  final ObjectBoxDBProvider _dbProvider;

  void getUserSettings() {
    //
  }
}
