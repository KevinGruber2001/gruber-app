import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gruber_app/l10n/l10n.dart';
import 'package:gruber_app/warmwater/cubit/warmwater_cubit.dart';

class StoppedStateWarmWaterWidget extends StatelessWidget {
  const StoppedStateWarmWaterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Container(
      height: 120,
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              l10n.warmWater,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.bodyMedium,
              text: '${l10n.status}: ',
              children: [
                TextSpan(
                  text: l10n.stopped,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                )
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Theme.of(context).colorScheme.onSecondary,
                ),
              ),
              onPressed: () =>
                  BlocProvider.of<WarmwaterCubit>(context).startWarmWater(),
              child: Text(l10n.start),
            ),
          )
        ],
      ),
    );
  }
}
