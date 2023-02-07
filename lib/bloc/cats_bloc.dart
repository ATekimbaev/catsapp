import 'package:bloc/bloc.dart';
import 'package:bloc_08_00/cats_repo.dart';
import 'package:bloc_08_00/dio_settings.dart';
import 'package:bloc_08_00/model.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'cats_event.dart';
part 'cats_state.dart';

class CatsBloc extends Bloc<CatsEvent, CatsState> {
  CatsBloc({required this.repo}) : super(CatsInitial()) {
    on<PressButtonEvent>(
      (event, emit) async {
        try {
          final image = await repo.getCatsUrl();
          emit(CatsSucces(image: image));
        } catch (e) {
          emit(CatsError());
        }
      },
    );
  }
  final CatsRepo repo;
}
