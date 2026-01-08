import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:luna_calendar/services/db/storage_service.dart';

import '../../router/routers.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState());

  final _storage = StorageService();
  final _s2 = const Duration(seconds: 2);
  final _ms5 = const Duration(milliseconds: 500);

  Future<void> init() async {
    // Wait 2s then change the style of logo
    await _delay(_s2);
    emit(state.copyWith(logoStyle: FlutterLogoStyle.markOnly));
    await _delay(_s2);
    
    // After completed 2 phase of animation, then detect the first time onboarding
    final isFirstLaunch = await _isFirstLaunch();
    await _delay(_ms5);
    emit(state.copyWith(target: isFirstLaunch ? Routers.intro.routerPath : Routers.intro.routerPath));
  }
  
  Future<void> _delay(Duration delayTime) async {
    await Future.delayed(delayTime); 
  }
  
  Future<bool> _isFirstLaunch() async {
    // Detect first time onboard
    final firstLaunch = await _storage.read<bool>(StorageKey.firstLaunch, true) ?? true;
    if(firstLaunch) {
      await _storage.write(StorageKey.firstLaunch, false);
      return true;
    }
    return false;
  }
}
