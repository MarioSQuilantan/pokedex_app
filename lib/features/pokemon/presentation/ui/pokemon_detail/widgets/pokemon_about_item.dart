import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/core.dart';

class PokemonAboutItem extends StatelessWidget {
  const PokemonAboutItem({super.key, required this.label, required this.value, this.icon, this.alignStart = false});

  final String label;
  final String value;
  final String? icon;
  final bool alignStart;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: alignStart ? MainAxisAlignment.start : MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 54,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                SvgPicture.asset(
                  icon!,
                  width: 18,
                  height: 18,
                  colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                ),
                const SizedBox(width: 12),
              ],
              Flexible(
                child: Text(
                  value,
                  textAlign: TextAlign.start,
                  style: context.subtitle.copyWith(fontWeight: FontWeight.w600),
                ).responsive(),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Text(
          label,
          style: context.caption.copyWith(color: Colors.black45),
        ).responsive(),
      ],
    );
  }
}
