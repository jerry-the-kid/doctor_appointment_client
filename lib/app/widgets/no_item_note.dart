import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NoItemNote extends StatelessWidget {
  final String message;

  const NoItemNote({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/images/empty.svg',
            width: 70,
          ),
          const SizedBox(height: 20),
          Text(
            message,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
