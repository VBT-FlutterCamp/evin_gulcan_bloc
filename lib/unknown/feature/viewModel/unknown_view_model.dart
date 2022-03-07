import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/unknown_model.dart';
import '../service/unknown_service.dart';

class UnknownCubit extends Cubit<UnknownState> {
  late final IUnknownService unknownService;
  bool isLoading = false;
  UnknownModel? model;
  UnknownCubit({required this.unknownService}) : super(UnknownLoading()) {
    _init();
  }

  Future<void> _init() async {
    await fetchUnknown();

    emit(UnknownCompleted(model: model));
  }

  Future<void> fetchUnknown() async {
    changeLoading();
    model = await unknownService.fetchUnknown();
    changeLoading();
  }

  void changeLoading() {
    isLoading = !isLoading;
  }
}

abstract class UnknownState {}

class UnknownLoading extends UnknownState {}

class UnknownCompleted extends UnknownState {
  UnknownModel? model;
  UnknownCompleted({
    this.model,
  });
}
