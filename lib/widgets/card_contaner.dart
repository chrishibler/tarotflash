import 'package:flutter/material.dart';
import 'package:tarotflash/models/tarot_model.dart';
import 'package:tarotflash/widgets/front_card.dart';
import 'package:tarotflash/widgets/rear_card.dart';

class CardContainer extends StatefulWidget {
  final TarotModel card;

  const CardContainer({super.key, required this.card});

  @override
  State<CardContainer> createState() => _CardContainerState();
}

class _CardContainerState extends State<CardContainer> {
  bool isFront = true;

  @override
  void initState() {
    super.initState();
    isFront = true;
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () => setState(() => isFront = !isFront),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 666),
        child: isFront
            ? FrontCard(card: widget.card, height: screenHeight * 0.7)
            : RearCard(card: widget.card, height: screenHeight * 0.7),
      ),
    );
  }
}
