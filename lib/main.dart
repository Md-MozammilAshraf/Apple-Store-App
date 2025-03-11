import 'package:flutter/material.dart';
import 'package:netflix/provider/entry.dart';
import 'package:netflix/provider/watchlist.dart';
import 'package:netflix/screens/navigation.dart';
import 'package:netflix/screens/onboarding.dart';
import 'package:provider/provider.dart';

import 'provider/account.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AccountProvider()),
      ChangeNotifierProvider(create: (context) => EntryProvider()),
      ChangeNotifierProvider(create: (context) => WatchListProvider()),
    ],
    child: const Main(),
  ));
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'PkNetflix',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: FutureBuilder(
          future: context.read<AccountProvider>().isValid(),
          builder: (context, snapshot) =>
              context.watch<AccountProvider>().session == null
                  ? const OnboardingScreen()
                  : const NavScreen(),
        ));
  }
}
