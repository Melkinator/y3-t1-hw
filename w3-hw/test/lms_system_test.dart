import 'package:test/test.dart';

import '../lib/service/lms_system.dart';

void main() {
  late LmsSystem lms;
  // helpers cause i do not want to type allat out
  bool studentExists(String id) => lms.students.any((s)=>s.id==id);
  bool courseExists(String id) => lms.courses.any((c)=>c.id==id);
  bool enrolled(String studentId, String courseId) => lms.courses.any((c)=>c.id==courseId&&c.studentIds.contains(studentId));
  bool scoreExists(String id) => lms.scores.any((s)=>s.id==id);

  setUp(() {
    lms = LmsSystem();
    lms.addStudent(studentId: 'S01', studentName: 'Jane');
    lms.addStudent(studentId: 'S02', studentName: 'Doe');
  });
  group('task 1', () {
    test('add and remove a course', () {
      lms.createCourse(courseId: 'C01', courseName: 'Mobile Dev');
      expect(lms.courses.any((c)=>c.id=='C01'), isTrue);
      lms.removeCourse(courseId: 'C01');
      expect(courseExists('C01'), isFalse);
    });
    test('reject duplicate course id', () {
      lms.createCourse(courseId: 'C01', courseName: 'mobiel');
      expect(() => lms.createCourse(courseId: 'C01', courseName: 'smh'), throwsException);
      expect(lms.courses.length, 1); 
    });
    test('reject removal of nonexistent course', () {
      expect(() => lms.removeCourse(courseId: 'nah'), throwsException);
    });
    test('removing a course deletes its results, keeps students', () {
      lms.createCourse(courseId: 'C01', courseName: 'Mobile');
      lms.createCourse(courseId: 'C02', courseName: 'Web');
      lms.enrollStudent(studentId: 'S01', courseId: 'C01');
      lms.enrollStudent(studentId: 'S01', courseId: 'C02');
      lms.addScore(studentId: 'S01', courseId: 'C01', score: 80);
      lms.addScore(studentId: 'S01', courseId: 'C02', score: 90);
      lms.removeCourse(courseId: 'C01');
      expect(studentExists('S01'), isTrue);
      expect(enrolled('S01', 'C02'), isTrue);
      expect(lms.scores.map((r) => r.courseId), ['C02']);
    });
  });
  group('task 2', () {
    setUp(() => lms.createCourse(courseId: 'C01', courseName: 'mobile'));

    test('enroll and record', () {
      lms.enrollStudent(studentId: 'S01', courseId: 'C01');
      expect(enrolled('S01', 'C01'), isTrue);
    });
    test('reject unknown student', () {
      expect(() => lms.enrollStudent(studentId: 'S99', courseId: 'C01'), throwsException);
    });
 
    test('reject unknown course', () {
      expect(() => lms.enrollStudent(studentId: 'S01', courseId: 'C99'), throwsException);
    });
 
    test('reject duplicate enrollment', () {
      lms.enrollStudent(studentId: 'S01', courseId: 'C01');
      expect(() => lms.enrollStudent(studentId: 'S01', courseId: 'C01'), throwsException);
      expect(lms.courses.first.studentIds.length, 1);
    });
  });
}
