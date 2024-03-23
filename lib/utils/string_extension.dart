extension StringX on String {
  String get terminatingPathId {
    var pseg = Uri.parse(this).pathSegments;
    if (pseg.isNotEmpty) {
      return pseg.lastWhere((element) => element.trim().isNotEmpty);
    } else {
      return "";
    }
  }
}

extension StringY on String {
  bool get isWhiteSpace => trim().isEmpty;
}
