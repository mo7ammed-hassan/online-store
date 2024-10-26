abstract class UseCase<Type, Parmas> {
  Future<Type> call({Parmas params});
}
