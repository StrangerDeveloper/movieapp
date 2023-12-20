import 'package:equatable/equatable.dart';
import 'package:movieapp/core/utils/enums.dart';

import '../../models/video_model.dart';

class VideoPlayerState extends Equatable {
  const VideoPlayerState({this.videoList, this.status, this.message});
  final List<VideoModel>? videoList;
  final RequestStatus? status;
  final String? message;

  VideoPlayerState copyWith({
    List<VideoModel>? videoList,
    RequestStatus? status,
    String? message,
  }) {
    return VideoPlayerState(
      videoList: videoList ?? this.videoList,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [videoList!, status!, message!];
}
