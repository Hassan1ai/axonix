import 'package:flutter/material.dart';
import '../../config/theme.dart';

class NotifyTab extends StatefulWidget {
  const NotifyTab({super.key});

  @override
  State<NotifyTab> createState() => _NotifyTabState();
}

class _NotifyTabState extends State<NotifyTab> {
  bool _sound = true;
  bool _vibration = true;
  bool _aiAlerts = true;
  bool _deviceAlerts = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Notification Settings Header
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppTheme.cardBackground,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppTheme.borderPrimary, width: 1),
          ),
          child: Row(
            children: const [
              Icon(
                Icons.notifications,
                size: 32,
                color: AppTheme.primaryCyan,
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Notification Settings',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Customize your alerts',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppTheme.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 16),
        
        // Sound & Vibration Section
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
              const Text(
                'Sound & Vibration',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textPrimary,
                ),
              ),
              const SizedBox(height: 16),
              
              // Sound
              _buildSwitchTile(
                icon: Icons.volume_up,
                title: 'Sound',
                subtitle: 'Play notification sounds',
                value: _sound,
                onChanged: (value) {
                  setState(() {
                    _sound = value;
                  });
                },
              ),
              
              const SizedBox(height: 12),
              
              // Vibration
              _buildSwitchTile(
                icon: Icons.vibration,
                title: 'Vibration',
                subtitle: 'Vibrate on notifications',
                value: _vibration,
                onChanged: (value) {
                  setState(() {
                    _vibration = value;
                  });
                },
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 16),
        
        // Alert Types Section
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
              const Text(
                'Alert Types',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textPrimary,
                ),
              ),
              const SizedBox(height: 16),
              
              // AI Alerts
              _buildSwitchTile(
                icon: Icons.auto_awesome,
                title: 'AI Alerts',
                subtitle: 'Insights & recommendations',
                value: _aiAlerts,
                onChanged: (value) {
                  setState(() {
                    _aiAlerts = value;
                  });
                },
              ),
              
              const SizedBox(height: 12),
              
              // Device Alerts
              _buildSwitchTile(
                icon: Icons.phone_android,
                title: 'Device Alerts',
                subtitle: 'Connection & battery status',
                value: _deviceAlerts,
                onChanged: (value) {
                  setState(() {
                    _deviceAlerts = value;
                  });
                },
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildSwitchTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.inputBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppTheme.primaryCyan,
            size: 24,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppTheme.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: AppTheme.primaryCyan,
            activeTrackColor: AppTheme.primaryCyan.withOpacity(0.5),
          ),
        ],
      ),
    );
  }
}
