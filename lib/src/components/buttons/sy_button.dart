import 'package:flutter/material.dart';
import '../foundations/colors.dart';
import '../foundations/spacing.dart';
import '../foundations/typography.dart';

enum SyButtonVariant { primary, secondary, outline, text, danger }
enum SyButtonSize { small, medium, large }

class SyButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final SyButtonVariant variant;
  final SyButtonSize size;
  final bool isLoading;
  final bool fullWidth;
  final IconData? icon;
  final Color? customColor;
  final Color? customTextColor;

  const SyButton({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = SyButtonVariant.primary,
    this.size = SyButtonSize.medium,
    this.isLoading = false,
    this.fullWidth = false,
    this.icon,
    this.customColor,
    this.customTextColor,
  });

  @override
  Widget build(BuildContext context) {
    final colors = _getColors();
    final height = _getHeight();
    final padding = _getPadding();

    Widget child = isLoading
        ? SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(colors.textColor),
            ),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Icon(icon, size: _getIconSize(), color: colors.textColor),
                const SizedBox(width: SySpacing.xs),
              ],
              Text(
                label,
                style: SyTextStyles.button.copyWith(color: colors.textColor),
              ),
            ],
          );

    Widget button = variant == SyButtonVariant.text
        ? TextButton(
            onPressed: isLoading ? null : onPressed,
            style: TextButton.styleFrom(
              foregroundColor: colors.textColor,
              minimumSize: Size(0, height),
              padding: EdgeInsets.symmetric(horizontal: padding),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(SySpacing.radiusSm),
              ),
            ),
            child: child,
          )
        : variant == SyButtonVariant.outline
            ? OutlinedButton(
                onPressed: isLoading ? null : onPressed,
                style: OutlinedButton.styleFrom(
                  foregroundColor: colors.textColor,
                  side: BorderSide(color: colors.borderColor),
                  minimumSize: Size(0, height),
                  padding: EdgeInsets.symmetric(horizontal: padding),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(SySpacing.radiusSm),
                  ),
                ),
                child: child,
              )
            : ElevatedButton(
                onPressed: isLoading ? null : onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors.backgroundColor,
                  foregroundColor: colors.textColor,
                  minimumSize: Size(0, height),
                  padding: EdgeInsets.symmetric(horizontal: padding),
                  elevation: variant == SyButtonVariant.secondary ? 0 : 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(SySpacing.radiusSm),
                  ),
                ),
                child: child,
              );

    return fullWidth
        ? SizedBox(width: double.infinity, child: button)
        : button;
  }

  _ButtonColors _getColors() {
    if (customColor != null) {
      return _ButtonColors(
        backgroundColor: customColor!,
        textColor: customTextColor ?? Colors.white,
        borderColor: customColor!,
      );
    }

    switch (variant) {
      case SyButtonVariant.primary:
        return _ButtonColors(
          backgroundColor: SyColors.mainColor,
          textColor: Colors.white,
          borderColor: SyColors.mainColor,
        );
      case SyButtonVariant.secondary:
        return _ButtonColors(
          backgroundColor: SyColors.neutral100,
          textColor: SyColors.neutral700,
          borderColor: SyColors.neutral100,
        );
      case SyButtonVariant.outline:
        return _ButtonColors(
          backgroundColor: Colors.transparent,
          textColor: SyColors.mainColor,
          borderColor: SyColors.mainColor,
        );
      case SyButtonVariant.text:
        return _ButtonColors(
          backgroundColor: Colors.transparent,
          textColor: SyColors.mainColor,
          borderColor: Colors.transparent,
        );
      case SyButtonVariant.danger:
        return _ButtonColors(
          backgroundColor: SyColors.error,
          textColor: Colors.white,
          borderColor: SyColors.error,
        );
    }
  }

  double _getHeight() {
    switch (size) {
      case SyButtonSize.small:
        return SySpacing.buttonHeightSm;
      case SyButtonSize.medium:
        return SySpacing.buttonHeightMd;
      case SyButtonSize.large:
        return SySpacing.buttonHeightLg;
    }
  }

  double _getPadding() {
    switch (size) {
      case SyButtonSize.small:
        return SySpacing.sm;
      case SyButtonSize.medium:
        return SySpacing.md;
      case SyButtonSize.large:
        return SySpacing.lg;
    }
  }

  double _getIconSize() {
    switch (size) {
      case SyButtonSize.small:
        return SySpacing.iconXs;
      case SyButtonSize.medium:
        return SySpacing.iconSm;
      case SyButtonSize.large:
        return SySpacing.iconMd;
    }
  }
}

class _ButtonColors {
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;

  _ButtonColors({
    required this.backgroundColor,
    required this.textColor,
    required this.borderColor,
  });
}