import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gruber_app/warmwater/enum/mqtt_action.dart';
import 'package:gruber_app/warmwater/repo/warmwater_repo.dart';
import 'package:meta/meta.dart';

part 'warmwater_state.dart';

class WarmwaterCubit extends Cubit<WarmwaterState> {
  WarmWaterRepository repo;
  Stream<MqttAction>? actionStream;

  WarmwaterCubit(this.repo) : super(WarmWaterInitial()) {
    init();
  }

  void init() async {
    emit(WarmWaterLoading());
    await repo.setupMqttClient();

    actionStream = repo.getActions();

    if (actionStream == null) {
      return;
    }

    actionStream!.listen((MqttAction value) {
      switch (value) {
        case MqttAction.RUN:
          emit(WarmWaterRunning());
          break;
        case MqttAction.STOP:
          emit(WarmWaterStopped());
          break;
        case MqttAction.ERROR:
          emit(WarmWaterError());
          break;
        default:
      }
    });
  }

  void startWarmWater() {
    emit(WarmWaterLoading());
    repo.publishState(MqttAction.RUN);
  }

  void stopWarmWater() {
    emit(WarmWaterLoading());
    repo.publishState(MqttAction.STOP);
  }
}
