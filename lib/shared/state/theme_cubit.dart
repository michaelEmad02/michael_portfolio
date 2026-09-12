import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constants/app_constants.dart';
import '../../core/services/storage_service.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  final StorageService _storageService;

  ThemeCubit(this._storageService) : super(_getInitialTheme(_storageService));

  static ThemeMode _getInitialTheme(StorageService storage) {
    final savedTheme = storage.getString(AppConstants.themeStorageKey);
    if (savedTheme == 'light') return ThemeMode.light;
    return ThemeMode.dark; // Dark by default as requested
  }

  void toggleTheme() {
    final nextTheme = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    _storageService.setString(
      AppConstants.themeStorageKey,
      nextTheme == ThemeMode.dark ? 'dark' : 'light',
    );
    emit(nextTheme);
  }

  void setTheme(ThemeMode mode) {
    _storageService.setString(
      AppConstants.themeStorageKey,
      mode == ThemeMode.dark ? 'dark' : 'light',
    );
    emit(mode);
  }

  bool get isDarkMode => state == ThemeMode.dark;
}
