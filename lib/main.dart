import 'package:cv_daniel/injection_container.dart';
import 'package:cv_daniel/providers/language.dart';
import 'package:cv_daniel/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cv_daniel/app_theme.dart';
import 'package:cv_daniel/presentation/pages/home/home_page.dart';
import 'package:cv_daniel/presentation/routes/routes.dart';
import 'package:cv_daniel/values/values.dart';
import 'package:layout/layout.dart';
import 'configure_web.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  configureApp();
  runApp(
    ChangeNotifierProvider(
      create: (_) => LanguageProvider(),
      child: const Aerium(),
    ),
  );
}

class Aerium extends StatelessWidget {
  const Aerium({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, _) {
        return Layout(
          child: MaterialApp(
            locale: languageProvider.locale,
            title: StringConst.APP_TITLE,
            theme: AppTheme.lightThemeData,
            debugShowCheckedModeBanner: false,
            initialRoute: HomePage.homePageRoute,
            onGenerateRoute: RouteConfiguration.onGenerateRoute,
          ),
        );
      },
    );
  }
}
