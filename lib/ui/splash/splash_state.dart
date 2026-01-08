part of 'splash_cubit.dart';

class SplashState extends Equatable {
  final FlutterLogoStyle logoStyle;
  final String? target;

  const SplashState({
    this.logoStyle = FlutterLogoStyle.horizontal,
    this.target,
  });

  SplashState copyWith({
    final FlutterLogoStyle? logoStyle,
    final String? target,
  }) {
    return SplashState(
      logoStyle: logoStyle ?? this.logoStyle,
      target: target ?? this.target,
    );
  }

  @override
  List<Object?> get props => [
    logoStyle,
    target,
  ];
}
