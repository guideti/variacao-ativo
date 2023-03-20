import 'package:ativo/layers/presentation/presentation.dart';
import 'package:test/test.dart';

void main() {
  late GetxSplashPresenter sut;

  setUp(() {
    sut = GetxSplashPresenter();
  });

  test('Should go to surveys page on success', () async {
    sut.navigateToStream.listen(expectAsync1((page) => expect(page, {'/home': true})));

    await sut.configure();
  });
}
