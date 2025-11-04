import 'package:flutter/material.dart';
import '../config/theme.dart';
import '../widgets/custom_button.dart';

class MemoryDetailScreen extends StatelessWidget {
  const MemoryDetailScreen({super.key});

  // البيانات نفسها اللي في TimelineScreen (ممكن لاحقاً تتخزن في ملف مشترك)
  final List<Map<String, dynamic>> _memories = const [
    {
      'id': 1,
      'imageUrl':
          'https://media.gettyimages.com/id/898418726/video/woman-leader-in-business-team-business-metting.jpg?s=640x640&k=20&c=iY3l-8QjSa5fIjx4po-llStzOPPS5oPMtv3WBoNdn64=',
      'time': 'Today, 3:45 PM',
      'location': 'El Sewedy School – Lab Room',
      'title': 'PHP Training Session with Mr. Wael',
      'tags': ['#training', '#PHP', '#teamwork'],
      'duration': '1 hr 15 min',
      'description':
          'After the school day ended, we had a PHP training session led by our supervisor, Mr. Wael. He gave a presentation explaining the purpose of PHP, how it works, and how we can use it to support our classmates in future projects. We also discussed team roles, responsibilities, and how each member will contribute to the training sessions. Everyone was really engaged and took notes during the talk. At the end, we took a group photo together — it felt like a great start to our development journey.',
      'participants': 'Mr. Wael, Media Students Team',
      'status': 'Completed',
    },
    {
      'id': 2,
      'imageUrl':
          'https://media.gettyimages.com/id/898418726/video/woman-leader-in-business-team-business-metting.jpg?s=640x640&k=20&c=iY3l-8QjSa5fIjx4po-llStzOPPS5oPMtv3WBoNdn64=',
      'time': 'Today, 11:30 AM',
      'location': 'Director’s Office – El Sewedy School',
      'title': 'Marketing Meeting with the School Director',
      'tags': ['#marketing', '#mediaTeam', '#planning'],
      'duration': '45 min',
      'description':
          'During the school break, we had an important marketing meeting with Mr. Sweilem, our school director. The discussion was led by Ms. Maha, who supervises all media, marketing, and montage teams. We talked about the importance of marketing for the school’s image and how to highlight student achievements and events effectively. Together, we built a detailed plan and carefully divided the roles among team members. The meeting was inspiring and gave us a clear direction for the upcoming campaigns.',
      'participants': 'Mr. Sweilem, Ms. Maha, Media & Marketing Team',
      'status': 'Completed',
    },
    {
      'id': 3,
      'imageUrl': 'https://placeholder.com/800x600',
      'time': 'Today, 10:45 AM',
      'location': 'School Auditorium – El Sewedy School',
      'title': 'Cybersecurity Session Coverage During Break',
      'tags': ['#cybersecurity', '#volunteering', '#media'],
      'duration': '50 min',
      'description':
          'During the first break, a volunteer session on Cybersecurity was held by Eng. Heidi together with students from the Cybersecurity department. They presented key concepts about data protection and online safety to other students who were eager to learn more about the field. I was asked by Mr. Sweilem, the school director, to record and document the session as part of my role in the media team. He attended the session himself to supervise and encourage the students. It was an inspiring moment — capturing these scenes felt like highlighting real teamwork and passion for knowledge.',
      'participants':
          'Eng. Heidi, Mr. Sweilem, Cybersecurity Students, Attending Students',
      'status': 'Completed ✅',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final int? memoryId = ModalRoute.of(context)?.settings.arguments as int?;

    // لو مفيش id
    if (memoryId == null) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: const Center(child: Text('No memory selected')),
      );
    }

    // البحث عن الـ memory بالـ id
    final memory = _memories.firstWhere(
      (m) => m['id'] == memoryId,
      orElse: () => {},
    );

    if (memory.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: const Center(child: Text('Memory not found')),
      );
    }

    return Scaffold(
      backgroundColor: AppTheme.darkBackground,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image
                    Stack(
                      children: [
                        Image.network(
                          memory['imageUrl'],
                          width: double.infinity,
                          height: 250,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: double.infinity,
                              height: 250,
                              color: AppTheme.inputBackground,
                              child: const Icon(
                                Icons.image,
                                size: 64,
                                color: AppTheme.textTertiary,
                              ),
                            );
                          },
                        ),
                        Positioned(
                          top: 16,
                          left: 16,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppTheme.darkBackground.withOpacity(0.8),
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.arrow_back),
                              color: AppTheme.textPrimary,
                              onPressed: () => Navigator.pop(context),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Content
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Time & Location
                          Row(
                            children: [
                              const Icon(
                                Icons.access_time,
                                size: 16,
                                color: AppTheme.primaryCyan,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                memory['time'],
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppTheme.primaryCyan,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 16),
                              const Icon(
                                Icons.location_on,
                                size: 16,
                                color: AppTheme.accentGreen,
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  memory['location'],
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: AppTheme.accentGreen,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 25),

                          // Title
                          Text(
                            memory['title'],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.textPrimary,
                            ),
                          ),

                          const SizedBox(height: 16),

                          // Tags
                          Wrap(
                            spacing: 11,
                            runSpacing: 8,
                            children: (memory['tags'] as List<String>).map((
                              tag,
                            ) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: AppTheme.inputBackground,
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: AppTheme.primaryCyan.withOpacity(
                                      0.3,
                                    ),
                                    width: 1,
                                  ),
                                ),
                                child: Text(
                                  tag,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: AppTheme.primaryCyan,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),

                          const SizedBox(height: 24),

                          // Description Section
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: AppTheme.cardBackground,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: AppTheme.borderPrimary,
                                width: 1,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.description,
                                      size: 20,
                                      color: AppTheme.primaryCyan,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      'Description',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: AppTheme.primaryCyan,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  memory['description'],
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: AppTheme.textSecondary,
                                    height: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 20),

                          // Event Information Section
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: AppTheme.cardBackground,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: AppTheme.borderPrimary,
                                width: 1,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.event,
                                      size: 20,
                                      color: AppTheme.primaryCyan,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      'Event Information',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: AppTheme.primaryCyan,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                _buildInfoRow('Event ID:', '${memory['id']}'),
                                _buildInfoRow('Location:', memory['location']),
                                _buildInfoRow('Recorded:', memory['time']),
                                _buildInfoRow(
                                  'Participants:',
                                  memory['participants'],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    const Text(
                                      'Status:',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppTheme.textSecondary,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                      memory['status'],
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: AppTheme.accentGreen,
                                        fontWeight: FontWeight.w600,
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
                  ],
                ),
              ),
            ),

            // Bottom Buttons
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: AppTheme.darkBackground,
                border: Border(
                  top: BorderSide(color: AppTheme.borderPrimary, width: 1),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      text: 'Edit Event',
                      onPressed: () {
                        // Handle edit
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomButton(
                      text: 'Delete',
                      onPressed: () {
                        // Handle delete
                      },
                      isOutlined: true,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 14, color: AppTheme.textSecondary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 14, color: AppTheme.textPrimary),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
