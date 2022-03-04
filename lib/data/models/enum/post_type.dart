// ignore_for_file: constant_identifier_names

enum PostType { NORMAR, NOTICE }

extension PostTypeToString on PostType {
  String get postTypeToName {
    switch (this) {
      case PostType.NORMAR:
        return '게시물';
      case PostType.NOTICE:
        return '공지사항';
      default:
        return '';
    }
  }
}
