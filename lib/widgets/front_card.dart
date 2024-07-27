import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tarotflash/models/tarot_model.dart';
import 'package:tarotflash/ui/dark_cat_theme.dart';

class FrontCard extends StatelessWidget {
  final TarotModel card;
  final bool isRotated;

  const FrontCard({
    super.key,
    required this.card,
    required this.isRotated,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      fit: BoxFit.contain,
      card.imageName,
      colorFilter: const ColorFilter.mode(
        DarkCatTheme.green,
        BlendMode.srcIn,
      ),
    );
  }
}
