import 'package:flutter/material.dart';

import '../styles/app_styles.dart';

class MessageView extends StatelessWidget {
  const MessageView({
    super.key,
    required this.icon,
    required this.text,
    this.color = AppStyles.muted,
    this.buttonText,
    this.onPressed,
  });

  final IconData icon; // el icono grande
  final String text; // el mensaje
  final Color color; // color del icono (gris por defecto)
  final String? buttonText; // texto del botón (solo en error)
  final VoidCallback? onPressed; // qué hace el botón

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppStyles.spaceL),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: AppStyles.iconL, color: color),
            const SizedBox(height: AppStyles.spaceM),
            Text(text, textAlign: TextAlign.center),
            if (buttonText != null) ...[
              const SizedBox(height: AppStyles.spaceM),
              FilledButton(onPressed: onPressed, child: Text(buttonText!)),
            ],
          ],
        ),
      ),
    );
  }
}
