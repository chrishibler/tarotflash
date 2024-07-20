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

class _CardPageState extends State<CardPage> {
  int currentIndex = 0;
  bool isFront = true;
  final List<TarotModel> cards = List.from(TarotModel.all)..shuffle();

  @override
  void initState() {
    isFront = true;
    currentIndex = 0;
    super.initState();
  }

  void _setNextModel() {
    if (currentIndex == cards.length - 1) return;
    setState(() {
      currentIndex++;
      isFront = false;
    });
  }

  void _setPreviousModel() {
    if (currentIndex == 0) return;
    setState(() {
      currentIndex--;
      isFront = false;
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
              CardContainer(card: cards[currentIndex]),
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
}
