import 'package:flutter/material.dart';
import 'package:smart_skeleton_loader/smart_skeleton_loader.dart';

class ListViewDemo extends StatefulWidget {
  const ListViewDemo({super.key});

  @override
  State<ListViewDemo> createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
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
        title: const Text('ListView Skeleton Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _isLoading ? _buildSkeletonList() : _buildRealList(),
      ),
    );
  }

  Widget _buildSkeletonList() {
    return ListViewSkeleton(
      config: const SkeletonConfig(numberOfItems: 6),
      itemHeight: 80.0,
      itemSpacing: 8.0,
    );
  }

  Widget _buildRealList() {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: ListTile(
            leading: const Icon(Icons.article, size: 40),
            title: Text('Item ${index + 1}',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text('This is the description of the item.'),
          ),
        );
      },
    );
  }
}
