import '/import.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '/views/slides.dart';

class OnBoardingPage extends HookConsumerWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth0Notifier = ref.watch(auth0NotifierProvider.notifier);
    Slides slides = Slides();

    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/images/icons/logo.png", width: 160),
      ),
      body: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        pages: slides.generateSlides(),
        showNextButton: true,
        showSkipButton: false,
        doneColor: Theme.of(context).primaryColorLight,
        nextColor: Theme.of(context).primaryColorLight,
        dotsDecorator:
            DotsDecorator(activeColor: Theme.of(context).primaryColorLight),
        skip: const Text("Skip"),
        next: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              border: Border.all(
                  color: Theme.of(context).primaryColorLight, width: 2)),
          child: Center(
            child: Icon(
              Icons.navigate_next,
              size: 30,
              color: Theme.of(context).primaryColorLight,
            ),
          ),
        ),
        done: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 40,
                    offset: const Offset(4, 4))
              ]),
          child: const Center(
            child: Icon(
              Icons.done,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
        onDone: () {
          auth0Notifier.login();
        },
      ),
    );
  }
}