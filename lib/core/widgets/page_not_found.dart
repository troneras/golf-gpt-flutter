import 'package:apparence_kit/i18n/translations.g.dart';
import 'package:flutter/material.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(Translations.of(context).common.page_not_found),
      ),
    );
  }
}
