import 'package:flutter/material.dart';
import '../foundations/colors.dart';
import '../foundations/spacing.dart';
import '../foundations/typography.dart';

// Loading Components
class SyLoader extends StatelessWidget {
  final Color? color;
  final double size;

  const SyLoader({
    super.key,
    this.color,
    this.size = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(
          color ?? SyColors.mainColor,
        ),
      ),
    );
  }
}

class SyFullScreenLoader extends StatelessWidget {
  final String? message;

  const SyFullScreenLoader({
    super.key,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(SySpacing.lg),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(SySpacing.radiusMd),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SyLoader(),
              if (message != null) ...[
                const SizedBox(height: SySpacing.md),
                Text(
                  message!,
                  style: SyTextStyles.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

// Snackbar Utility
class SySnackbar {
  static void show(
    BuildContext context,
    String message, {
    SySnackbarType type = SySnackbarType.info,
    Duration duration = const Duration(seconds: 3),
    VoidCallback? action,
    String? actionLabel,
  }) {
    final colors = _getColors(type);
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              _getIcon(type),
              color: colors.iconColor,
              size: SySpacing.iconSm,
            ),
            const SizedBox(width: SySpacing.sm),
            Expanded(
              child: Text(
                message,
                style: SyTextStyles.bodyMedium.copyWith(
                  color: colors.textColor,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: colors.backgroundColor,
        duration: duration,
        action: action != null && actionLabel != null
            ? SnackBarAction(
                label: actionLabel,
                textColor: colors.actionColor,
                onPressed: action,
              )
            : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SySpacing.radiusSm),
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static _SnackbarColors _getColors(SySnackbarType type) {
    switch (type) {
      case SySnackbarType.success:
        return _SnackbarColors(
          backgroundColor: SyColors.success,
          textColor: Colors.white,
          iconColor: Colors.white,
          actionColor: Colors.white,
        );
      case SySnackbarType.error:
        return _SnackbarColors(
          backgroundColor: SyColors.error,
          textColor: Colors.white,
          iconColor: Colors.white,
          actionColor: Colors.white,
        );
      case SySnackbarType.warning:
        return _SnackbarColors(
          backgroundColor: SyColors.warning,
          textColor: Colors.white,
          iconColor: Colors.white,
          actionColor: Colors.white,
        );
      case SySnackbarType.info:
        return _SnackbarColors(
          backgroundColor: SyColors.neutral800,
          textColor: Colors.white,
          iconColor: Colors.white,
          actionColor: SyColors.supportingColor,
        );
    }
  }

  static IconData _getIcon(SySnackbarType type) {
    switch (type) {
      case SySnackbarType.success:
        return Icons.check_circle;
      case SySnackbarType.error:
        return Icons.error;
      case SySnackbarType.warning:
        return Icons.warning;
      case SySnackbarType.info:
        return Icons.info;
    }
  }
}

enum SySnackbarType { success, error, warning, info }

class _SnackbarColors {
  final Color backgroundColor;
  final Color textColor;
  final Color iconColor;
  final Color actionColor;

  _SnackbarColors({
    required this.backgroundColor,
    required this.textColor,
    required this.iconColor,
    required this.actionColor,
  });
}

// Alert Dialog
class SyAlert {
  static Future<bool?> show(
    BuildContext context, {
    required String title,
    required String message,
    String confirmText = 'OK',
    String? cancelText,
    SyAlertType type = SyAlertType.info,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SySpacing.radiusMd),
        ),
        title: Row(
          children: [
            Icon(
              _getAlertIcon(type),
              color: _getAlertColor(type),
              size: SySpacing.iconMd,
            ),
            const SizedBox(width: SySpacing.sm),
            Text(title, style: SyTextStyles.h6),
          ],
        ),
        content: Text(
          message,
          style: SyTextStyles.bodyMedium,
        ),
        actions: [
          if (cancelText != null)
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(cancelText),
            ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(confirmText),
          ),
        ],
      ),
    );
  }

  static Color _getAlertColor(SyAlertType type) {
    switch (type) {
      case SyAlertType.success:
        return SyColors.success;
      case SyAlertType.error:
        return SyColors.error;
      case SyAlertType.warning:
        return SyColors.warning;
      case SyAlertType.info:
        return SyColors.info;
    }
  }

  static IconData _getAlertIcon(SyAlertType type) {
    switch (type) {
      case SyAlertType.success:
        return Icons.check_circle;
      case SyAlertType.error:
        return Icons.error;
      case SyAlertType.warning:
        return Icons.warning;
      case SyAlertType.info:
        return Icons.info;
    }
  }
}

enum SyAlertType { success, error, warning, info }

// Empty State
class SyEmptyState extends StatelessWidget {
  final String message;
  final String? description;
  final IconData? icon;
  final Widget? action;

  const SyEmptyState({
    super.key,
    required this.message,
    this.description,
    this.icon,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(SySpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon ?? Icons.inbox,
              size: 64,
              color: SyColors.neutral400,
            ),
            const SizedBox(height: SySpacing.md),
            Text(
              message,
              style: SyTextStyles.h6.copyWith(
                color: SyColors.neutral600,
              ),
              textAlign: TextAlign.center,
            ),
            if (description != null) ...[
              const SizedBox(height: SySpacing.sm),
              Text(
                description!,
                style: SyTextStyles.bodyMedium.copyWith(
                  color: SyColors.neutral500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
            if (action != null) ...[
              const SizedBox(height: SySpacing.lg),
              action!,
            ],
          ],
        ),
      ),
    );
  }
}