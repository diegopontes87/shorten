abstract class BaseUseCase<Output> {
  Future<Output> call(String input);
}
