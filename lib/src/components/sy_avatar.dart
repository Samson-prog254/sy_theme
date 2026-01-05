import 'package:flutter/material.dart';
import '../foundations/colors.dart';
import '../foundations/spacing.dart';
import '../foundations/typography.dart';

enum SyAvatarSize { small, medium, large, extraLarge }

class SyAvatar extends StatelessWidget {
  final String? imageUrl;
  final String? initials;
  final IconData? icon;
  final SyAvatarSize size;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final VoidCallback? onTap;

  const SyAvatar({
    super.key,
    this.imageUrl,
    this.initials,
    this.icon,
    this.size = SyAvatarSize.medium,
    this.backgroundColor,
    this.foregroundColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final radius = _getRadius();
    final bgColor = backgroundColor ?? SyColors.neutral300;
    final fgColor = foregroundColor ?? SyColors.neutral700;

    Widget avatar = CircleAvatar(
      radius: radius,
      backgroundColor: bgColor,
      backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
      child: imageUrl == null
          ? (initials != null
              ? Text(
                  initials!,
                  style: _getTextStyle().copyWith(color: fgColor),
                )
              : Icon(
                  icon ?? Icons.person,
                  size: _getIconSize(),
                  color: fgColor,
                ))
          : null,
    );

    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: avatar,
      );
    }

    return avatar;
  }

  double _getRadius() {
    switch (size) {
      case SyAvatarSize.small:
        return 16;
      case SyAvatarSize.medium:
        return 24;
      case SyAvatarSize.large:
        return 32;
      case SyAvatarSize.extraLarge:
        return 48;
    }
  }

  double _getIconSize() {
    switch (size) {
      case SyAvatarSize.small:
        return SySpacing.iconXs;
      case SyAvatarSize.medium:
        return SySpacing.iconSm;
      case SyAvatarSize.large:
        return SySpacing.iconMd;
      case SyAvatarSize.extraLarge:
        return SySpacing.iconLg;
    }
  }

  TextStyle _getTextStyle() {
    switch (size) {
      case SyAvatarSize.small:
        return SyTextStyles.caption;
      case SyAvatarSize.medium:
        return SyTextStyles.labelMedium;
      case SyAvatarSize.large:
        return SyTextStyles.labelLarge;
      case SyAvatarSize.extraLarge:
        return SyTextStyles.h6;
    }
  }
}

// Profile Avatar with status indicator
class SyProfileAvatar extends StatelessWidget {
  final String? imageUrl;
  final String? initials;
  final SyAvatarSize size;
  final bool showOnlineStatus;
  final bool isOnline;
  final VoidCallback? onTap;

  const SyProfileAvatar({
    super.key,
    this.imageUrl,
    this.initials,
    this.size = SyAvatarSize.medium,
    this.showOnlineStatus = false,
    this.isOnline = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SyAvatar(
          imageUrl: imageUrl,
          initials: initials,
          size: size,
          onTap: onTap,
        ),
        if (showOnlineStatus)
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: _getStatusSize(),
              height: _getStatusSize(),
              decoration: BoxDecoration(
                color: isOnline ? SyColors.success : SyColors.neutral400,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
            ),
          ),
      ],
    );
  }

  double _getStatusSize() {
    switch (size) {
      case SyAvatarSize.small:
        return 8;
      case SyAvatarSize.medium:
        return 12;
      case SyAvatarSize.large:
        return 16;
      case SyAvatarSize.extraLarge:
        return 20;
    }
  }
}