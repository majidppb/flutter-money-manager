// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:money_manager/application/pages/category/cubit/category_cubit.dart'
    as _i12;
import 'package:money_manager/application/pages/transactions/transactions/cubit/transactions_cubit.dart'
    as _i11;
import 'package:money_manager/data/data_sources/interfaces/transactions_local_data_source.dart'
    as _i3;
import 'package:money_manager/data/data_sources/interfaces/transactions_remote_data_source.dart'
    as _i5;
import 'package:money_manager/data/data_sources/local/transactions_local_data_source_impl.dart'
    as _i4;
import 'package:money_manager/data/data_sources/remote/transactions_remote_data_source_impl.dart'
    as _i6;
import 'package:money_manager/data/repositories/transactions_impl.dart' as _i8;
import 'package:money_manager/domain/repositories/transactions.dart' as _i7;
import 'package:money_manager/domain/use_cases/get_categories.dart' as _i9;
import 'package:money_manager/domain/use_cases/get_transactions.dart' as _i10;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.TransactionsLocalDataSource>(() => _i4.MemoryCache());
    gh.factory<_i5.TransactionsRemoteDataSource>(
        () => _i6.TransactionsRemoteDataSourceImpl());
    gh.singleton<_i7.TransactionsRepository>(_i8.TransactionsRepositoryImpl(
      gh<_i5.TransactionsRemoteDataSource>(),
      gh<_i3.TransactionsLocalDataSource>(),
    ));
    gh.factory<_i9.GetCategories>(
        () => _i9.GetCategories(gh<_i7.TransactionsRepository>()));
    gh.factory<_i10.GetTransactions>(
        () => _i10.GetTransactions(gh<_i7.TransactionsRepository>()));
    gh.factory<_i11.TransactionsCubit>(
        () => _i11.TransactionsCubit(gh<_i10.GetTransactions>()));
    gh.factory<_i12.CategoryCubit>(
        () => _i12.CategoryCubit(gh<_i9.GetCategories>()));
    return this;
  }
}
