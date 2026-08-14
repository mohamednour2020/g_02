import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:g_02/data/requests/popular_people_request.dart'
    show PopularPeopleRequest;
import 'package:g_02/domain/models/popular_people_model.dart';

part 'popular_people_state.dart';

class PopularPeopleCubit extends Cubit<PopularPeopleState> {
  PopularPeopleCubit() : super(PopularPeopleInitial());

  getData() async {
    emit(PopularPeopleLoading());
    var response = await PopularPeopleRequest.getPopularPeople();
    response?.results != null
        ? emit(PopularPeopleSuccess(response!))
        : emit(PopularPeopleError());
  }
}
