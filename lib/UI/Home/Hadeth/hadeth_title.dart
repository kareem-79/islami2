import 'package:flutter/material.dart';
import 'package:islami/UI/Home/Hadeth/hadeth_details.dart';
import 'package:islami/UI/Home/Hadeth/hadeth_tap.dart';

class HadethTitle extends StatelessWidget {
  Hadeth hadeth;

  HadethTitle({
    super.key,
    required this.hadeth,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, HadethDetails.routeName,
            arguments: hadeth);
      },
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          hadeth.title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      )),
    );
  }
}
