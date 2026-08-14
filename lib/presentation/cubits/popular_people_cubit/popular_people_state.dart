part of 'popular_people_cubit.dart';

sealed class PopularPeopleState extends Equatable {
  const PopularPeopleState();
}

final class PopularPeopleInitial extends PopularPeopleState {
  @override
  List<Object> get props => [];
}
final class PopularPeopleLoading extends PopularPeopleState {
  @override
  List<Object> get props => [];
}
final class PopularPeopleSuccess extends PopularPeopleState {
  PopularPeopleModel popularPeopleModel=PopularPeopleModel();
  @override
  List<Object> get props => [];
  PopularPeopleSuccess(this.popularPeopleModel);
}
final class PopularPeopleError extends PopularPeopleState {
  @override
  List<Object> get props => [];
}
