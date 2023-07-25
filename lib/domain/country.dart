class Country {
  const Country({required this.flag, required this.name});
  final String flag;
  final String name;

  @override
  String toString() {
    return "${this.flag} ${this.name}";
  }
}
