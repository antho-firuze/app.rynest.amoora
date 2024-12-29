import 'package:freezed_annotation/freezed_annotation.dart';

part 'recent.freezed.dart';
part 'recent.g.dart';

@freezed
class Recent with _$Recent {

  factory Recent({
    String? id,
    int? chapterId,
    int? verseId,
    int? verseNum,
    int? juzNum,
    DateTime? createdAt,
  }) = _Recent;

  factory Recent.fromJson(Map<String, dynamic> json) => _$RecentFromJson(json);
}