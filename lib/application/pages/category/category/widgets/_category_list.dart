part of '../category.dart';

class _CategoryList extends StatelessWidget {
  final void Function(BuildContext context, {String? id}) onUpdate;
  final List<Category> categories;

  const _CategoryList({required this.onUpdate, required this.categories});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final item = categories[index];
        return ListTile(
          onTap: () => onUpdate(context, id: item.id),
          title: Text(item.name),
          trailing: IconButton(
            onPressed: () => _onDelete(context, item),
            icon: const Icon(Icons.delete),
          ),
        );
      },
      separatorBuilder: (context, index) => const Divider(),
      itemCount: categories.length,
    );
  }

  /// Ask for confirmation before deletion
  void _onDelete(BuildContext context, Category category) => showAdaptiveDialog(
        context: context,
        builder: (ctx) => AlertDialog.adaptive(
          title: const Text('Are you sure ?'),
          content: Text('${category.name}\n${category.type.name}'),
          actions: [
            TextButton(
              onPressed: () {
                context.read<CategoryCubit>().delete(context, category.id);
                Navigator.of(ctx).pop();
              },
              child: const Text('Delete'),
            ),
            TextButton(
              onPressed: Navigator.of(ctx).pop,
              child: const Text('Cancel'),
            ),
          ],
        ),
      );
}
