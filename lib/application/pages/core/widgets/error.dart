import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 100,
          backgroundColor: Colors.grey,
          child: LottieBuilder.asset(
            'assets/animations/error.json',
            width: 170,
            height: 170,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 50),
        Text(
          'Oops!\nSomething went wrong',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 140),
      ],
    );
  }
}
