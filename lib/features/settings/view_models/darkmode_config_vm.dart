import 'package:final_project_tiktok_clone/features/settings/models/darkmode_config_model.dart';
import 'package:final_project_tiktok_clone/features/settings/repos/darkmode_config_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DarkmodeConfigViewModel extends Notifier<DarkmodeConfigModel> {
  final DarkmodeConfigRepository _repository;

  DarkmodeConfigViewModel(this._repository);

  void setDark(bool value) {
    _repository.setDark(value);
    state = DarkmodeConfigModel(
      isDarkMode: value,
    );
  }

  @override
  DarkmodeConfigModel build() {
    return DarkmodeConfigModel(
      isDarkMode: _repository.isDark(),
    );
  }
}

final darkModeConfigProvider =
    NotifierProvider<DarkmodeConfigViewModel, DarkmodeConfigModel>(
  () => throw UnimplementedError(),
);
