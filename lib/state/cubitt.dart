import 'package:flutter_bloc/flutter_bloc.dart';
import '../repository/api.dart';
import 'app_state.dart';

class NewsCubit extends Cubit<NewsState>{
  final ApiProvider _repository;
  NewsCubit(this._repository): super(InitNewsState());

  Future<void> fetchNewss() async {
    emit(LoadingNewsState());
    try {
      final response = await _repository.fetchNews();
      emit(ResponseNewsState(response));
    }catch(e)
    {
      emit(ErrorNewsState(e.toString()));
    }
  }
}