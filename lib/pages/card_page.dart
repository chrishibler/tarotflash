import 'package:flutter/material.dart';
import 'package:tarotflash/models/tarot_model.dart';
import 'package:tarotflash/ui/dark_cat_theme.dart';
import 'package:tarotflash/widgets/circle_button_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tarotflash/widgets/front_card.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  int currentIndex = 0;
  final List<TarotModel> cards = List.from(TarotModel.all)..shuffle();

  void _setNextModel() {
    setState(() {
      currentIndex++;
    });
  }

  void _setPreviousModel() {
    if (currentIndex == 0) return;
    setState(() {
      currentIndex--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FrontCard(card: cards[currentIndex]),
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
    );
  }
}
