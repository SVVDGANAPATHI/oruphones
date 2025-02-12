part of 'faq_bloc.dart';

class FaqState extends Equatable {
  final GetFaqModel? getFaq;
  final bool? isgetFaqLoading;

  const FaqState({this.getFaq,this.isgetFaqLoading});

  @override
  List<Object?> get props => [getFaq,isgetFaqLoading];
  const FaqState.initial() : this(
    getFaq: null,
    isgetFaqLoading: true
    );
  FaqState copyWith({
    final GetFaqModel? getFaq,
    final bool? isgetFaqLoading,
  }) {
    return FaqState(
      getFaq: getFaq ?? this.getFaq,
      isgetFaqLoading: isgetFaqLoading ?? this.isgetFaqLoading
      );
  }
}
