// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:money_manager/application/pages/category/category/cubit/category_cubit.dart'
    as _i20;
import 'package:money_manager/application/pages/category/new_or_update_category/cubit/new_or_update_category_cubit.dart'
    as _i16;
import 'package:money_manager/application/pages/transactions/new_or_update_transaction/cubit/new_or_update_transaction_cubit.dart'
    as _i18;
import 'package:money_manager/application/pages/transactions/transactions/cubit/transactions_cubit.dart'
    as _i19;
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
import 'package:money_manager/domain/use_cases/delete_category.dart' as _i9;
import 'package:money_manager/domain/use_cases/delete_transaction.dart' as _i10;
import 'package:money_manager/domain/use_cases/get_categories.dart' as _i11;
import 'package:money_manager/domain/use_cases/get_category.dart' as _i12;
import 'package:money_manager/domain/use_cases/get_transaction.dart' as _i13;
import 'package:money_manager/domain/use_cases/get_transactions.dart' as _i14;
import 'package:money_manager/domain/use_cases/new_or_update_category.dart'
    as _i15;
import 'package:money_manager/domain/use_cases/new_or_update_transaction.dart'
    as _i17;

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
    gh.factory<_i9.DeleteCategory>(
        () => _i9.DeleteCategory(gh<_i7.TransactionsRepository>()));
    gh.factory<_i10.DeleteTransaction>(
        () => _i10.DeleteTransaction(gh<_i7.TransactionsRepository>()));
    gh.factory<_i11.GetCategories>(
        () => _i11.GetCategories(gh<_i7.TransactionsRepository>()));
    gh.factory<_i12.GetCategory>(
        () => _i12.GetCategory(gh<_i7.TransactionsRepository>()));
    gh.factory<_i13.GetTransaction>(
        () => _i13.GetTransaction(gh<_i7.TransactionsRepository>()));
    gh.factory<_i14.GetTransactions>(
        () => _i14.GetTransactions(gh<_i7.TransactionsRepository>()));
    gh.factory<_i15.NewOrUpdateCategory>(
        () => _i15.NewOrUpdateCategory(gh<_i7.TransactionsRepository>()));
    gh.factoryParam<_i16.NewOrUpdateCategoryCubit, int?, dynamic>((
      _id,
      _,
    ) =>
        _i16.NewOrUpdateCategoryCubit(
          gh<_i12.GetCategory>(),
          gh<_i15.NewOrUpdateCategory>(),
          _id,
        ));
    gh.factory<_i17.NewOrUpdateTransaction>(
        () => _i17.NewOrUpdateTransaction(gh<_i7.TransactionsRepository>()));
    gh.factoryParam<_i18.NewOrUpdateTransactionCubit, String?, dynamic>((
      _id,
      _,
    ) =>
        _i18.NewOrUpdateTransactionCubit(
          gh<_i11.GetCategories>(),
          gh<_i17.NewOrUpdateTransaction>(),
          gh<_i13.GetTransaction>(),
          _id,
        ));
    gh.factory<_i19.TransactionsCubit>(() => _i19.TransactionsCubit(
          gh<_i14.GetTransactions>(),
          gh<_i10.DeleteTransaction>(),
        ));
    gh.factory<_i20.CategoryCubit>(() => _i20.CategoryCubit(
          gh<_i11.GetCategories>(),
          gh<_i9.DeleteCategory>(),
        ));
    return this;
  }
}
