part of 'home_interactor.dart';

@Injectable(
  as: HomeInteractor,
)
class HomeInteractorImpl extends HomeInteractor {
  final HomeRepository _repository;

  HomeInteractorImpl(this._repository);
}
