// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../application/pages/category/category/cubit/category_cubit.dart'
    as _i20;
import '../../application/pages/category/new_or_update_category/cubit/new_or_update_category_cubit.dart'
    as _i19;
import '../../application/pages/settings/cubit/settings_cubit.dart' as _i26;
import '../../application/pages/sign_in/cubit/sign_in_cubit.dart' as _i25;
import '../../application/pages/transactions/new_or_update_transaction/cubit/new_or_update_transaction_cubit.dart'
    as _i24;
import '../../application/pages/transactions/transactions/cubit/transactions_cubit.dart'
    as _i27;
import '../../data/data_sources/interfaces/transactions_local_data_source.dart'
    as _i7;
import '../../data/data_sources/interfaces/transactions_remote_data_source.dart'
    as _i3;
import '../../data/data_sources/local/transactions_local_data_source_impl.dart'
    as _i8;
import '../../data/data_sources/remote/transactions_remote_data_source_impl.dart'
    as _i4;
import '../../data/repositories/auth_service_impl.dart' as _i6;
import '../../data/repositories/transactions_impl.dart' as _i10;
import '../../domain/repositories/auth_service.dart' as _i5;
import '../../domain/repositories/transactions.dart' as _i9;
import '../../domain/use_cases/delete_category.dart' as _i11;
import '../../domain/use_cases/delete_transaction.dart' as _i12;
import '../../domain/use_cases/get_categories.dart' as _i13;
import '../../domain/use_cases/get_category.dart' as _i14;
import '../../domain/use_cases/get_transaction.dart' as _i15;
import '../../domain/use_cases/get_transactions.dart' as _i16;
import '../../domain/use_cases/get_user.dart' as _i21;
import '../../domain/use_cases/new_or_update_category.dart' as _i17;
import '../../domain/use_cases/new_or_update_transaction.dart' as _i18;
import '../../domain/use_cases/sign_in_with_google.dart' as _i22;
import '../../domain/use_cases/singn_out.dart' as _i23;

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
    gh.factory<_i3.TransactionsRemoteDataSource>(
        () => _i4.TransactionsRemoteDataSourceImpl());
    gh.singleton<_i5.AuthService>(() => _i6.AuthServiceImpl());
    gh.factory<_i7.TransactionsLocalDataSource>(() => _i8.MemoryCache());
    gh.singleton<_i9.TransactionsRepository>(
        () => _i10.TransactionsRepositoryImpl(
              gh<_i3.TransactionsRemoteDataSource>(),
              gh<_i7.TransactionsLocalDataSource>(),
            ));
    gh.factory<_i11.DeleteCategory>(
        () => _i11.DeleteCategory(gh<_i9.TransactionsRepository>()));
    gh.factory<_i12.DeleteTransaction>(
        () => _i12.DeleteTransaction(gh<_i9.TransactionsRepository>()));
    gh.factory<_i13.GetCategories>(
        () => _i13.GetCategories(gh<_i9.TransactionsRepository>()));
    gh.factory<_i14.GetCategory>(
        () => _i14.GetCategory(gh<_i9.TransactionsRepository>()));
    gh.factory<_i15.GetTransaction>(
        () => _i15.GetTransaction(gh<_i9.TransactionsRepository>()));
    gh.factory<_i16.GetTransactions>(
        () => _i16.GetTransactions(gh<_i9.TransactionsRepository>()));
    gh.factory<_i17.NewOrUpdateCategory>(
        () => _i17.NewOrUpdateCategory(gh<_i9.TransactionsRepository>()));
    gh.factory<_i18.NewOrUpdateTransaction>(
        () => _i18.NewOrUpdateTransaction(gh<_i9.TransactionsRepository>()));
    gh.factoryParam<_i19.NewOrUpdateCategoryCubit, String?, dynamic>((
      id,
      _,
    ) =>
        _i19.NewOrUpdateCategoryCubit(
          gh<_i14.GetCategory>(),
          gh<_i17.NewOrUpdateCategory>(),
          id,
        ));
    gh.factory<_i20.CategoryCubit>(() => _i20.CategoryCubit(
          gh<_i13.GetCategories>(),
          gh<_i11.DeleteCategory>(),
        ));
    gh.factory<_i21.GetUser>(() => _i21.GetUser(gh<_i5.AuthService>()));
    gh.factory<_i22.SignInWithGoogle>(
        () => _i22.SignInWithGoogle(gh<_i5.AuthService>()));
    gh.factory<_i23.SignOut>(() => _i23.SignOut(gh<_i5.AuthService>()));
    gh.factoryParam<_i24.NewOrUpdateTransactionCubit, String?, dynamic>((
      id,
      _,
    ) =>
        _i24.NewOrUpdateTransactionCubit(
          gh<_i13.GetCategories>(),
          gh<_i18.NewOrUpdateTransaction>(),
          gh<_i15.GetTransaction>(),
          id,
        ));
    gh.factory<_i25.SignInCubit>(
        () => _i25.SignInCubit(gh<_i22.SignInWithGoogle>()));
    gh.factory<_i26.SettingsCubit>(() => _i26.SettingsCubit(
          gh<_i23.SignOut>(),
          gh<_i21.GetUser>(),
        ));
    gh.factory<_i27.TransactionsCubit>(() => _i27.TransactionsCubit(
          gh<_i16.GetTransactions>(),
          gh<_i12.DeleteTransaction>(),
        ));
    return this;
  }
}
