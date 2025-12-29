import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// ChatGPT/OpenAI logo icon using official SVG
class ChatGptIcon extends StatelessWidget {
  final double size;
  final Color color;

  const ChatGptIcon({
    super.key,
    this.size = 32,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/openai_logo.svg',
      width: size,
      height: size,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }
}

/// A container with ChatGPT branding (green background + white icon)
class ChatGptBrandedIcon extends StatelessWidget {
  final double size;
  final double iconSize;
  final double borderRadius;

  const ChatGptBrandedIcon({
    super.key,
    this.size = 64,
    this.iconSize = 32,
    this.borderRadius = 16,
  });

  /// Official ChatGPT/OpenAI green color
  static const chatGptGreen = Color(0xFF10A37F);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: chatGptGreen,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Center(
        child: ChatGptIcon(size: iconSize),
      ),
    );
  }
}
