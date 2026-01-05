import 'package:flutter/material.dart';
import '../foundations/colors.dart';
import '../foundations/spacing.dart';
import '../foundations/typography.dart';

enum SyCardVariant { elevated, outlined, filled }

class SyCard extends StatelessWidget {
  final Widget child;
  final SyCardVariant variant;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? customColor;
  final double? customElevation;
  final BorderRadius? borderRadius;

  const SyCard({
    super.key,
    required this.child,
    this.variant = SyCardVariant.elevated,
    this.onTap,
    this.padding,
    this.margin,
    this.customColor,
    this.customElevation,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final cardPadding = padding ?? const EdgeInsets.all(SySpacing.cardPadding);
    final cardBorderRadius = borderRadius ?? BorderRadius.circular(SySpacing.radiusMd);

    Widget card = Container(
      margin: margin,
      decoration: BoxDecoration(
        color: customColor ?? _getBackgroundColor(),
        borderRadius: cardBorderRadius,
        border: variant == SyCardVariant.outlined
            ? Border.all(color: SyColors.neutral200)
            : null,
        boxShadow: variant == SyCardVariant.elevated
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: customElevation ?? 4,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: Padding(
        padding: cardPadding,
        child: child,
      ),
    );

    if (onTap != null) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: cardBorderRadius,
          child: card,
        ),
      );
    }

    return card;
  }

  Color _getBackgroundColor() {
    switch (variant) {
      case SyCardVariant.elevated:
        return SyColors.surface;
      case SyCardVariant.outlined:
        return SyColors.surface;
      case SyCardVariant.filled:
        return SyColors.surfaceVariant;
    }
  }
}

class SyInfoCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;

  const SyInfoCard({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SyCard(
      onTap: onTap,
      child: Row(
        children: [
          if (leading != null) ...[
            leading!,
            const SizedBox(width: SySpacing.md),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: SyTextStyles.bodyMedium),
                if (subtitle != null) ...[
                  const SizedBox(height: SySpacing.xs),
                  Text(
                    subtitle!,
                    style: SyTextStyles.caption.copyWith(
                      color: SyColors.neutral600,
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (trailing != null) ...[
            const SizedBox(width: SySpacing.md),
            trailing!,
          ],
        ],
      ),
    );
  }
}

class SyStatsCard extends StatelessWidget {
  final String title;
  final String value;
  final String? subtitle;
  final IconData? icon;
  final Color? iconColor;
  final Color? valueColor;

  const SyStatsCard({
    super.key,
    required this.title,
    required this.value,
    this.subtitle,
    this.icon,
    this.iconColor,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return SyCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: SyTextStyles.labelMedium.copyWith(
                  color: SyColors.neutral600,
                ),
              ),
              if (icon != null)
                Icon(
                  icon,
                  size: SySpacing.iconSm,
                  color: iconColor ?? SyColors.neutral500,
                ),
            ],
          ),
          const SizedBox(height: SySpacing.sm),
          Text(
            value,
            style: SyTextStyles.h3.copyWith(
              color: valueColor ?? SyColors.neutral900,
            ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: SySpacing.xs),
            Text(
              subtitle!,
              style: SyTextStyles.caption.copyWith(
                color: SyColors.neutral600,
              ),
            ),
          ],
        ],
      ),
    );
  }
}