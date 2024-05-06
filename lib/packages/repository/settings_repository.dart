import '../data_provider/models.dart';
import '../data_provider/database_provider.dart';

import '../../objectbox.g.dart';

class SettingsRepository {
  SettingsRepository({
    required ObjectBoxDBProvider dbProvider,
  }) : _dbProvider = dbProvider;

  final ObjectBoxDBProvider _dbProvider;

  Future<bool> getSettings() async {
    List<UserSettings> settingsList = _dbProvider.userSettingsBox.getAll();

    if (settingsList.isEmpty) {
      await _createSettingsRecord();
      settingsList = _dbProvider.userSettingsBox.getAll();
    }

    UserSettings settings = settingsList.first;

    // print(settings);
    // var res = _dbProvider.userSettingsBox.removeAsync(1);

    return settings.darkMode;
  }

  Future<void> _createSettingsRecord() async {
    final initialSettings = UserSettings(darkMode: false);
    await _dbProvider.userSettingsBox.putAsync(initialSettings);
  }

  Future<void> toggleTheme() async {
    final settings = _dbProvider.userSettingsBox.getAll().first;
    settings.darkMode = !settings.darkMode;
    await _dbProvider.userSettingsBox.putAsync(settings);
  }
}
