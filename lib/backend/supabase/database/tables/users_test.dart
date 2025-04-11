import '../database.dart';

class UsersTestTable extends SupabaseTable<UsersTestRow> {
  @override
  String get tableName => 'users_test';

  @override
  UsersTestRow createRow(Map<String, dynamic> data) => UsersTestRow(data);
}

class UsersTestRow extends SupabaseDataRow {
  UsersTestRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsersTestTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  int? get weight => getField<int>('weight');
  set weight(int? value) => setField<int>('weight', value);

  double? get hight => getField<double>('hight');
  set hight(double? value) => setField<double>('hight', value);
}
