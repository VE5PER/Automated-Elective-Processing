import 'package:automated_elective_processing/functions/cleanQuery.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Query cleaner test', () {
    final String x = '    hello what is this :   query to be cleaned    ';

    expect(cleaner(x), 'hello what is this :   query to be cleaned');
  });
}