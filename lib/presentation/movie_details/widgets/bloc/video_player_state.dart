import 'package:equatable/equatable.dart';

import '../../../../core/utils/enums.dart';
import '../../models/video_model.dart';

class VideoPlayerState extends Equatable {
  final RequestStatus status;
  final String message;
  final List<VideoModel>? videoList;

  const VideoPlayerState({
    this.status = RequestStatus.loading,
    this.message = '',
    this.videoList,
  });

  @override
  List<Object?> get props =>
      [status, message, videoList]; // Check if any of these are null

  VideoPlayerState copyWith({
    RequestStatus? status,
    String? message,
    List<VideoModel>? videoList,
  }) {
    return VideoPlayerState(
      status: status ?? this.status,
      message: message ?? this.message,
      videoList: videoList ?? this.videoList,
    );
  }
}
