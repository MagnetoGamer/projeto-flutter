class AuthService {
  String? _currentUserId;
  String? _currentUserName;

  String? get currentUserId => _currentUserId;
  String? get currentUserName => _currentUserName;
  bool get isAuthenticated => _currentUserId != null;

  Future<bool> login(String email, String password) async {
    // Simulação de autenticação
    await Future.delayed(const Duration(seconds: 1));
    
    // Em produção, fazer validação real
    if (email.isNotEmpty && password.isNotEmpty) {
      _currentUserId = 'user_${DateTime.now().millisecondsSinceEpoch}';
      _currentUserName = email.split('@')[0];
      return true;
    }
    
    return false;
  }

  void logout() {
    _currentUserId = null;
    _currentUserName = null;
  }
}

