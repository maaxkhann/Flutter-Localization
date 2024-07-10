import 'package:app_localization/controller/language_change_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

enum Language { english, arabic, spanish }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(AppLocalizations.of(context)!.localization,
            style: const TextStyle(color: Colors.white)),
        actions: [
          Consumer<LanguageChangeController>(
              builder: (context, provider, child) {
            return PopupMenuButton(
                iconColor: Colors.white,
                onSelected: (Language item) {
                  if (Language.english.name == item.name) {
                    provider.changeLanguage(const Locale('en'));
                  } else if (Language.arabic.name == item.name) {
                    provider.changeLanguage(const Locale('ar'));
                  } else {
                    provider.changeLanguage(const Locale('es'));
                  }
                },
                itemBuilder: (context) => [
                      const PopupMenuItem(
                          value: Language.english,
                          child: Center(child: Text('English'))),
                      const PopupMenuItem(
                          value: Language.arabic,
                          child: Center(child: Text('Arabic'))),
                      const PopupMenuItem(
                          value: Language.spanish,
                          child: Center(child: Text('Spanish')))
                    ]);
          })
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppLocalizations.of(context)!.hy('Maaz'),
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            Text(AppLocalizations.of(context)!.description,
                style: const TextStyle(fontSize: 18))
          ],
        ),
      ),
    );
  }
}
