import 'package:flutter/material.dart';

import '../../../core/use_case.dart';

final class GetTransactionsParams extends Params {
  final DateTimeRange? range;

  const GetTransactionsParams({this.range});
}
