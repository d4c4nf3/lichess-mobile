import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dartchess/dartchess.dart';

part 'featured_player.freezed.dart';

@freezed
class FeaturedPlayer with _$FeaturedPlayer {
  const FeaturedPlayer._();

  const factory FeaturedPlayer(
      {required Side side,
      required String name,
      String? title,
      int? rating,
      required int seconds}) = _FeaturedPlayer;

  factory FeaturedPlayer.fromJson(Map<String, dynamic> json) {
    return FeaturedPlayer(
      side: json['color'] == 'white' ? Side.white : Side.black,
      name: json['user']['name'] as String,
      title: json['user']['title'] as String?,
      rating: json['rating'] as int?,
      seconds: json['seconds'] as int,
    );
  }

  FeaturedPlayer withSeconds(int newSeconds) {
    return FeaturedPlayer(
      side: side,
      name: name,
      title: title,
      rating: rating,
      seconds: newSeconds,
    );
  }
}