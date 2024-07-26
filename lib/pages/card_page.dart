import 'package:flutter/material.dart';
import 'package:tarotflash/models/tarot_model.dart';
import 'package:tarotflash/ui/dark_cat_theme.dart';
import 'package:tarotflash/widgets/card_contaner.dart';
import 'package:tarotflash/widgets/circle_button_style.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 666),
    vsync: this,
  );
  late final Animation<double> _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  int currentIndex = 0;
  bool isRotated = false;
  bool isFront = true;
  final List<TarotModel> cards = List.from(TarotModel.all)..shuffle();

  @override
  void initState() {
    super.initState();
    _controller.forward();
  }

  void _setNextModel() {
    if (currentIndex == cards.length - 1) return;
    _controller.reset();
    _controller.forward();
    setState(() {
      isRotated = false;
      isFront = true;
      currentIndex++;
    });
  }

  void _setPreviousModel() {
    if (currentIndex == 0) return;
    _controller.reset();
    _controller.forward();
    setState(() {
      isRotated = false;
      isFront = true;
      currentIndex--;
    });
  }

  void _rotate() {
    setState(() {
      isFront = true;
      isRotated = !isRotated;
    });
  }

  void _flip() {
    setState(() {
      isFront = !isFront;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeTransition(
                opacity: _animation,
                child: CardContainer(
                  card: cards[currentIndex],
                  isRotated: isRotated,
                  isFront: isFront,
                  onTap: _flip,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    cards[currentIndex].name,
                    style: DarkCatTheme.heading,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text(cards[currentIndex].group, style: DarkCatTheme.body)],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: currentIndex == 0 ? null : _setPreviousModel,
                    style: circleButtonStyle,
                    child: const Icon(
                      Icons.skip_previous_rounded,
                      size: 60,
                    ),
                  ),
                  OutlinedButton(
                    onPressed: _rotate,
                    style: circleButtonStyle,
                    child: const Icon(
                      Icons.rotate_90_degrees_cw,
                      size: 48,
                    ),
                  ),
                  OutlinedButton(
                    onPressed: currentIndex == cards.length - 1 ? null : _setNextModel,
                    style: circleButtonStyle,
                    child: const Icon(
                      Icons.skip_next_rounded,
                      size: 60,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
