import 'package:flutter/material.dart';
import 'package:sy_theme/sy_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'sy_theme Design System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: const ComponentShowcase(),
    );
  }
}

class ComponentShowcase extends StatefulWidget {
  const ComponentShowcase({super.key});

  @override
  State<ComponentShowcase> createState() => _ComponentShowcaseState();
}

class _ComponentShowcaseState extends State<ComponentShowcase> {
  String currentLocation = 'home';
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SyColors.background,
      appBar: SyAppBar(
        title: 'sy_theme Showcase',
        actions: [
          IconButton(
            icon: const Icon(Icons.palette),
            onPressed: () => _showColorPalette(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(SySpacing.screenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection('Colors', _buildColorSection()),
            _buildSection('Typography', _buildTypographySection()),
            _buildSection('Buttons', _buildButtonSection()),
            _buildSection('Text Fields', _buildTextFieldSection()),
            _buildSection('Cards', _buildCardSection()),
            _buildSection('Avatars', _buildAvatarSection()),
            _buildSection('Feedback', _buildFeedbackSection()),
            const SizedBox(height: SySpacing.xxxl),
            Container(
              color: SyColors.mainDarkColor,
              padding: const EdgeInsets.all(SySpacing.md),
              child: const SygenFooter(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SyBottomNavBar(
        currentLocation: currentLocation,
        items: [
          SyBottomNavItem(
            icon: Icons.home,
            label: "Home",
            location: 'home',
            onTap: () => setState(() => currentLocation = 'home'),
          ),
          SyBottomNavItem(
            icon: Icons.palette,
            label: "Design",
            location: 'design',
            onTap: () => setState(() => currentLocation = 'design'),
          ),
          SyBottomNavItem(
            icon: Icons.code,
            label: "Code",
            location: 'code',
            onTap: () => setState(() => currentLocation = 'code'),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: SyTextStyles.h4),
        const SizedBox(height: SySpacing.md),
        content,
        const SizedBox(height: SySpacing.sectionSpacing),
      ],
    );
  }

  Widget _buildColorSection() {
    return Wrap(
      spacing: SySpacing.sm,
      runSpacing: SySpacing.sm,
      children: [
        _colorSwatch('Main', SyColors.mainColor),
        _colorSwatch('Supporting', SyColors.supportingColor),
        _colorSwatch('Dark', SyColors.mainDarkColor),
        _colorSwatch('Success', SyColors.success),
        _colorSwatch('Error', SyColors.error),
        _colorSwatch('Warning', SyColors.warning),
      ],
    );
  }

  Widget _colorSwatch(String name, Color color) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(SySpacing.radiusSm),
            border: Border.all(color: SyColors.divider),
          ),
        ),
        const SizedBox(height: SySpacing.xs),
        Text(name, style: SyTextStyles.caption),
      ],
    );
  }

  Widget _buildTypographySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Heading 1', style: SyTextStyles.h1),
        Text('Heading 2', style: SyTextStyles.h2),
        Text('Heading 3', style: SyTextStyles.h3),
        Text('Body Large', style: SyTextStyles.bodyLarge),
        Text('Body Medium', style: SyTextStyles.bodyMedium),
        Text('Caption Text', style: SyTextStyles.caption),
      ],
    );
  }

  Widget _buildButtonSection() {
    return Wrap(
      spacing: SySpacing.sm,
      runSpacing: SySpacing.sm,
      children: [
        SyButton(
          label: 'Primary',
          onPressed: () => _showSnackbar('Primary button pressed'),
        ),
        SyButton(
          label: 'Secondary',
          variant: SyButtonVariant.secondary,
          onPressed: () => _showSnackbar('Secondary button pressed'),
        ),
        SyButton(
          label: 'Outline',
          variant: SyButtonVariant.outline,
          onPressed: () => _showSnackbar('Outline button pressed'),
        ),
        SyButton(
          label: 'With Icon',
          icon: Icons.star,
          onPressed: () => _showSnackbar('Icon button pressed'),
        ),
        SyButton(
          label: 'Loading',
          isLoading: true,
          onPressed: () {},
        ),
        SyButton(
          label: 'Danger',
          variant: SyButtonVariant.danger,
          onPressed: () => _showAlert(),
        ),
      ],
    );
  }

  Widget _buildTextFieldSection() {
    return Column(
      children: [
        SyTextField(
          label: 'Name',
          hint: 'Enter your name',
          controller: _textController,
        ),
        const SizedBox(height: SySpacing.md),
        const SyEmailField(),
        const SizedBox(height: SySpacing.md),
        const SyPasswordField(),
        const SizedBox(height: SySpacing.md),
        const SySearchField(),
      ],
    );
  }

  Widget _buildCardSection() {
    return Column(
      children: [
        SyCard(
          child: Text(
            'This is a basic elevated card with some content inside.',
            style: SyTextStyles.bodyMedium,
          ),
        ),
        const SizedBox(height: SySpacing.md),
        SyInfoCard(
          title: 'Info Card',
          subtitle: 'This card shows information with leading and trailing widgets',
          leading: const Icon(Icons.info, color: SyColors.info),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () => _showSnackbar('Info card tapped'),
        ),
        const SizedBox(height: SySpacing.md),
        Row(
          children: [
            Expanded(
              child: SyStatsCard(
                title: 'Total Users',
                value: '1,234',
                subtitle: '+12% from last month',
                icon: Icons.people,
                iconColor: SyColors.success,
              ),
            ),
            const SizedBox(width: SySpacing.md),
            Expanded(
              child: SyStatsCard(
                title: 'Revenue',
                value: '\$45.2K',
                subtitle: '+8% from last month',
                icon: Icons.trending_up,
                iconColor: SyColors.warning,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAvatarSection() {
    return Row(
      children: [
        SyAvatar(
          initials: 'JD',
          size: SyAvatarSize.small,
        ),
        const SizedBox(width: SySpacing.md),
        SyAvatar(
          initials: 'AB',
          size: SyAvatarSize.medium,
        ),
        const SizedBox(width: SySpacing.md),
        SyAvatar(
          initials: 'CD',
          size: SyAvatarSize.large,
        ),
        const SizedBox(width: SySpacing.md),
        SyProfileAvatar(
          initials: 'ON',
          size: SyAvatarSize.large,
          showOnlineStatus: true,
          isOnline: true,
        ),
      ],
    );
  }

  Widget _buildFeedbackSection() {
    return Column(
      children: [
        Row(
          children: [
            const SyLoader(),
            const SizedBox(width: SySpacing.md),
            Text('Loading...', style: SyTextStyles.bodyMedium),
          ],
        ),
        const SizedBox(height: SySpacing.md),
        SyEmptyState(
          message: 'No items found',
          description: 'Try adjusting your search criteria',
          icon: Icons.search_off,
        ),
      ],
    );
  }

  void _showSnackbar(String message) {
    SySnackbar.show(context, message);
  }

  void _showAlert() {
    SyAlert.show(
      context,
      title: 'Confirm Action',
      message: 'Are you sure you want to delete this item?',
      type: SyAlertType.warning,
      confirmText: 'Delete',
      cancelText: 'Cancel',
    );
  }

  void _showColorPalette(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(SySpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Color Palette', style: SyTextStyles.h5),
            const SizedBox(height: SySpacing.md),
            Wrap(
              spacing: SySpacing.sm,
              runSpacing: SySpacing.sm,
              children: [
                _colorSwatch('Main', SyColors.mainColor),
                _colorSwatch('Supporting', SyColors.supportingColor),
                _colorSwatch('Dark', SyColors.mainDarkColor),
                _colorSwatch('Success', SyColors.success),
                _colorSwatch('Error', SyColors.error),
                _colorSwatch('Warning', SyColors.warning),
                _colorSwatch('Info', SyColors.info),
              ],
            ),
          ],
        ),
      ),
    );
  }
}