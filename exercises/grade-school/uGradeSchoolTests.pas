unit uGradeSchoolTests;

interface
uses
  DUnitX.TestFramework, uGradeSchool;

const
  CanonicalVersion = '1.0.0.1';

type
  [TestFixture]
  GradeSchoolTest = class(TObject)
  private        {ISchool and TRoster are types to be declared in the student's solution}
    school: ISchool;
    actual: TRoster;
    expected: TRoster;
    procedure CompareTwoArrays<T>(Array1, Array2: array of T);
  public
    [Setup]
    procedure Setup; //Is called before each test is performed

    [TearDown]
    procedure TearDown; //Is called immediately at the conclusion of each test

    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure Adding_a_student_adds_them_to_the_sorted_roster;

    [Test]
    [Ignore]
    procedure Adding_more_student_adds_them_to_the_sorted_roster;

    [Test]
    [Ignore]
    procedure Adding_students_to_different_grades_adds_them_to_the_same_sorted_roster;

    [Test]
    [Ignore]
    procedure Roster_returns_an_empty_list_if_there_are_no_students_enrolled;

    [Test]
    [Ignore]
    procedure Student_names_with_grades_are_displayed_in_the_same_sorted_roster;

    [Test]
    [Ignore]
    procedure Grade_returns_the_students_in_that_grade_in_alphabetical_order;

    [Test]
    [Ignore]
    procedure Grade_returns_an_empty_list_if_there_are_no_students_in_that_grade;
  end;

implementation

{ GradeSchoolTest }

procedure GradeSchoolTest.CompareTwoArrays<T>(Array1, Array2: array of T);
var
  I: integer;
begin
  Assert.AreEqual(length(Array1), length(Array2));
  for I := Low(Array1) to High(Array1) do
    Assert.AreEqual(Array1[I], Array2[I]);
end;

procedure GradeSchoolTest.Adding_a_student_adds_them_to_the_sorted_roster;
begin
  school.Add('Aimee', 2);
  actual := school.Roster;
  expected.Add('Aimee');

  CompareTwoArrays<string>(expected.ToArray, actual.ToArray);
end;

procedure GradeSchoolTest.Adding_more_student_adds_them_to_the_sorted_roster;
begin
  school.Add('Blair', 2);
  school.Add('James', 2);
  school.Add('Paul', 2);
  actual := school.Roster;
  expected.AddRange(['Blair','James','Paul']);

  CompareTwoArrays<string>(expected.ToArray, actual.ToArray);
end;

procedure GradeSchoolTest.Adding_students_to_different_grades_adds_them_to_the_same_sorted_roster;
begin
  school.Add('Chelsea', 3);
  school.Add('Logan', 7);
  actual := school.Roster;
  expected.AddRange(['Chelsea','Logan']);

  CompareTwoArrays<string>(expected.ToArray, actual.ToArray);
end;

procedure GradeSchoolTest.Grade_returns_an_empty_list_if_there_are_no_students_in_that_grade;
begin
  actual := school.Grade(1);
  Assert.IsEmpty(actual.ToArray);
end;

procedure GradeSchoolTest.Grade_returns_the_students_in_that_grade_in_alphabetical_order;
begin
  school.Add('Franklin', 5);
  school.Add('Bradley', 5);
  school.Add('Jeff', 1);
  actual := school.Grade(5);
  expected.AddRange(['Bradley','Franklin']);

  CompareTwoArrays<string>(expected.ToArray, actual.ToArray);
end;

procedure GradeSchoolTest.Roster_returns_an_empty_list_if_there_are_no_students_enrolled;
begin
  actual := school.Roster;
  Assert.IsEmpty(actual.ToArray);
end;

procedure GradeSchoolTest.Student_names_with_grades_are_displayed_in_the_same_sorted_roster;
begin
  school.Add('Peter', 2);
  school.Add('Anna', 1);
  school.Add('Barb', 1);
  school.Add('Zoe', 2);
  school.Add('Alex', 2);
  school.Add('Jim', 3);
  school.Add('Charlie', 1);
  actual := school.Roster;
  expected.AddRange(['Anna', 'Barb', 'Charlie', 'Alex', 'Peter', 'Zoe', 'Jim']);

  CompareTwoArrays<string>(expected.ToArray, actual.ToArray);
end;

procedure GradeSchoolTest.Setup;
begin
  school := NewSchool;
  expected := TRoster.Create;
end;

procedure GradeSchoolTest.TearDown;
begin
  actual.DisposeOf;
  expected.DisposeOf;
  school := nil;
end;

initialization
  TDUnitX.RegisterTestFixture(GradeSchoolTest);
end.
