part of '../category.dart';

class _CategoryList extends StatelessWidget {
  final void Function(BuildContext context, {int? id}) onUpdate;
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
            onPressed: () =>
                context.read<CategoryCubit>().delete(context, item.id),
            icon: const Icon(Icons.delete),
          ),
        );
      },
      separatorBuilder: (context, index) => const Divider(),
      itemCount: categories.length,
    );
  }
}
