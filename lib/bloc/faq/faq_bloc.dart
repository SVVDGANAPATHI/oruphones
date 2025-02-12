import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:oruphones/config/api_service/api_service.dart';
import 'package:oruphones/models/get_faq_model.dart';

part 'faq_event.dart';
part 'faq_state.dart';

class FaqBloc extends Bloc<FaqEvent, FaqState> {
  FaqBloc() : super(const FaqState.initial()) {
    on<GetFaqDetails>(getFaqDetails);
  }

  FutureOr<void> getFaqDetails(GetFaqDetails event, Emitter<FaqState> emit) async {
    final ApiService apiService = ApiService();
    try {
      final response = await apiService.get(endpoint: 'faq');
      final getFaq = GetFaqModel.fromJson(response);
      emit(state.copyWith(getFaq: getFaq, isgetFaqLoading: false));
    } catch (e) {
      Fluttertoast.showToast(msg:e.toString());
    }
  }
}
