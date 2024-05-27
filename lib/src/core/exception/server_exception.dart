class ServerException {
  const ServerException(this.message);

  final String? message;
  @override
  String toString() => message ?? 'Server Exception';
}
