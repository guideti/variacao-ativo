import './components.dart';

void showSnackbarMessage({
  required String message,
  required List<String> errors,
  required BuildContext context,
  int milliseconds = 1000,
}) =>
    ScaffoldMessenger.of(context).showSnackBar(
      errors.isEmpty
          ? SnackBar(
              content: Text(message),
              duration: Duration(milliseconds: milliseconds),
            )
          : SnackBar(
              content: Text(message),
              action: SnackBarAction(
                label: 'Leia mais',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Atenção'),
                        content: SingleChildScrollView(
                          child: Column(
                            children: errors
                                .map(
                                  (error) => ListTile(
                                    leading: const Icon(
                                      Icons.arrow_right_rounded,
                                    ),
                                    title: Text(error),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: Navigator.of(context).pop,
                            child: const Text("OK"),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              duration: Duration(milliseconds: milliseconds),
            ),
    );
