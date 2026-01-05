import 'package:flutter/material.dart';
import '../foundations/colors.dart';
import '../foundations/spacing.dart';
import '../foundations/typography.dart';

enum SyTextFieldVariant { outlined, filled }

class SyTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? helperText;
  final String? errorText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final int? maxLines;
  final int? maxLength;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final SyTextFieldVariant variant;
  final Color? customBorderColor;
  final Color? customFillColor;

  const SyTextField({
    super.key,
    this.label,
    this.hint,
    this.helperText,
    this.errorText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.maxLength,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    this.onChanged,
    this.onSubmitted,
    this.variant = SyTextFieldVariant.outlined,
    this.customBorderColor,
    this.customFillColor,
  });

  @override
  Widget build(BuildContext context) {
    final borderColor = customBorderColor ?? SyColors.neutral300;
    final fillColor = customFillColor ?? 
        (variant == SyTextFieldVariant.filled ? SyColors.neutral100 : null);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: SyTextStyles.labelMedium.copyWith(
              color: SyColors.neutral700,
            ),
          ),
          const SizedBox(height: SySpacing.xs),
        ],
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          enabled: enabled,
          readOnly: readOnly,
          maxLines: maxLines,
          maxLength: maxLength,
          onTap: onTap,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          style: SyTextStyles.bodyMedium,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: SyTextStyles.bodyMedium.copyWith(
              color: SyColors.neutral500,
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            filled: variant == SyTextFieldVariant.filled,
            fillColor: fillColor,
            border: _getBorder(borderColor),
            enabledBorder: _getBorder(borderColor),
            focusedBorder: _getBorder(SyColors.mainColor),
            errorBorder: _getBorder(SyColors.error),
            focusedErrorBorder: _getBorder(SyColors.error),
            disabledBorder: _getBorder(SyColors.neutral200),
            errorText: errorText,
            helperText: helperText,
            helperStyle: SyTextStyles.caption.copyWith(
              color: SyColors.neutral600,
            ),
            errorStyle: SyTextStyles.caption.copyWith(
              color: SyColors.error,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: SySpacing.md,
              vertical: SySpacing.sm,
            ),
          ),
        ),
      ],
    );
  }

  InputBorder _getBorder(Color color) {
    return variant == SyTextFieldVariant.outlined
        ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(SySpacing.radiusSm),
            borderSide: BorderSide(color: color),
          )
        : UnderlineInputBorder(
            borderSide: BorderSide(color: color),
          );
  }
}

// Specialized text fields
class SyEmailField extends SyTextField {
  const SyEmailField({
    super.key,
    super.label = 'Email',
    super.hint = 'Enter your email',
    super.controller,
    super.onChanged,
    super.errorText,
    super.enabled,
  }) : super(
          keyboardType: TextInputType.emailAddress,
          prefixIcon: const Icon(Icons.email_outlined),
        );
}

class SyPasswordField extends StatefulWidget {
  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final String? errorText;
  final bool enabled;

  const SyPasswordField({
    super.key,
    this.label = 'Password',
    this.hint = 'Enter your password',
    this.controller,
    this.onChanged,
    this.errorText,
    this.enabled = true,
  });

  @override
  State<SyPasswordField> createState() => _SyPasswordFieldState();
}

class _SyPasswordFieldState extends State<SyPasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SyTextField(
      label: widget.label,
      hint: widget.hint,
      controller: widget.controller,
      onChanged: widget.onChanged,
      errorText: widget.errorText,
      enabled: widget.enabled,
      obscureText: _obscureText,
      prefixIcon: const Icon(Icons.lock_outlined),
      suffixIcon: IconButton(
        icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
        onPressed: () => setState(() => _obscureText = !_obscureText),
      ),
    );
  }
}

class SySearchField extends SyTextField {
  const SySearchField({
    super.key,
    super.hint = 'Search...',
    super.controller,
    super.onChanged,
    super.onSubmitted,
  }) : super(
          keyboardType: TextInputType.text,
          prefixIcon: const Icon(Icons.search),
          variant: SyTextFieldVariant.filled,
        );
}