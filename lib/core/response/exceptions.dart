class FetchException implements Exception {
  final String? message;

  FetchException({this.message});

  @override
  String toString() {
    if (message == null) return "Exception";
    return "Exception: $message";
  }
}