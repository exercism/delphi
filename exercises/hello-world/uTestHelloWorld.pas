//*****************************************************************************
// You got an error, which is exactly as it should be.
// This is the first step in the Test-Driven Development
// (TDD) process.
//
// The most important part of the error is
//
//   "cannot compile"
//
// It's looking for a file named uHelloWorld.pas that doesn't exist.
//
// To fix the error, create a unit file named uHelloWorld.pas
// in the same directory as the file uTestHelloWorld.pas.
//
// The beginning of the new unit file should contain a unit statement:
//
// unit uHelloWorld;
//
// The new unit should contain Interface, Implementation, and End. statements.
//
// Hint: Delphi will take care of all this if you instruct it to add a new unit
// to your project.  Be sure to save the new unit as uHelloWorld.pas before
// trying to compile again.
//
// For more guidance as you work on this exercise, see
// GETTING_STARTED.md.
//*****************************************************************************
unit uTestHelloWorld;

interface
uses
  DUnitX.TestFramework;

type
  [TestFixture]
  HelloWorldTest = class(TObject)
  public
    [Test]
    procedure Say_hi;
  end;

implementation
uses uHelloWorld;

procedure HelloWorldTest.Say_hi;
begin
  assert.AreEqual('Hello, World!', Hello);
end;

initialization
  TDUnitX.RegisterTestFixture(HelloWorldTest);
end.
