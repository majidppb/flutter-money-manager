part of '../new_or_update_transaction.dart.dart';

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return ShimmerWidget(
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, __) => const SkeltonWidget(width: 20, height: 60),
        separatorBuilder: (_, __) => kHeight10,
        itemCount: 6,
      ),
    );
  }
}
