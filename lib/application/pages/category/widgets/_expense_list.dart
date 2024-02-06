part of '../category.dart';

class _ExpenseList extends StatelessWidget {
  const _ExpenseList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
        buildWhen: (previous, current) =>
            (previous as Categories).expense != (current as Categories).expense,
        builder: (context, state) {
          return ListView.separated(
            itemBuilder: (context, index) {
              final item = state.expense[index];
              return ListTile(
                title: Text(item.name),
                trailing: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.delete)),
              );
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: (state as Categories).expense.length,
          );
        });
  }
}
