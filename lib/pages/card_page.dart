import 'package:flutter/material.dart';
import 'package:tarotflash/models/tarot_model.dart';
import 'package:tarotflash/ui/dark_cat_theme.dart';
import 'package:tarotflash/widgets/card_contaner.dart';
import 'package:tarotflash/widgets/circle_button_style.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> with TickerProviderStateMixin {
  late final AnimationController _fadeController = AnimationController(
    duration: const Duration(milliseconds: 666),
    vsync: this,
  );
  late final Animation<double> _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(_fadeController);

  late final AnimationController _rotateController = AnimationController(
    duration: const Duration(milliseconds: 666),
    vsync: this,
  );
  late final Animation<double> _rotateAnimation = Tween<double>(begin: 0, end: 0.5).animate(
    CurvedAnimation(
      parent: _rotateController,
      curve: Curves.elasticInOut,
    ),
  );
  int _currentIndex = 0;
  bool _isRotated = false;
  bool _isFront = true;
  final List<TarotModel> _cards = List.from(TarotModel.all)..shuffle();

  @override
  void initState() {
    super.initState();
    _fadeController.forward();
  }

  void _setNextModel() {
    if (_currentIndex == _cards.length - 1) return;
    _fadeController.reset();
    _fadeController.forward();
    _rotateController.reset();
    setState(() {
      _isRotated = false;
      _isFront = true;
      _currentIndex++;
    });
  }

  void _setPreviousModel() {
    if (_currentIndex == 0) return;
    _fadeController.reset();
    _fadeController.forward();
    _rotateController.reset();
    setState(() {
      _isRotated = false;
      _isFront = true;
      _currentIndex--;
    });
  }

  void _rotate() {
    setState(() {
      _isFront = true;
      if (_isRotated) {
        _rotateController.reverse();
      } else {
        _rotateController.forward();
      }
      _isRotated = !_isRotated;
    });
  }

  void _flip() {
    setState(() {
      _isFront = !_isFront;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeTransition(
                opacity: _fadeAnimation,
                child: CardContainer(
                  card: _cards[_currentIndex],
                  isRotated: _isRotated,
                  isFront: _isFront,
                  onTap: _flip,
                  rotateAnimation: _rotateAnimation,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _cards[_currentIndex].name,
                    style: DarkCatTheme.heading,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text(_cards[_currentIndex].group, style: DarkCatTheme.body)],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: _currentIndex == 0 ? null : _setPreviousModel,
                    style: circleButtonStyle,
                    child: const Icon(
                      Icons.skip_previous_rounded,
                      size: 60,
                    ),
                  ),
                  OutlinedButton(
                    onPressed: _rotate,
                    style: circleButtonStyle,
                    child: const Icon(
                      Icons.rotate_90_degrees_cw,
                      size: 48,
                    ),
                  ),
                  OutlinedButton(
                    onPressed: _currentIndex == _cards.length - 1 ? null : _setNextModel,
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
        ),
      ),
    );
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }
}
