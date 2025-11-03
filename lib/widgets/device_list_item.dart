import 'package:flutter/material.dart';
import '../config/theme.dart';

class DeviceListItem extends StatelessWidget {
  final String deviceName;
  final int batteryLevel;
  final String lastSync;
  final IconData icon;
  final VoidCallback onTap;

  const DeviceListItem({
    super.key,
    required this.deviceName,
    required this.batteryLevel,
    required this.lastSync,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.inputBackground,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppTheme.borderPrimary, width: 1),
        ),
        child: Row(
          children: [
            // Icon
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppTheme.cardBackground,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: AppTheme.primaryCyan,
                size: 24,
              ),
            ),
            
            const SizedBox(width: 16),
            
            // Device Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    deviceName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textPrimary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 16,
                    runSpacing: 4,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      // Battery
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.battery_charging_full,
                            size: 16,
                            color: _getBatteryColor(batteryLevel),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '$batteryLevel%',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: _getBatteryColor(batteryLevel),
                            ),
                          ),
                        ],
                      ),
                      
                      // Last Sync
                      Text(
                        'Last sync: $lastSync',
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppTheme.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getBatteryColor(int level) {
    if (level >= 80) return AppTheme.accentGreen;
    if (level >= 50) return AppTheme.primaryCyan;
    if (level >= 20) return AppTheme.warning;
    return AppTheme.error;
  }
}
