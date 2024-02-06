part of '../category.dart';

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return ShimmerWidget(
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, __) => const ListTile(
          leading: CircleAvatar(radius: 50),
          title: SkeltonWidget(width: 20, height: 15),
          trailing: Icon(Icons.delete),
        ),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: 9,
      ),
    );
  }
}
