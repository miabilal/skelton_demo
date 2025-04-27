import 'package:flutter/material.dart';
import 'package:smart_skeleton_loader/smart_skeleton_loader.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // this is the timing you can adjust it accroidng to your need, you can
    //  you can also show a  erro pop after delay
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Skeleton Loader Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _isLoading ? _buildSkeletonList() : _buildRealList(),
      ),
    );
  }

  // This the actual loading screnn
  Widget _buildSkeletonList() {
    return ListViewSkeleton(
      config: const SkeletonConfig(numberOfItems: 6),
      itemHeight: 80.0,
      itemSpacing: 8.0,
    );
  }

  // this will be the actuall data of yours after fetching
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


//  for the source code find out it in my Github Link Will be provided in the descrptio