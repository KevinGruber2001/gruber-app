import 'dart:async';

import 'package:gruber_app/warmwater/enum/mqtt_action.dart';
import 'package:gruber_app/warmwater/repo/mqtt_client_manager.dart';
import 'package:mqtt_client/mqtt_client.dart';

MQTTClientManager? mqttClientManager;
String topic = "warmwasser/device";
String clientTopic = "warmwasser/client";
String start = "START";
String run = 'RUN';
String stop = 'STOP';
StreamController<MqttAction> stream = new StreamController();

MQTTClientManager get mqttManager {
  mqttClientManager ??= MQTTClientManager();
  return mqttClientManager!;
}

class WarmWaterRepository {
  Future<void> setupMqttClient() async {
    bool success = await mqttManager.connect();

    if (!success) {
      stream.add(MqttAction.ERROR);
      return;
    }

    mqttManager.subscribe(topic);

    actionListener();
  }

  void publishState(MqttAction action) {
    switch (action) {
      case MqttAction.RUN:
        mqttManager.publishMessage(clientTopic, start, false);
        break;
      case MqttAction.STOP:
        mqttManager.publishMessage(topic, stop, true);
        break;
      default:
    }
  }

  Stream<MqttAction> getActions() {
    return stream.stream;
  }

  void actionListener() {
    if (mqttManager.getMessagesStream() == null) {
      stream.add(MqttAction.ERROR);
    }
    mqttManager
        .getMessagesStream()!
        .listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
      final recMess = c![0].payload as MqttPublishMessage;
      final pt =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

      if (pt == run) {
        stream.add(MqttAction.RUN);
      } else if (pt == stop) {
        stream.add(MqttAction.STOP);
      }
    });
  }
}
