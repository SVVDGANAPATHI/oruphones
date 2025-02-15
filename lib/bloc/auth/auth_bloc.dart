import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oruphones/config/api_service/api_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
    on<VerifyOtp>(_onVerifyOtp);
  }

  void _onLoginRequested(LoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final body = jsonEncode({
        'countryCode': event.countryCode,
        'mobileNumber': event.phoneNumber,
      });

      ApiService apiService = ApiService();
      final response = await apiService.post(
        body: body,
        endpoint: 'login/otpCreate',
      );

      if (response['status'] == 'SUCCESS') {
        emit(OtpSent());
      } else {
        emit(AuthError(error: response['error'] ?? 'Failed to send OTP'));
      }
    } catch (e) {
      emit(AuthError(error: e.toString()));
    }
  }

  void _onVerifyOtp(VerifyOtp event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final body = jsonEncode({"countryCode": 91, "mobileNumber": event.phonenumber, "otp": event.otp});
      final ApiService apiService = ApiService();
      final response = await apiService.post(body: body, endpoint: 'login/otpValidate');
      print(response);
      if (response['status'] == 'SUCCESS') {
        emit(AuthAuthenticatedPartially());
      }
      // else if(response['status'] == 'SUCCESS' && response['user']['userName'].isNotEmpty){
      //   emit(AuthAuthenticated());
      // }
      else {
        emit(AuthError(error: response['error'] ?? 'Failed to send OTP'));
      }
    } catch (e) {
      emit(AuthError(error: e.toString()));
    }
  }
}
