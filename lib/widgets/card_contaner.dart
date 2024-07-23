import 'dart:math';

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
  bool isReversed = false;

  @override
  void initState() {
    super.initState();
    isFront = true;
  }

  void setIsReversed() {
    setState(() {
      isReversed = Random().nextBool();
    });
  }

  @override
  Widget build(BuildContext context) {
    const scaleFactor = 0.8;
    setIsReversed();
    final double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () => setState(() => isFront = !isFront),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 666),
        child: isFront
            ? FrontCard(
                card: widget.card,
                height: screenHeight * scaleFactor,
                isReversed: isReversed,
              )
            : RearCard(
                card: widget.card,
                height: screenHeight * scaleFactor,
                isReversed: isReversed,
              ),
      ),
    );
  }
}
