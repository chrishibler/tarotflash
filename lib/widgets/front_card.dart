import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tarotflash/models/tarot_model.dart';
import 'package:tarotflash/ui/dark_cat_theme.dart';

class FrontCard extends StatelessWidget {
  final TarotModel card;
  final double height;

  const FrontCard({super.key, required this.card, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: SvgPicture.asset(
        fit: BoxFit.contain,
        kIsWeb ? card.imageName : 'assets/${card.imageName}',
        colorFilter: const ColorFilter.mode(
          DarkCatTheme.green,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
