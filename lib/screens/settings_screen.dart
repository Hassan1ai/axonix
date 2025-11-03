import 'package:flutter/material.dart';
import '../config/theme.dart';
import '../widgets/animated_bottom_nav.dart';
import 'settings_tabs/profile_tab.dart';
import 'settings_tabs/device_tab.dart';
import 'settings_tabs/record_tab.dart';
import 'settings_tabs/ai_data_tab.dart';
import 'settings_tabs/notify_tab.dart';
import 'settings_tabs/app_tab.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 64,
        titleSpacing: 16,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Settings',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.3,
              ),
            ),
            SizedBox(height: 2),
            Text(
              'Axonix System Control Center',
              style: TextStyle(
                fontSize: 11,
                color: AppTheme.primaryCyan,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.2,
              ),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(72),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              indicatorColor: AppTheme.primaryCyan,
              indicatorWeight: 3,
              labelColor: AppTheme.textPrimary,
              unselectedLabelColor: AppTheme.textSecondary.withOpacity(0.6),
              labelPadding: const EdgeInsets.symmetric(horizontal: 13),
              padding: EdgeInsets.zero,
              labelStyle: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.3,
              ),
              unselectedLabelStyle: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              tabs: const [
                Tab(
                  icon: Icon(Icons.person_outline, size: 24),
                  text: 'Profile',
                  height: 60,
                ),
                Tab(
                  icon: Icon(Icons.phone_android, size: 24),
                  text: 'Device',
                  height: 60,
                ),
                Tab(
                  icon: Icon(Icons.videocam, size: 24),
                  text: 'Record',
                  height: 60,
                ),
                Tab(
                  icon: Icon(Icons.psychology, size: 24),
                  text: 'AI Data',
                  height: 60,
                ),
                Tab(
                  icon: Icon(Icons.notifications, size: 24),
                  text: 'Notify',
                  height: 60,
                ),
                Tab(
                  icon: Icon(Icons.settings, size: 24),
                  text: 'App',
                  height: 60,
                ),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          ProfileTab(),
          DeviceTab(),
          RecordTab(),
          AiDataTab(),
          NotifyTab(),
          AppTab(),
        ],
      ),
      bottomNavigationBar: AnimatedBottomNav(
        currentIndex: 2,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/timeline');
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, '/chat');
          }
        },
      ),
    );
  }
}
