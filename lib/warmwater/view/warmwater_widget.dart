import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gruber_app/warmwater/cubit/warmwater_cubit.dart';
import 'package:gruber_app/warmwater/repo/warmwater_repo.dart';
import 'package:gruber_app/warmwater/view/states/error_state.dart';
import 'package:gruber_app/warmwater/view/states/loading_state.dart';
import 'package:gruber_app/warmwater/view/states/running_state.dart';
import 'package:gruber_app/warmwater/view/states/stopped_state.dart';

class WarmWaterWidget extends StatefulWidget {
  const WarmWaterWidget({super.key});

  @override
  State<WarmWaterWidget> createState() => _WarmWaterWidgetState();
}

class _WarmWaterWidgetState extends State<WarmWaterWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<WarmwaterCubit>(
      create: (context) => WarmwaterCubit(WarmWaterRepository()),
      child: SizedBox(
        width: double.infinity,
        child: Card(
          child: BlocBuilder<WarmwaterCubit, WarmwaterState>(
            builder: (context, state) {
              if (state is WarmWaterInitial) {
                return const Placeholder();
              } else if (state is WarmWaterLoading) {
                return const LoadingStateWarmWaterWidget();
              } else if (state is WarmWaterRunning) {
                return const RunningStateWarmWaterWidget();
              } else if (state is WarmWaterStopped) {
                return const StoppedStateWarmWaterWidget();
              } else if (state is WarmWaterError) {
                return const ErrorStateWarmWaterWidget();
              } else {
                return const Placeholder();
              }
            },
          ),
        ),
      ),
    );
  }
}
