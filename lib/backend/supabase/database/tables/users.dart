import '../database.dart';

class UsersTable extends SupabaseTable<UsersRow> {
  @override
  String get tableName => 'users';

  @override
  UsersRow createRow(Map<String, dynamic> data) => UsersRow(data);
}

class UsersRow extends SupabaseDataRow {
  UsersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsersTable();

  String get uuid => getField<String>('uuid')!;
  set uuid(String value) => setField<String>('uuid', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String get email => getField<String>('email')!;
  set email(String value) => setField<String>('email', value);

  int? get weight => getField<int>('weight');
  set weight(int? value) => setField<int>('weight', value);

  int? get height => getField<int>('height');
  set height(int? value) => setField<int>('height', value);

  int? get age => getField<int>('age');
  set age(int? value) => setField<int>('age', value);

  String? get gender => getField<String>('gender');
  set gender(String? value) => setField<String>('gender', value);

  int get calNeeded => getField<int>('cal_needed')!;
  set calNeeded(int value) => setField<int>('cal_needed', value);

  String? get activityLevel => getField<String>('activity_level');
  set activityLevel(String? value) => setField<String>('activity_level', value);

  String? get goal => getField<String>('goal');
  set goal(String? value) => setField<String>('goal', value);
}
