import 'package:flutter/material.dart';

class BuildImageButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  const BuildImageButton({
    required this.label,
    required this.icon,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: 160,
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.white, size: 28),
        label: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 46, 1, 119),
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(2),
            side: const BorderSide(color: Colors.white, width: 0.5),
          ),
          elevation: 6,
        ),
      ),
    );
  }
}
