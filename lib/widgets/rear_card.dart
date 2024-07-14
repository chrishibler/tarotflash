import 'package:flutter/material.dart';
import 'package:tarotflash/models/tarot_model.dart';

class RearCard extends StatelessWidget {
  final TarotModel card;

  const RearCard({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Text(card.meaning);
  }
}
