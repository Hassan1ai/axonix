import 'package:flutter/material.dart';
import '../config/theme.dart';
import '../widgets/memory_card.dart';
import '../widgets/animated_bottom_nav.dart';

class TimelineScreen extends StatefulWidget {
  const TimelineScreen({super.key});

  @override
  State<TimelineScreen> createState() => _TimelineScreenState();
}

class _TimelineScreenState extends State<TimelineScreen> {
  int _currentIndex = 0;

  final List<Map<String, dynamic>> _memories = [
    {
      'id': 1,
      'imageUrl': 'https://media.gettyimages.com/id/898418726/video/woman-leader-in-business-team-business-metting.jpg?s=640x640&k=20&c=iY3l-8QjSa5fIjx4po-llStzOPPS5oPMtv3WBoNdn64=',
      'time': 'Today, 3:45 PM',
      'location': 'El Sewedy International School – Lab Room',
      'title': 'PHP Training Session with Mr. Wael',
      'tags': ['#training', '#PHP', '#teamwork', '#learning'],
      'duration': '1 hr 15 min',
      'description':
          'After the school day ended, we had a PHP training session led by our supervisor, Mr. Wael. He gave a presentation explaining the purpose of PHP, how it works, and how we can use it to support our classmates in future projects. We also discussed team roles, responsibilities, and how each member will contribute to the training sessions. Everyone was really engaged and took notes during the talk. At the end, we took a group photo together — it felt like a great start to our development journey.',
    },
    {
      'id': 2,
      'imageUrl': 'https://media.gettyimages.com/id/898418726/video/woman-leader-in-business-team-business-metting.jpg?s=640x640&k=20&c=iY3l-8QjSa5fIjx4po-llStzOPPS5oPMtv3WBoNdn64=',
      'time': 'Today, 11:30 AM',
      'location': 'Director’s Office – El Sewedy International School',
      'title': 'Marketing Meeting with the School Director',
      'tags': ['#marketing', '#mediaTeam', '#planning', '#school'],
      'duration': '45 min',
      'description':
          'During the school break, we had an important marketing meeting with Mr. Sweilem, our school director. The discussion was led by Ms. Maha, who supervises all media, marketing, and montage teams. We talked about the importance of marketing for the school’s image and how to highlight student achievements and events effectively. Together, we built a detailed plan and carefully divided the roles among team members. The meeting was inspiring and gave us a clear direction for the upcoming campaigns.',
    },
    {
      'id': 3,
      'imageUrl': 'https://media.gettyimages.com/id/898418726/video/woman-leader-in-business-team-business-metting.jpg?s=640x640&k=20&c=iY3l-8QjSa5fIjx4po-llStzOPPS5oPMtv3WBoNdn64=',
      'time': 'Today, 10:45 AM',
      'location': 'School Auditorium – El Sewedy International School',
      'title': 'Cybersecurity Session Coverage During Break',
      'tags': ['#cybersecurity', '#volunteering', '#media', '#education'],
      'duration': '50 min',
      'description':
          'During the first break, a volunteer session on Cybersecurity was held by Eng. Heidi together with students from the Cybersecurity department. They presented key concepts about data protection and online safety to other students who were eager to learn more about the field. I was asked by Mr. Sweilem, the school director, to record and document the session as part of my role in the media team. He attended the session himself to supervise and encourage the students. It was an inspiring moment — capturing these scenes felt like highlighting real teamwork and passion for knowledge.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.darkBackground,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Smart Timeline',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(height: 2),
            Text(
              'Your digital memory events',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.white54,
                letterSpacing: 0.3,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: AppTheme.primaryCyan, size: 28),
            onPressed: () {
              Navigator.pushNamed(context, '/search');
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 16, bottom: 100),
          itemCount: _memories.length,
          itemBuilder: (context, index) {
            final memory = _memories[index];
            return MemoryCard(
              imageUrl: memory['imageUrl'],
              time: memory['time'],
              location: memory['location'],
              title: memory['title'],
              tags: List<String>.from(memory['tags']),
              duration: memory['duration'],
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/memory-detail',
                  arguments: memory['id'],
                );
              },
            );
          },
        ),
      ),
      bottomNavigationBar: AnimatedBottomNav(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          if (index == 1) {
            Navigator.pushNamed(context, '/chat');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/settings');
          }
        },
      ),
    );
  }
}
