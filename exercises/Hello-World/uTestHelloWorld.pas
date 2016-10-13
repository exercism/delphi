unit uTestHelloWorld;

interface
uses
  DUnitX.TestFramework;

type
  [TestFixture]
  HelloWorldTest = class(TObject)
  public
    [Test]
//    [Ignore]
    procedure test_no_name;
    [Test]
//    [Ignore]
    procedure test_sample_name;
    [Test]
//    [Ignore]
    procedure test_other_sample_name;
  end;

implementation
uses uHelloWorld;

procedure HelloWorldTest.test_no_name;
begin
  assert.AreEqual('Hello, World!', THelloWorld.hello);
end;

procedure HelloWorldTest.test_sample_name;
begin
  assert.AreEqual('Hello, Alice!',THelloWorld.hello('Alice'));
end;

procedure HelloWorldTest.test_other_sample_name;
begin
  assert.AreEqual('Hello, Bob!', THelloWorld.hello('Bob'));
end;

initialization
  TDUnitX.RegisterTestFixture(HelloWorldTest);
end.

(*
*****************************************************
You got an error, which is exactly as it should be.
This is the first step in the Test-Driven Development
(TDD) process.

The most important part of the error is

   "cannot compile"

It's looking for a file named uHelloWorld.pas that doesn't
exist yet.

To fix the error, create an empty file named uHelloWorld.pas
in the same directory as the uTestHelloWorld.pas file.

Then run the test again.

For more guidance as you work on this exercise, see
GETTING_STARTED.md.
*****************************************************
*)