import 'package:flutter/material.dart';
import '../config/theme.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool _showFilters = true;
  String _selectedDateFilter = '';
  String _selectedMediaType = '';
  String _selectedLocation = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.primaryCyan),
          onPressed: () => Navigator.pop(context),
        ),
        title: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'Search  ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.primaryCyan,
                ),
              ),
              TextSpan(
                text: 'Memories',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                color: AppTheme.inputBackground,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppTheme.borderPrimary, width: 1),
              ),
              child: TextField(
                controller: _searchController,
                style: const TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 15,
                ),
                decoration: InputDecoration(
                  hintText: 'Search your memories...',
                  hintStyle: const TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 15,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: AppTheme.textSecondary,
                  ),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.mic,
                          color: AppTheme.primaryCyan,
                        ),
                        onPressed: () {
                          // Voice search
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.filter_list,
                          color: AppTheme.primaryCyan,
                        ),
                        onPressed: () {
                          setState(() {
                            _showFilters = !_showFilters;
                          });
                        },
                      ),
                    ],
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                ),
              ),
            ),
          ),

          // Hide/Show Filters Toggle
          if (_showFilters)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _showFilters = false;
                  });
                },
                child: Row(
                  children: const [
                    Icon(
                      Icons.filter_list,
                      color: AppTheme.primaryCyan,
                      size: 18,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Hide Filters',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppTheme.primaryCyan,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),

          // Filters Section
          if (_showFilters)
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  // Date Filter
                  _buildFilterSection(
                    icon: Icons.calendar_today,
                    title: 'Date',
                    options: [
                      'Today',
                      'Yesterday',
                      'This Week',
                      'This Month',
                      'Custom',
                    ],
                    selectedValue: _selectedDateFilter,
                    onSelected: (value) {
                      setState(() {
                        _selectedDateFilter = value;
                      });
                    },
                  ),

                  const SizedBox(height: 20),

                  // Media Type Filter
                  _buildFilterSection(
                    icon: Icons.perm_media,
                    title: 'Media Type',
                    options: [
                      'All',
                      'Video',
                      'Image',
                      'Text',
                    ],
                    selectedValue: _selectedMediaType,
                    onSelected: (value) {
                      setState(() {
                        _selectedMediaType = value;
                      });
                    },
                  ),

                  const SizedBox(height: 20),

                  // Location Filter
                  _buildFilterSection(
                    icon: Icons.location_on,
                    title: 'Location',
                    options: [
                      'Kitchen',
                      'Living Room',
                      'Office',
                      'Bedroom',
                      'Outdoors',
                    ],
                    selectedValue: _selectedLocation,
                    onSelected: (value) {
                      setState(() {
                        _selectedLocation = value;
                      });
                    },
                  ),
                ],
              ),
            )
          else
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            AppTheme.primaryCyan.withValues(alpha: 0.3),
                            AppTheme.accentTeal.withValues(alpha: 0.3),
                          ],
                        ),
                      ),
                      child: const Icon(
                        Icons.search,
                        size: 60,
                        color: AppTheme.primaryCyan,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Search for your memories',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Try searching by keywords, locations, or\npeople.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppTheme.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildFilterSection({
    required IconData icon,
    required String title,
    required List<String> options,
    required String selectedValue,
    required Function(String) onSelected,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.borderPrimary, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: AppTheme.primaryCyan,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: options.map((option) {
              final isSelected = selectedValue == option;
              IconData? optionIcon;
              
              // Add icons for media types
              if (title == 'Media Type') {
                switch (option) {
                  case 'Video':
                    optionIcon = Icons.videocam;
                    break;
                  case 'Image':
                    optionIcon = Icons.image;
                    break;
                  case 'Text':
                    optionIcon = Icons.description;
                    break;
                }
              }

              return GestureDetector(
                onTap: () => onSelected(option),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppTheme.primaryCyan.withValues(alpha: 0.2)
                        : AppTheme.inputBackground,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isSelected
                          ? AppTheme.primaryCyan
                          : AppTheme.borderPrimary,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (optionIcon != null) ...[
                        Icon(
                          optionIcon,
                          size: 16,
                          color: isSelected
                              ? AppTheme.primaryCyan
                              : AppTheme.textSecondary,
                        ),
                        const SizedBox(width: 6),
                      ],
                      Text(
                        option,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: isSelected
                              ? AppTheme.primaryCyan
                              : AppTheme.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
