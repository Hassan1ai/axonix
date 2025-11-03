import 'package:flutter/material.dart';
import '../config/theme.dart';
import '../widgets/device_list_item.dart';
import '../widgets/custom_button.dart';

class DevicePairingScreen extends StatelessWidget {
  const DevicePairingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              
              // Title
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Device  ',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                    TextSpan(
                      text: 'Pairing',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.primaryCyan,
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 12),
              
              // Subtitle
              const Text(
                'Connect to your Axonix devices',
                style: TextStyle(
                  fontSize: 16,
                  color: AppTheme.textSecondary,
                ),
              ),
              
              const SizedBox(height: 40),
              
              // Available Devices Card
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppTheme.cardBackground,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppTheme.borderPrimary, width: 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Available devices',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.textPrimary,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.refresh,
                              color: AppTheme.primaryCyan,
                            ),
                            onPressed: () {
                              // Refresh devices
                            },
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 20),
                      
                      // Device List
                      Expanded(
                        child: ListView(
                          children: [
                            DeviceListItem(
                              deviceName: 'Axonix Pi - Kitchen',
                              batteryLevel: 85,
                              lastSync: '10 min ago',
                              icon: Icons.bluetooth,
                              onTap: () {},
                            ),
                            DeviceListItem(
                              deviceName: 'Axonix Pi - Living Room',
                              batteryLevel: 92,
                              lastSync: '2 hrs ago',
                              icon: Icons.wifi,
                              onTap: () {},
                            ),
                            DeviceListItem(
                              deviceName: 'Axonix Pi - Office',
                              batteryLevel: 67,
                              lastSync: '5 hrs ago',
                              icon: Icons.wifi,
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 20),
                      
                      // Connect Button
                      CustomButton(
                        text: 'Connect to Axonix Device',
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/timeline');
                        },
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // Skip Button
                      Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/timeline');
                          },
                          child: const Text(
                            'Skip for now',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppTheme.textSecondary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
