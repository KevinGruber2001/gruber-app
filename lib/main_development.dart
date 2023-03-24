import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gruber_app/app/app.dart';
import 'package:gruber_app/bootstrap.dart';

Future main() async {
  await dotenv.load(fileName: 'lib/env/.env.dev');

  bootstrap(() => const App());
}
