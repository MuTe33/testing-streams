import 'package:streams/number_repository.dart';

class GetNumberUseCase {
  GetNumberUseCase(this._numberRepository);

  final NumberRepository _numberRepository;

  Future<int> execute() {
    _numberRepository.loadNumber();

    return _numberRepository.number;
  }
}
