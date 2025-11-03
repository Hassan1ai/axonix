import 'package:flutter/material.dart';
import '../../config/theme.dart';

class RecordTab extends StatefulWidget {
  const RecordTab({super.key});

  @override
  State<RecordTab> createState() => _RecordTabState();
}

class _RecordTabState extends State<RecordTab> {
  bool _audioRecording = true;
  bool _videoRecording = true;
  bool _autoRecordMode = false;
  String _sensitivity = 'Medium';
  bool _localStorage = true;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Recording Settings Header
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
                Icons.videocam,
                size: 32,
                color: AppTheme.primaryCyan,
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recording Settings',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Configure audio & video capture',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppTheme.textSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 16),
        
        // Enable Recording Section
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
                'Enable Recording',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textPrimary,
                ),
              ),
              const SizedBox(height: 16),
              
              // Audio Recording
              _buildSwitchTile(
                icon: Icons.mic,
                title: 'Audio Recording',
                subtitle: 'Capture audio from microphone',
                value: _audioRecording,
                onChanged: (value) {
                  setState(() {
                    _audioRecording = value;
                  });
                },
              ),
              
              const SizedBox(height: 12),
              
              // Video Recording
              _buildSwitchTile(
                icon: Icons.videocam,
                title: 'Video Recording',
                subtitle: 'Capture video from camera',
                value: _videoRecording,
                onChanged: (value) {
                  setState(() {
                    _videoRecording = value;
                  });
                },
              ),
              
              const SizedBox(height: 12),
              
              // Auto-Record Mode
              _buildSwitchTile(
                icon: Icons.auto_awesome,
                title: 'Auto-Record Mode',
                subtitle: 'Start recording automatically',
                value: _autoRecordMode,
                onChanged: (value) {
                  setState(() {
                    _autoRecordMode = value;
                  });
                },
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 16),
        
        // Recording Sensitivity
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
                'Recording Sensitivity',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textPrimary,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  _buildSensitivityButton('Low'),
                  const SizedBox(width: 12),
                  _buildSensitivityButton('Medium'),
                  const SizedBox(width: 12),
                  _buildSensitivityButton('High'),
                ],
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 16),
        
        // Storage Location
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
                'Storage Location',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textPrimary,
                ),
              ),
              const SizedBox(height: 16),
              
              // Local Storage
              _buildStorageOption(
                icon: Icons.storage,
                title: 'Local Storage',
                subtitle: 'Save on device only',
                isSelected: _localStorage,
                onTap: () {
                  setState(() {
                    _localStorage = true;
                  });
                },
              ),
              
              const SizedBox(height: 12),
              
              // Cloud Backup
              _buildStorageOption(
                icon: Icons.cloud,
                title: 'Cloud Backup',
                subtitle: 'Sync to cloud storage',
                isSelected: !_localStorage,
                onTap: () {
                  setState(() {
                    _localStorage = false;
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

  Widget _buildSensitivityButton(String label) {
    final isSelected = _sensitivity == label;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _sensitivity = label;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: isSelected ? AppTheme.primaryCyan : AppTheme.inputBackground,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? AppTheme.primaryCyan : AppTheme.borderPrimary,
              width: 1.5,
            ),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: isSelected ? AppTheme.darkBackground : AppTheme.textPrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStorageOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.inputBackground,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppTheme.primaryCyan : AppTheme.borderPrimary,
            width: isSelected ? 2 : 1,
          ),
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
            if (isSelected)
              Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  color: AppTheme.primaryCyan,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check,
                  color: AppTheme.darkBackground,
                  size: 16,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
