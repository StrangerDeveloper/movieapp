import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/presentation/mqtt/bloc/mqtt_bloc.dart';
import 'package:movieapp/presentation/mqtt/bloc/mqtt_event.dart';
import 'package:movieapp/presentation/mqtt/bloc/mqtt_state.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MqttScreen extends StatelessWidget {
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //final MqttBloc mqttBloc = BlocProvider.of<MqttBloc>(context);

    return BlocProvider(
      create: (BuildContext context) {
        final client = MqttServerClient('broker.emqx.io', '');
        final data = ValueNotifier<String>('');
        return MqttBloc(client, data);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('MQTT'),
        ),
        body: BlocBuilder<MqttBloc, MqttState>(
          builder: (context, state) {
            return Column(
              children: [
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    context.read<MqttBloc>().on((event, emit) {
                      if (event is MqttConnectedState) {
                        emit(event);
                      } else if (event is MqttDisconnectedState) {
                        emit(event);
                      } else {
                        emit(MqttDisconnectedState());
                      }
                    });
                  },
                  child: const Text('Connect'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    context.read<MqttBloc>().add(SubscribeMqttEvent());
                  },
                  child: const Text('Subscribe'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    context.read<MqttBloc>().add(PublishMqttEvent(
                          messageController.text,
                        ));
                  },
                  child: const Text('Publish'),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: messageController,
                  decoration: const InputDecoration(
                    hintText: 'Enter message',
                  ),
                ),
                const SizedBox(height: 20),
                Text(state.toString()),
              ],
            );
          },
        ),
      ),
    );
  }
}
