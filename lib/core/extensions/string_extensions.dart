
extension AssetsExtension on String {
  String get toPng => 'assets/images/$this.png';
  String get toLottie => 'assets/lotties/$this.json';
  String get toSVG => 'assets/lotties/svg/$this.svg';
}

extension StringExtension on String {
    String capitalize() => '${this[0].toUpperCase()}${substring(1)}';
}
