import 'package:flutter/material.dart';
import 'package:tarotflash/models/tarot_model.dart';
import 'package:tarotflash/widgets/front_card.dart';
import 'package:tarotflash/widgets/rear_card.dart';

class CardContainer extends StatelessWidget {
  final TarotModel card;
  final bool isRotated;
  final bool isFront;
  final void Function() onTap;

  const CardContainer({
    super.key,
    required this.card,
    required this.isRotated,
    required this.isFront,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const scaleFactor = 0.8;
    final double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 666),
        child: isFront
            ? FrontCard(
                card: card,
                height: screenHeight * scaleFactor,
                isReversed: isRotated,
              )
            : RearCard(
                card: card,
                height: screenHeight * scaleFactor,
                isReversed: isRotated,
              ),
      ),
    );
  }
}
