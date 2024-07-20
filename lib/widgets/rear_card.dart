import 'package:flutter/material.dart';
import 'package:tarotflash/models/tarot_model.dart';
import 'package:tarotflash/ui/dark_cat_theme.dart';

class RearCard extends StatelessWidget {
  final TarotModel card;
  final double height;

  const RearCard({super.key, required this.card, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: height,
      child: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            card.meaning,
            style: DarkCatTheme.body.copyWith(fontSize: 36),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis, // Handle overflow if needed
            maxLines: 5, // Adjust according to your needs
            softWrap: true, // Enable text wrapping
          ),
        ),
      ),
    );
  }
}
