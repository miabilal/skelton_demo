import 'package:flutter/material.dart';
import 'package:smart_skeleton_loader/smart_skeleton_loader.dart';

class ProfileViewDemo extends StatefulWidget {
  const ProfileViewDemo({super.key});

  @override
  State<ProfileViewDemo> createState() => _ProfileViewDemoState();
}

class _ProfileViewDemoState extends State<ProfileViewDemo> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Skeleton Demo'),
      ),
      body: _isLoading ? _buildSkeletonProfile() : _buildRealProfile(),
    );
  }

  Widget _buildSkeletonProfile() {
    return ProfileViewSkeleton(
      config: const SkeletonConfig(),
      avatarSize: 120.0,
      padding: const EdgeInsets.all(16.0),
    );
  }

  Widget _buildRealProfile() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildAvatarSection(),
          const SizedBox(height: 24.0),
          _buildInfoSection(),
          const SizedBox(height: 24.0),
          _buildStatsSection(),
        ],
      ),
    );
  }

  Widget _buildAvatarSection() {
    return Column(
      children: [
        const CircleAvatar(
          radius: 60,
          child: Icon(Icons.person, size: 60),
        ),
        const SizedBox(height: 16.0),
        const Text(
          'Muhammad Bilal',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildInfoSection() {
    return Column(
      children: [
        _buildInfoRow(Icons.email, 'miabilal035@gmail.com'),
        _buildInfoRow(Icons.phone, '+966 578 8757 821'),
        _buildInfoRow(Icons.location_on, 'Riyadh, KSA'),
      ],
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Icon(icon, size: 24),
          const SizedBox(width: 16.0),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStatItem('Posts', '120'),
        _buildStatItem('Followers', '1.2K'),
        _buildStatItem('Following', '500'),
      ],
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        Text(
          label,
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }
}
