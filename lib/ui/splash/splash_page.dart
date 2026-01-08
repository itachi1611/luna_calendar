import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:luna_calendar/ui/splash/splash_cubit.dart';
import 'package:luna_calendar/utils/extensions/context_extension.dart';
import 'package:luna_calendar/utils/extensions/widget_extension.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late final SplashCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = SplashCubit()..init();
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: BlocListener<SplashCubit, SplashState>(
        listenWhen: (pre, cur) => pre.target != cur.target,
        listener: (context, state) {
          context.pushReplacement(state.target!);
        },
        child: Scaffold(
          body: Stack(
            children: [
              Positioned.fill(
                child: SizedBox(
                  width: context.widthPx / 3,
                  height: context.heightPx / 3,
                  child: BlocSelector<SplashCubit, SplashState, FlutterLogoStyle?>(
                    selector: (state) => state.logoStyle,
                    builder: (context, logoStyle) {
                      return FlutterLogo(
                        style: logoStyle!,
                      );
                    },
                  ),
                ).center,
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 50,
                child: Text('v1.0.0', textAlign: TextAlign.center),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
