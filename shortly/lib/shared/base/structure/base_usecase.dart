abstract class BaseUseCase<Input, Output> {
  Future<Output> call(Input? input);
}
