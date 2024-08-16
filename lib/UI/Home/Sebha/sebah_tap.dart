import 'package:flutter/material.dart';
import 'package:islami/UI/Providers/theme_provider.dart';
import 'package:islami/ui_utils.dart';

class SebhaTap extends StatefulWidget {
  const SebhaTap({super.key});

  @override
  State<SebhaTap> createState() => _SebhaTapState();
}

class _SebhaTapState extends State<SebhaTap> {
  int count = 0;
  int index = 0;
  double angle = 0;
  int length = 0;

  @override
  Widget build(BuildContext context) {
    List<String> sebha = [
      getTranslation(context).sobhanAllah,
      getTranslation(context).elHamdleAllah,
      getTranslation(context).laIlahaIllaAllah,
      getTranslation(context).allahuAkbar,
    ];
    length = sebha.length;
    ThemeProvider themeProvider = ThemeProvider.get(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 22),
        Stack(
          alignment: Alignment.topCenter,
          children: [
            themeProvider.isDarkEnabled()
                ? Image.asset('Assets/Images/head of seb7a_dark.png')
                : Image.asset('Assets/Images/head of seb7a.png'),
            Padding(
              padding: const EdgeInsets.only(top: 76),
              child: Transform.rotate(
                  angle: angle,
              child:themeProvider.isDarkEnabled()
              ? Image.asset('Assets/Images/body of seb7a_dark.png'):
              Image.asset("Assets/Images/body of seb7a.png")),
            ),
          ],
        ),
        Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Text(
          getTranslation(context).numberOfTasbeehs,
          style: Theme.of(context).textTheme.titleSmall,
        ),
            )),
        const SizedBox(height: 13),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Text('$count'),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            onTab();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: Text(sebha[index],
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  onTab() {
    angle += 20;
    count++;
    if (count > 33) {
      count = 0;
      index++;
      if (index == length) {
        index = 0;
      }
    }
    setState(() {});
  }
}
