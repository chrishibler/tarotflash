import 'package:flutter/material.dart';
import 'package:tarotflash/models/tarot_model.dart';
import 'package:tarotflash/widgets/front_card.dart';
import 'package:tarotflash/widgets/rear_card.dart';

class CardContainer extends StatefulWidget {
  final TarotModel card;
  final bool isRotated;
  final bool isFront;
  final void Function() onTap;
  final Animation<double> rotateAnimation;

  const CardContainer({
    super.key,
    required this.card,
    required this.isRotated,
    required this.isFront,
    required this.onTap,
    required this.rotateAnimation,
  });

  @override
  State<CardContainer> createState() => _CardContainerState();
}

class _CardContainerState extends State<CardContainer> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    const scaleFactor = 0.6;
    final double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        color: Colors.transparent,
        height: screenHeight * scaleFactor,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 222),
          transitionBuilder: (child, animation) {
            return ScaleTransition(scale: animation, child: child);
          },
          child: widget.isFront
              ? RotationTransition(
                  turns: widget.rotateAnimation,
                  child: FrontCard(
                    card: widget.card,
                    isRotated: widget.isRotated,
                  ),
                )
              : RearCard(
                  card: widget.card,
                  isRotated: widget.isRotated,
                ),
        ),
      ),
    );
  }
}
