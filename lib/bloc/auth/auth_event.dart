part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginRequested extends AuthEvent {
  final int countryCode;
  final int phoneNumber;

  const LoginRequested({required this.countryCode, required this.phoneNumber});

  @override
  List<Object> get props => [countryCode, phoneNumber];
}

class VerifyOtp extends AuthEvent {
  final int otp;
  final int phonenumber;
  const VerifyOtp({
    required this.phonenumber,
    required this.otp,
  });

  @override
  List<Object> get props => [otp, phonenumber];
}

class UpdateUserName extends AuthEvent {
  final String userName;
  const UpdateUserName({required this.userName});

  @override
  List<Object> get props => [userName];
}

class IsUser extends AuthEvent {}
