import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gruber_app/l10n/l10n.dart';

class ErrorStateWarmWaterWidget extends StatelessWidget {
  const ErrorStateWarmWaterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SizedBox(
      height: 70,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error,
              size: 32,
              color: Colors.red,
            ),
            Text(
              l10n.serverError,
              style: Theme.of(context)
                  .primaryTextTheme
                  .labelSmall!
                  .copyWith(color: Colors.red),
            )
          ],
        ),
      ),
    );
  }
}
