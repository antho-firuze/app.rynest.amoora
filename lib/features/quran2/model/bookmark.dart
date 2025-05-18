import 'package:freezed_annotation/freezed_annotation.dart';

part 'bookmark.freezed.dart';
part 'bookmark.g.dart';

@freezed
abstract class Bookmark with _$Bookmark {
  factory Bookmark({
    String? id,
    int? chapterId,
    int? verseId,
    int? verseNum,
    int? juzNum,
    DateTime? createdAt,
    String? note,
    String? folder,
  }) = _Bookmark;

  factory Bookmark.fromJson(Map<String, dynamic> json) => _$BookmarkFromJson(json);
}