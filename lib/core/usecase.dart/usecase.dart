abstract class Usecase<Type, Parmas> {
  Future<Type> call({Parmas params});
}
