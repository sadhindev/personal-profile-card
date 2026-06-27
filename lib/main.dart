
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile Card',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const ProfileScreen(),
    );
  }
}
class Interest {
  final String title;
  final String subtitle;
  final String imageUrl;

  const Interest({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
  });
}
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isFollowing = false;

  final List<Interest> _interests = const [
    Interest(
      title: 'Travel',
      subtitle: 'Exploring new places around the world',
      imageUrl: 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=400',
    ),
    Interest(
      title: 'Photography',
      subtitle: 'Capturing moments through the lens',
      imageUrl: 'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?w=400',
    ),
    Interest(
      title: 'Coding',
      subtitle: 'Building apps with Flutter & Dart',
      imageUrl: 'https://images.unsplash.com/photo-1461749280684-dccba630e2f6?w=400',
    ),
    Interest(
      title: 'Music',
      subtitle: 'Listening and creating melodies',
      imageUrl: 'https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?w=400',
    ),
  ];

  void _onFollowPressed() {
    setState(() => _isFollowing = !_isFollowing);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _isFollowing ? 'You are now following  Delwar Hossain!' : 'Unfollowed  Delwar  Hossain.',
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: _isFollowing ? Colors.blue : Colors.grey[700],
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _onMessagePressed() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Profile Details'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _DialogRow(icon: Icons.person,     label: 'Name',  value: 'Delwar Hossain'),
            SizedBox(height: 10),
            _DialogRow(icon: Icons.work,       label: 'Role',  value: 'Flutter Developer'),
            SizedBox(height: 10),
            _DialogRow(icon: Icons.email,      label: 'Email', value: 'sadhin2814@gmail.com'),
            SizedBox(height: 10),
            _DialogRow(icon: Icons.phone,      label: 'Phone', value: '+880 1314258065'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                margin: const EdgeInsets.all(0),
                elevation: 2,
                shape: const RoundedRectangleBorder(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24, vertical: 28,
                  ),
                  child: Column(
                    children: [
                       CircleAvatar(
                        radius: 55,
                        backgroundImage: AssetImage('assets/images/profile.jpg'),


                        ),
                      const SizedBox(height: 16),

                      const Text(
                        'Delwar Hossain',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),


                      const Text(
                        'Flutter Developer',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.deepPurple,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Passionate about creating user-friendly and engaging digital experiences.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      const SizedBox(height: 20),
                      const _ContactRow(
                        icon: Icons.email_outlined,
                        text: 'sadhin2814@gmail.com',
                      ),
                      const SizedBox(height: 10),
                      const _ContactRow(
                        icon: Icons.phone_outlined,
                        text: '+880 1314258065',
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: _onFollowPressed,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: _isFollowing
                                    ? Colors.green
                                    : Colors.blue,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text(
                                _isFollowing ? 'Following' : 'Follow',
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: OutlinedButton(
                              onPressed: _onMessagePressed,
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                side: const BorderSide(color: Colors.grey),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text(
                                'Message',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            'Interests',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                    const SizedBox(height: 16),


                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.85,
                      ),
                      itemCount: _interests.length,
                      itemBuilder: (context, index) {
                        final item = _interests[index];
                        return _InterestCard(interest: item);
                      },
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class _ContactRow extends StatelessWidget {
  final IconData icon;
  final String  text;
  const _ContactRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(icon, size: 18, color: Colors.black54),
        const SizedBox(width: 10),
        Text(text, style: const TextStyle(fontSize: 13, color: Colors.black87)),
      ],
    );
  }
}

class _DialogRow extends StatelessWidget {
  final IconData icon;
  final String  label;
  final String  value;
  const _DialogRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.blue),
        const SizedBox(width: 8),
        Text(
          '$label: ',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
        Flexible(
          child: Text(value, style: const TextStyle(fontSize: 13)),
        ),
      ],
    );
  }
}

class _InterestCard extends StatelessWidget {
  final Interest interest;
  const _InterestCard({required this.interest});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Expanded(
            child: Image.network(
              interest.imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
              loadingBuilder: (ctx, child, progress) {
                if (progress == null) return child;
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),


          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  interest.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  interest.subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 11, color: Colors.black54),
                ),
                const SizedBox(height: 4),
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Viewing ${interest.title}...'),
                        behavior: SnackBarBehavior.floating,
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                  child: const Text(
                    'View More',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
