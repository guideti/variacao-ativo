import 'components.dart';

class DefaultContainer extends StatelessWidget {
  final Widget child;
  final SystemUiOverlayStyle style;

  const DefaultContainer({
    Key? key,
    required this.child,
    required this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: style.copyWith(
        statusBarColor: const Color(0x00000000),
      ),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: child,
      ),
    );
  }
}
