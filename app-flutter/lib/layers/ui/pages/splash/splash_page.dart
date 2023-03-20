import '../../ui.dart';

class SplashPage extends StatefulWidget {
  final SplashPresenter presenter;

  const SplashPage(this.presenter, {Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin, NavigationManager {
  @override
  void initState() {
    handleNavigation(widget.presenter.navigateToStream);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultContainer(
      style: SystemUiOverlayStyle.dark.copyWith(
        systemNavigationBarColor: Theme.of(context).colorScheme.background,
        statusBarColor: Theme.of(context).colorScheme.background,
      ),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Assets.logo),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Validação de Ativo".toUpperCase(),
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).primaryColorDark,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
