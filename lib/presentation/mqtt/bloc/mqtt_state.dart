// States
abstract class MqttState {}

class MqttDisconnectedState extends MqttState {}

class MqttConnectedState extends MqttState {
  final String message;

  MqttConnectedState(this.message);
}
