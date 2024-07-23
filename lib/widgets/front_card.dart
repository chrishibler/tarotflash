import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tarotflash/models/tarot_model.dart';
import 'package:tarotflash/ui/dark_cat_theme.dart';

class FrontCard extends StatelessWidget {
  final TarotModel card;
  final double height;
  final bool isReversed;

  const FrontCard({
    super.key,
    required this.card,
    required this.height,
    required this.isReversed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Transform.rotate(
        angle: isReversed ? pi : 0,
        child: SvgPicture.asset(
          fit: BoxFit.contain,
          card.imageName,
          colorFilter: const ColorFilter.mode(
            DarkCatTheme.green,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
