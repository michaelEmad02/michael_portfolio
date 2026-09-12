import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/app_constants.dart';
import '../../services/storage_service.dart';

class LocaleCubit extends Cubit<Locale> {
  final StorageService _storageService;

  LocaleCubit(this._storageService) : super(_getInitialLocale(_storageService));

  static Locale _getInitialLocale(StorageService storage) {
    final savedCode = storage.getString(AppConstants.localeStorageKey);
    if (savedCode == 'ar') return const Locale('ar');
    return const Locale('en');
  }

  void toggleLocale() {
    final nextCode = state.languageCode == 'en' ? 'ar' : 'en';
    setLocale(Locale(nextCode));
  }

  void setLocale(Locale locale) {
    _storageService.setString(AppConstants.localeStorageKey, locale.languageCode);
    emit(locale);
  }

  bool get isArabic => state.languageCode == 'ar';
}
