import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:luna_calendar/common/app_images.dart';

import '../../generated/l10n.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  late final Future<List<PageViewModel>> _intros;

  @override
  void initState() {
    super.initState();

    _intros = Future.value(
        AppImages.intros.map((i) => PageViewModel(
          titleWidget: const SizedBox.shrink(),
          bodyWidget: const SizedBox.shrink(),
          backgroundImage: i,
        )).toList()
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PageViewModel>>(
      future: _intros,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: CircularProgressIndicator(),
          );
        }

        final intros = snapshot.data!;

        return IntroductionScreen(
          pages: intros,
          showNextButton: true,
          showDoneButton: true,
          isProgress: false,
          isProgressTap: false,
          skip: Text(S.current.btnSkip),
          done: Text(S.current.btnDone),
          next: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(S.current.btnNext),
              const Gap(10),
              Icon(Icons.navigate_next_rounded),
            ],
          ),
          onDone: () {
            // On button pressed
          },
          nextStyle: TextButton.styleFrom(
            foregroundColor: Colors.white,
            iconColor: Colors.white
          ),
          doneStyle: TextButton.styleFrom(
            foregroundColor: Colors.white,
          ),
        );
      },
    );
  }
}
