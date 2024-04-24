// Events
abstract class MqttEvent {}

class ConnectMqttEvent extends MqttEvent {}

class SubscribeMqttEvent extends MqttEvent {}

class PublishMqttEvent extends MqttEvent {
  final String message;

  PublishMqttEvent(this.message);
}
