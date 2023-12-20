import 'package:equatable/equatable.dart';

class VideoModel extends Equatable {
  VideoModel({this.id, this.name, this.type, this.ytKey});

  final String? id, name, type, ytKey;
  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
        id: json['id'],
        name: json['name'],
        type: json['type'],
        ytKey: json['key']);
  }

  @override
  List<Object?> get props => [id, name, type, ytKey];
}
