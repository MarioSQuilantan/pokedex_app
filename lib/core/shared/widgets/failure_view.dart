import 'package:flutter/material.dart';

import '../../consts/consts.dart';
import '../../extensions/extensions.dart';

class FailureView extends StatelessWidget {
  const FailureView({
    super.key,
    required this.message,
    required this.onRetry,
    this.retryLabel = 'Retry',
  });

  final String message;
  final VoidCallback onRetry;
  final String retryLabel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              textAlign: TextAlign.center,
              style: context.bodyBase.copyWith(color: Colors.black54),
            ).responsive(),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: onRetry,
              style: FilledButton.styleFrom(
                backgroundColor: BaseColors.pokedexRed,
              ),
              child: Text(retryLabel),
            ),
          ],
        ),
      ),
    );
  }
}
