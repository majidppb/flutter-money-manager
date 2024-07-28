import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injectable.dart';
import '../widgets/transaction_list.dart';
import 'cubit/search_cubit.dart';

class SearchPageProvider extends StatelessWidget {
  const SearchPageProvider({super.key, required this.onUpdate});

  final void Function(BuildContext, {String? id}) onUpdate;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SearchCubit>(),
      child: _SearchPage(onUpdate),
    );
  }
}

class _SearchPage extends StatefulWidget {
  const _SearchPage(this.onUpdate);

  final void Function(BuildContext, {String? id}) onUpdate;

  @override
  State<_SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<_SearchPage> {
  Timer? _debounce;
  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchBar(
          autoFocus: true,
          keyboardType: TextInputType.text,
          leading: const Icon(Icons.search_rounded),
          onChanged: (value) {
            if (_debounce?.isActive ?? false) _debounce?.cancel();
            _debounce = Timer(const Duration(milliseconds: 500), () {
              context.read<SearchCubit>().search(value);
            });
          },
        ),
      ),
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state.query.isNotEmpty && state.result.isEmpty) {
            return const Center(
              child: Text('No items found !'),
            );
          }
          return TransactionListWidget(
            transactions: state.result,
            onUpdate: widget.onUpdate,
          );
        },
      ),
    );
  }
}
