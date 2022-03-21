// ignore_for_file: constant_identifier_names

enum PostType { NORMAL, NOTICE }

extension PostTypeToString on PostType {
  String get postTypeToName {
    switch (this) {
      case PostType.NORMAL:
        return '게시물';
      case PostType.NOTICE:
        return '공지사항';
      default:
        return '';
    }
  }
}
