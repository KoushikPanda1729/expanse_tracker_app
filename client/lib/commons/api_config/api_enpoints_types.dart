class ApiEndpoint {
  final String path;
  final bool requiresAuth;

  ApiEndpoint({
    required this.path,
    required this.requiresAuth,
  });
}
