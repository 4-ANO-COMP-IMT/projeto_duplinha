import 'package:flutter/material.dart';

class Cartao extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;

  const Cartao({required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        iconColor: WidgetStatePropertyAll(
          const Color(0xFF1ABC9C)
        ),
        backgroundColor: WidgetStatePropertyAll(
          const Color.fromARGB(255, 237, 241, 241)
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }
}
