import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/core.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({super.key, required this.name, required this.image, required this.id, this.onTap});

  final String name;
  final String image;
  final String id;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 4,
      shadowColor: Colors.black.withValues(alpha: 0.8),
      borderRadius: BorderRadius.circular(15),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap == null
            ? null
            : () {
                FocusManager.instance.primaryFocus?.unfocus();
                onTap!();
              },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              children: [
                const Expanded(flex: 7, child: SizedBox.shrink()),
                Expanded(
                  flex: 4,
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 10),
                    decoration: const BoxDecoration(
                      color: BaseColors.cardBottomGrey,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                    ),
                    child: Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.bodyBase.copyWith(fontWeight: FontWeight.w400),
                    ).responsive(),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 12,
              right: 12,
              child: Text('#$id', style: context.subtitle.copyWith(color: Colors.blueGrey)).responsive(),
            ),
            Positioned(
              left: 8,
              right: 8,
              top: 24,
              bottom: 40,
              child: CachedNetworkImage(
                imageUrl: image,
                fit: BoxFit.contain,
                alignment: Alignment.bottomCenter,
                width: double.infinity,
                height: double.infinity,
                placeholder: (context, url) => const Center(
                  child: SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2)),
                ),
                errorWidget: (context, url, error) =>
                    Icon(Icons.image_not_supported_outlined, size: 48, color: Colors.grey.shade400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
