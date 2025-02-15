import 'package:equatable/equatable.dart';

class AuthCred extends Equatable {
  final String accessToken;
  final String username;
  final String cookie;
  const AuthCred({ 
    required this.cookie, 
    required this.accessToken,
    required this.username,
  });

  @override
  List<Object?> get props => [accessToken, username,cookie];
}
