import 'package:flutter/material.dart';
import 'package:genware/src/extension/app_animation_extension.dart';
import 'package:genware/src/feature/onboarding/widgets/dot_indicator.dart';
import 'package:genware/src/theme/app_color_theme.dart';
import 'package:genware/src/theme/app_text_theme.dart';

class OnboardingLayout extends StatefulWidget {
  const OnboardingLayout({
    Key? key,
    required this.items,
    this.finishButtonArea,
    this.nextButtonTitle,
    this.onSkip,
    this.onNext,
  }) : super(key: key);

  final List<CustomOnBoardItem> items;
  final VoidCallback? onNext;
  final Widget? finishButtonArea;
  final String? nextButtonTitle;
  final VoidCallback? onSkip;

  @override
  State<OnboardingLayout> createState() => _OnboardingLayoutState();
}

class _OnboardingLayoutState extends State<OnboardingLayout> {
  late final PageController _pageController;
  int _activeIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: _activeIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          ..._background,
          PageView(
            controller: _pageController,
            physics: const BouncingScrollPhysics(),
            onPageChanged: (i) => setState(() => _activeIndex = i),
            children: List.generate(
              widget.items.length,
              (index) => const SizedBox(
                height: double.infinity,
                width: double.infinity,
              ),
            ),
          ),
          _body,
        ],
      ),
    );
  }

  List<Widget> get _background => [
        ...List.generate(
          widget.items.length,
          (index) => Image.asset(
            widget.items[index].imagePath,
            fit: BoxFit.cover,
          ).effectOpacity(
            opacity: _activeIndex == index ? 1 : 0,
          ),
        ),
        Container(
          color: AppColorTheme.pureBlack.withOpacity(0.08),
        ),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0x00001012),
                AppColorTheme.pureBlack,
              ],
            ),
          ),
        ),
      ];

  Widget get _body => SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (_activeIndex != 0) ...[
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Text(
                  '#MOVEYOURMIND',
                  style: context.appTextTheme.h2
                      ?.copyWith(color: AppColorTheme.pureWhite),
                ),
              )
            ] else ...[
              const Expanded(child: SizedBox()),
              Expanded(
                flex: 2,
                child: Image.asset(
                  'assets/logo.png',
                  height: 48,
                  width: 171,
                ),
              ),
            ],
            const SizedBox(
              height: 20,
            ),
            Container(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _textBody,
                if (_activeIndex != 0)
                  const SizedBox(
                    height: 50,
                  ),
                _indicatorAndButton,
                _nextButton
              ],
            ),
          ],
        ),
      );

  Padding get _textBody => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.items[_activeIndex].title,
              style: context.appTextTheme.h1?.copyWith(
                  color: _activeIndex != 0
                      ? AppColorTheme.green
                      : AppColorTheme.pureWhite,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 8),
            Builder(
              builder: (context) {
                return Text(
                  widget.items[_activeIndex].content,
                  style: _activeIndex != 0
                      ? context.appTextTheme.body
                          ?.copyWith(color: AppColorTheme.pureWhite)
                      : context.appTextTheme.hero?.copyWith(
                          color: AppColorTheme.green,
                          fontWeight: FontWeight.w700,
                          fontSize: 40,
                          fontStyle: FontStyle.italic,
                        ),
                );
              },
            ),
          ],
        ),
      );

  Widget get _indicatorAndButton => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 32,
          horizontal: 24,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DotIndicator(
              activeIndex: _activeIndex,
              activeColor: AppColorTheme.green,
              pageLength: widget.items.length,
              radius: 8,
            ),
          ],
        ),
      );

  Widget get _nextButton => SizedBox(
        height: 54,
        child: FractionallySizedBox(
          widthFactor: 0.9,
          child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(27),
                ),
              ),
              backgroundColor: MaterialStateProperty.all(AppColorTheme.green),
            ),
            child: Text(
              widget.nextButtonTitle ?? '',
              style: context.appTextTheme.body
                  ?.copyWith(color: AppColorTheme.pureBlack),
            ),
            onPressed: () {
              if (_activeIndex != widget.items.length - 1) {
                setState(() {
                  _pageController.jumpToPage(_activeIndex + 1);
                });
              }
            },
          ),
        ),
      );
}

class CustomOnBoardItem {
  CustomOnBoardItem({
    required this.imagePath,
    required this.title,
    required this.content,
  });

  final String imagePath;
  final String title;
  final String content;
}
