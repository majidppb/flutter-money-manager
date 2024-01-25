import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/widgets/skelton.dart';

class CategoriesLoadingWidget extends StatelessWidget {
  const CategoriesLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, __) => Shimmer.fromColors(
        baseColor: Colors.black54,
        highlightColor: Colors.black12,
        child: const ListTile(
          leading: CircleAvatar(radius: 50),
          title: SkeltonWidget(width: 20, height: 15),
          trailing: Icon(Icons.delete),
        ),
      ),
      separatorBuilder: (_, __) => const Divider(),
      itemCount: 10,
    );
  }
}
