abstract class BaseUseCase<Type, Param> {
  Future<Type> call({Param? param});
}
