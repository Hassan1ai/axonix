import 'package:flutter/material.dart';
import '../../config/theme.dart';
import '../../widgets/settings_menu_item.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Profile Card
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppTheme.cardBackground,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppTheme.borderPrimary, width: 1),
          ),
          child: Row(
            children: [
              // Avatar
              Stack(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: AppTheme.primaryCyan,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 40,
                      color: AppTheme.darkBackground,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: AppTheme.accentGreen,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.verified,
                        size: 16,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(width: 16),
              
              // User Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Text(
                          'Hassan Mohamed',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.textPrimary,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.edit,
                          size: 18,
                          color: AppTheme.primaryCyan,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: const [
                        Text(
                          'Premium Member',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppTheme.primaryCyan,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(
                          Icons.verified,
                          size: 14,
                          color: AppTheme.accentGreen,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 16),
        
        // Contact Info
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppTheme.cardBackground,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppTheme.borderPrimary, width: 1),
          ),
          child: Column(
            children: const [
              SettingsMenuItem(
                icon: Icons.email,
                title: 'alex.morgan@axonix.ai',
                iconColor: AppTheme.primaryCyan,
              ),
              Divider(color: AppTheme.borderPrimary, height: 1),
              SettingsMenuItem(
                icon: Icons.phone,
                title: '+1 (555) 123-4567',
                iconColor: AppTheme.primaryCyan,
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 24),
        
        // Security & Privacy Section
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppTheme.cardBackground,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppTheme.borderPrimary, width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Icon(
                    Icons.security,
                    size: 20,
                    color: AppTheme.primaryCyan,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Security & Privacy',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              SettingsMenuItem(
                icon: Icons.lock,
                title: 'Change Password',
                onTap: () {},
              ),
              const Divider(color: AppTheme.borderPrimary, height: 1),
              SettingsMenuItem(
                icon: Icons.security,
                title: 'Two-Factor Authentication',
                subtitle: 'Enabled',
                trailing: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryCyan.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'Enabled',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppTheme.primaryCyan,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                onTap: () {},
              ),
              const Divider(color: AppTheme.borderPrimary, height: 1),
              SettingsMenuItem(
                icon: Icons.privacy_tip,
                title: 'Data Privacy Settings',
                onTap: () {},
              ),
              const Divider(color: AppTheme.borderPrimary, height: 1),
              SettingsMenuItem(
                icon: Icons.devices,
                title: 'Connected Devices',
                trailing: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryCyan.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    '3 devices',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppTheme.primaryCyan,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 16),
        
        // Subscription & Billing Section
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppTheme.cardBackground,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppTheme.borderPrimary, width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Icon(
                    Icons.credit_card,
                    size: 20,
                    color: AppTheme.primaryCyan,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Subscription & Billing',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              SettingsMenuItem(
                icon: Icons.payment,
                title: 'Payment Method',
                onTap: () {},
              ),
              const Divider(color: AppTheme.borderPrimary, height: 1),
              SettingsMenuItem(
                icon: Icons.subscriptions,
                title: 'Current Plan',
                subtitle: 'Premium - \$20/Month',
                onTap: () {},
              ),
              const Divider(color: AppTheme.borderPrimary, height: 1),
              SettingsMenuItem(
                icon: Icons.receipt,
                title: 'Billing History',
                onTap: () {},
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 16),
        
        // Help & Support Section
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppTheme.cardBackground,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppTheme.borderPrimary, width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Icon(
                    Icons.help_outline,
                    size: 20,
                    color: AppTheme.primaryCyan,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Help & Support',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              SettingsMenuItem(
                icon: Icons.help_center,
                title: 'Help Center',
                onTap: () {},
              ),
              const Divider(color: AppTheme.borderPrimary, height: 1),
              SettingsMenuItem(
                icon: Icons.support_agent,
                title: 'Contact Support',
                onTap: () {},
              ),
              const Divider(color: AppTheme.borderPrimary, height: 1),
              SettingsMenuItem(
                icon: Icons.article,
                title: 'Terms & Conditions',
                onTap: () {},
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 24),
        
        // Sign Out Section
        const Text(
          'Account',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppTheme.textPrimary,
          ),
        ),
        
        const SizedBox(height: 12),
        
        Container(
          decoration: BoxDecoration(
            color: AppTheme.cardBackground,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppTheme.borderPrimary, width: 1),
          ),
          child: SettingsMenuItem(
            icon: Icons.logout,
            title: 'Sign Out',
            iconColor: AppTheme.error,
            trailing: const Icon(
              Icons.chevron_right,
              color: AppTheme.error,
            ),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/login',
                (route) => false,
              );
            },
          ),
        ),
        
        const SizedBox(height: 40),
      ],
    );
  }
}
