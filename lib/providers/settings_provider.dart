import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clear_weather/providers/service_providers.dart';

class AppSettings {
  final bool isMetric;

  AppSettings({this.isMetric = true});
}

class SettingsNotifier extends Notifier<AppSettings> {
  static const _isMetricKey = 'isMetric';

  @override
  AppSettings build() {
    _loadSettings();
    return AppSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await ref.watch(sharedPreferencesProvider.future);
    final isMetric = prefs.getBool(_isMetricKey) ?? true;
    state = AppSettings(isMetric: isMetric);
  }

  Future<void> _saveSettings(AppSettings settings) async {
    final prefs = await ref.watch(sharedPreferencesProvider.future);
    await prefs.setBool(_isMetricKey, settings.isMetric);
  }

  void toggleUnits() {
    state = AppSettings(isMetric: !state.isMetric);
    _saveSettings(state);
  }
}

final settingsProvider = NotifierProvider<SettingsNotifier, AppSettings>(
  SettingsNotifier.new,
);
