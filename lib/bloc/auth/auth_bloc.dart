import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oruphones/config/api_service/api_service.dart';
import 'package:oruphones/config/api_service/authrepo/auth_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
    on<VerifyOtp>(_onVerifyOtp);
    on<UpdateUserName>(_onUpdateUserName);
    // on<IsUser>(_onIsUser);
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
      if (response['status'] == 'SUCCESS') //add condition
      {
        emit(AuthAuthenticatedPartially());
      } else if (response['status'] == 'SUCCESS' && response['user']['userName'].isNotEmpty) {
        emit(AuthAuthenticated());
      } else {
        emit(AuthError(error: response['error'] ?? 'Failed to send OTP'));
      }
    } catch (e) {
      emit(AuthError(error: e.toString()));
    }
  }

  void _onUpdateUserName(UpdateUserName event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final body = jsonEncode({"countryCode": 91, "userName": event.userName});
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final ApiService apiservice = ApiService();
      final cookie = prefs.getString('cookie');

      if (cookie == null) {
        throw Exception('Cookie not found');
      }

      final response_1 = await apiservice.get(endpoint: 'isLoggedIn', headers: {'Cookie': cookie});
      await prefs.setString('accessToken', response_1['csrfToken']);
      final response = await apiservice.post(headers: {
        "X-Csrf-Token": response_1['csrfToken'],
      }, body: body, endpoint: 'update');
      if (response["message"] == 'Unauthorized') {
        //need to change
        emit(NameChanged());
      } else {
        emit(AuthError(error: response['error'][0]['message']));
      }
    } catch (e) {
      emit(AuthError(error: e.toString()));
    }
  }

  // void _onIsUser(IsUser event , Emitter<AuthState> emit) async
  // {
  //   emit(UsernameLoading());
  //   try{
  //     final SharedPreferences prefs = await SharedPreferences.getInstance();
  //     final isuser = prefs.getBool('isuser');
  //   }
  //   catch(e)
  //   {

  //   }
  // }
}
