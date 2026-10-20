import '../model/student.dart';
import '../model/course.dart';
import '../model/course_score.dart';

class LmsSystem {
  final List<Student> students = [];
  final List<Course> courses = [];
  final List<CourseScore> scores = [];
  int _nextScoreId=1;

  // sorting so i can have an easier time finding the functions i want
  // students
  void addStudent({required String studentId, required String studentName}) {
    // ! Student shall not exist already
    Student? student = _findStudentOrNull(studentId);
    if (student != null) {
      throw Exception('Student $student already exists');
    }

    students.add(Student(id: studentId, name: studentName));
  }

  void removeStudent({required String studentId}) {
    Student? student = _findStudentOrNull(studentId);
    if (student == null) {
      throw Exception('Student $studentId not found');
    }
    // 1- Remove student from the students list
    students.removeWhere((student) => student.id == studentId);
    for (Course c in courses) {
      c.studentIds.remove(studentId);
    }
    scores.removeWhere((r)=>r.studentId==studentId);
  }

  // course stuff
  void createCourse({required String courseId, required String courseName}) {
    Course? course = _findCourseOrNull(courseId);
    if (course!=null) {
      throw Exception('Course $course already exists');
    }
    courses.add(Course(id: courseId, name:courseName));
  }

  void removeCourse({required String courseId}) {
    _findCourse(courseId);

    scores.removeWhere((r)=>r.courseId==courseId);
    courses.removeWhere((c)=>c.id==courseId);
  }

  void enrollStudent({required String studentId, required String courseId}) {
    _findStudent(studentId);
    Course course = _findCourse(courseId);

    if (course.studentIds.contains(studentId)) {
      throw Exception("Student with id of $studentId is already enrolled in course with id of $courseId");
    }
    course.studentIds.add(studentId);
  }

  // eliminate the nearest student
  // is it ever this serious :eyes:
  void discardStudentFromCourse({required String studentId, required String courseId}) {
    _findStudent(studentId);
    Course c = _findCourse(courseId);

    if (!c.studentIds.contains(studentId)) {
      throw Exception("Target was eliminated.");
    }

    c.studentIds.remove(studentId);
    scores.removeWhere((s)=>s.studentId==studentId&&s.courseId==courseId);
  }

  // scores
  CourseScore addScore({required String studentId, required String courseId, required double score}) {
    _findStudent(studentId);
    Course c = _findCourse(courseId);

    if (!c.studentIds.contains(studentId)) {
      throw Exception("Student with id of $studentId is not enrolled son");
    }
    if (score<0||score>100) {
      throw Exception("Score is above 0 or 100. that aint allowed man");
    }
    bool alreadyHasScore = scores.any((s)=>s.courseId==courseId&&s.studentId==studentId);
    if (alreadyHasScore) {
      throw Exception("$studentId already has a score for this $courseId");
    }

    CourseScore scoreToAdd = CourseScore(id: 'SC${_nextScoreId++}', studentId: studentId, courseId: courseId, score: score);
    scores.add(scoreToAdd);
    return scoreToAdd;
  }

  void removeScore({required String scoreId}) {
    if (!scores.any((s)=>s.id==scoreId)) {
      throw Exception("Score $scoreId aint found");
    }
    scores.removeWhere((s)=>s.id==scoreId);
  }

  // helpers
  Course? _findCourseOrNull(String courseId) {
    for (Course c in courses) {
      if (c.id==courseId) {
        return c;
      }
    }
    return null;
  }

  Student? _findStudentOrNull(String studentId) {
    for (Student s in students) {
      if (s.id == studentId) {
        return s;
      }
    }
    return null; // not found
  }

  Course _findCourse(String courseId) {
    Course? c = _findCourseOrNull(courseId);
    if (c==null) {
      throw Exception("Course $courseId not found");
    }
    return c;
  }

  Student _findStudent(String studentId) {
    Student? s = _findStudentOrNull(studentId);
    if (s==null) {
      throw Exception("Student $studentId not found");
    }
    return s;
  }
}
