import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/presentation/mqtt/bloc/mqtt_event.dart';
import 'package:movieapp/presentation/mqtt/bloc/mqtt_state.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

// BLoC
class MqttBloc extends Bloc<MqttEvent, MqttState> {
  final MqttServerClient client;
  final ValueNotifier<String> data;

  MqttBloc(this.client, this.data) : super(MqttDisconnectedState());

  Stream<MqttState> mapEventToState(MqttEvent event) async* {
    if (event is ConnectMqttEvent) {
      yield* _mapConnectEventToState();
    } else if (event is SubscribeMqttEvent) {
      yield* _mapSubscribeEventToState();
    } else if (event is PublishMqttEvent) {
      yield* _mapPublishEventToState(event);
    }
  }

  Stream<MqttState> _mapConnectEventToState() async* {
    try {
      await client.connect();
      yield MqttConnectedState('Connected to MQTT broker');
    } catch (e) {
      yield MqttDisconnectedState();
    }
  }

  Stream<MqttState> _mapSubscribeEventToState() async* {
    const topic = 'test/sample';
    client.subscribe(topic, MqttQos.atMostOnce);

    await for (final List<MqttReceivedMessage<MqttMessage?>>? c
        in client.updates!) {
      final recMess = c![0].payload as MqttPublishMessage;
      final pt =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

      data.value = pt;
      yield MqttConnectedState(pt);
    }
  }

  Stream<MqttState> _mapPublishEventToState(PublishMqttEvent event) async* {
    const pubTopic = 'test/sample';
    final builder = MqttClientPayloadBuilder();
    builder.addString(event.message);

    if (client.connectionStatus?.state == MqttConnectionState.connected) {
      client.publishMessage(pubTopic, MqttQos.atMostOnce, builder.payload!);
    }
  }
}
