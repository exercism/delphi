(******************************************************************************
 You got an error, which is exactly as it should be.
 This is the first step in the Test-Driven Development
 (TDD) process.

 The most important part of the error is

   "cannot compile"

 It's looking for a file named utwo-fer.pas that doesn't exist.

 To fix the error, create a unit file named utwo-fer.pas
 in the same directory as the file utwo-ferTest.pas.

 The beginning of the new unit file should contain a unit statement:

 unit utwofer;

 The new unit should contain Interface, Implementation, and End. statements.

 Hint: Delphi will take care of all this if you instruct it to add a new unit
 to your project.  Be sure to save the new unit as utwo-fer.pas before
 trying to compile again.

 For more guidance as you work on this exercise, see
 GETTING_STARTED.md.
******************************************************************************)
unit utwoferTests;

interface
uses
  DUnitX.TestFramework;
  
const
  CanonicalVersion = '1.2.0.1';

type
  [TestFixture]
  twoferTest = class(TObject)
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure No_name_given;

    [Test]
    [Ignore]
    procedure A_name_given;

    [Test]
    [Ignore]
    procedure Another_name_given;
  end;

implementation
uses utwofer;

procedure twoferTest.No_name_given;
begin
  Assert.AreEqual('One for you, one for me.', twoFer);
end;

procedure twoferTest.A_name_given;
begin
  Assert.AreEqual('One for Alice, one for me.', twoFer('Alice'));
end;

procedure twoferTest.Another_name_given;
begin
  Assert.AreEqual('One for Bob, one for me.', twoFer('Bob'));
end;

initialization
  TDUnitX.RegisterTestFixture(twoferTest);
end.
