import '../database.dart';

class UploadImgTable extends SupabaseTable<UploadImgRow> {
  @override
  String get tableName => 'upload_img';

  @override
  UploadImgRow createRow(Map<String, dynamic> data) => UploadImgRow(data);
}

class UploadImgRow extends SupabaseDataRow {
  UploadImgRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UploadImgTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get img => getField<String>('img');
  set img(String? value) => setField<String>('img', value);

  String get uuid => getField<String>('uuid')!;
  set uuid(String value) => setField<String>('uuid', value);

  String? get caloriesPrediction => getField<String>('calories_prediction');
  set caloriesPrediction(String? value) =>
      setField<String>('calories_prediction', value);

  String? get fatPrediction => getField<String>('fat_prediction');
  set fatPrediction(String? value) => setField<String>('fat_prediction', value);

  String? get carbsPrediction => getField<String>('carbs_prediction');
  set carbsPrediction(String? value) =>
      setField<String>('carbs_prediction', value);

  String? get proteinPrediction => getField<String>('protein_prediction');
  set proteinPrediction(String? value) =>
      setField<String>('protein_prediction', value);

  String get email => getField<String>('email')!;
  set email(String value) => setField<String>('email', value);

  DateTime? get uploadDate => getField<DateTime>('UploadDate');
  set uploadDate(DateTime? value) => setField<DateTime>('UploadDate', value);

  String? get feedbackType => getField<String>('Feedback_type');
  set feedbackType(String? value) => setField<String>('Feedback_type', value);
}
