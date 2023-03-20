import 'package:http/http.dart';

import '../../../infra/infra.dart';

HttpAdapter makeHttpAdapter() => HttpAdapter(Client());
