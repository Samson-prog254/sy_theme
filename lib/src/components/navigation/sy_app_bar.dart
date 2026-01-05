import 'package:flutter/material.dart';
import '../foundations/colors.dart';
import '../foundations/spacing.dart';
import '../foundations/typography.dart';

class SyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? titleWidget;
  final List<Widget>? actions;
  final Widget? leading;
  final bool centerTitle;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? elevation;
  final bool automaticallyImplyLeading;

  const SyAppBar({
    super.key,
    this.title,
    this.titleWidget,
    this.actions,
    this.leading,
    this.centerTitle = true,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation,
    this.automaticallyImplyLeading = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: titleWidget ?? (title != null ? Text(title!) : null),
      titleTextStyle: SyTextStyles.h6.copyWith(
        color: foregroundColor ?? Colors.white,
      ),
      actions: actions,
      leading: leading,
      centerTitle: centerTitle,
      backgroundColor: backgroundColor ?? SyColors.mainColor,
      foregroundColor: foregroundColor ?? Colors.white,
      elevation: elevation ?? 2,
      automaticallyImplyLeading: automaticallyImplyLeading,
      shape: elevation != null && elevation! > 0
          ? null
          : const Border(
              bottom: BorderSide(
                color: SyColors.divider,
                width: 1,
              ),
            ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class SySearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String? title;
  final String searchHint;
  final ValueChanged<String>? onSearchChanged;
  final VoidCallback? onSearchSubmitted;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const SySearchAppBar({
    super.key,
    this.title,
    this.searchHint = 'Search...',
    this.onSearchChanged,
    this.onSearchSubmitted,
    this.backgroundColor,
    this.foregroundColor,
  });

  @override
  State<SySearchAppBar> createState() => _SySearchAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _SySearchAppBarState extends State<SySearchAppBar> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: _isSearching
          ? TextField(
              controller: _searchController,
              autofocus: true,
              decoration: InputDecoration(
                hintText: widget.searchHint,
                hintStyle: TextStyle(
                  color: (widget.foregroundColor ?? Colors.white).withOpacity(0.7),
                ),
                border: InputBorder.none,
              ),
              style: TextStyle(
                color: widget.foregroundColor ?? Colors.white,
              ),
              onChanged: widget.onSearchChanged,
              onSubmitted: (_) {
                widget.onSearchSubmitted?.call();
                _stopSearch();
              },
            )
          : Text(widget.title ?? ''),
      backgroundColor: widget.backgroundColor ?? SyColors.mainColor,
      foregroundColor: widget.foregroundColor ?? Colors.white,
      actions: [
        if (_isSearching)
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: _stopSearch,
          )
        else
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: _startSearch,
          ),
      ],
    );
  }

  void _startSearch() {
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearch() {
    setState(() {
      _isSearching = false;
      _searchController.clear();
    });
    widget.onSearchChanged?.call('');
  }
}