"
A FASTFortranJsonExporterVisitorTest is a test class for testing the behavior of FASTFortranJsonExporterVisitor
"
Class {
	#name : #FASTFortranJsonExporterVisitorTest,
	#superclass : #TestCase,
	#instVars : [
		'visitor'
	],
	#category : #'FAST-Fortran-Json-Exporter-Visitor-Tests'
}

{ #category : #running }
FASTFortranJsonExporterVisitorTest >> setUp [

	super setUp.

	"Put here a common initialization logic for tests"
	visitor := FASTFortranJsonExporterVisitor new
]

{ #category : #running }
FASTFortranJsonExporterVisitorTest >> testAssignementIntegerLiteral [

	| expectedCode actualCode jsonCode |
	expectedCode := '      PROGRAM MYPROG
      c = 1
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:11)-(2:15)","statement":{"anno":[],"expression":{"anno":[],"span":"(2:15)-(2:15)","tag":"value","value":{"contents":["1",null],"tag":"integer"}},"span":"(2:11)-(2:15)","tag":"assign_expression","target":{"anno":[],"span":"(2:11)-(2:11)","tag":"value","value":{"contents":"c","tag":"variable"}}},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.


	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #running }
FASTFortranJsonExporterVisitorTest >> testAssignementRealLiteral [

	| expectedCode actualCode jsonCode |
	expectedCode := '      PROGRAM MYPROG
      c = 2.12
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:11)-(2:18)","statement":{"anno":[],"expression":{"anno":[],"span":"(2:15)-(2:18)","tag":"value","value":{"contents":[{"exponent":{"letter":"e","num":"0"},"significand":"2.12"},null],"tag":"real"}},"span":"(2:11)-(2:18)","tag":"assign_expression","target":{"anno":[],"span":"(2:11)-(2:11)","tag":"value","value":{"contents":"c","tag":"variable"}}},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.

	self assert: actualCode equals: expectedCode asLowercase.
]

{ #category : #running }
FASTFortranJsonExporterVisitorTest >> testAssignementStringLiteral [

	| expectedCode actualCode jsonCode |
	expectedCode := '      PROGRAM MYPROG
      c = ''once upon a time''
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:11)-(2:32)","statement":{"anno":[],"expression":{"anno":[],"span":"(2:15)-(2:32)","tag":"value","value":{"contents":"once upon a time","tag":"string"}},"span":"(2:11)-(2:32)","tag":"assign_expression","target":{"anno":[],"span":"(2:11)-(2:11)","tag":"value","value":{"contents":"c","tag":"variable"}}},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.

	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #running }
FASTFortranJsonExporterVisitorTest >> testBinaryExpressionAddition [

	| expectedCode actualCode jsonCode |
	expectedCode := '      PROGRAM MYPROG
      i = 5+6
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:8)-(2:16)","statement":{"anno":[],"expression":{"anno":[],"left":{"anno":[],"span":"(2:12)-(2:12)","tag":"value","value":{"contents":["5",null],"tag":"integer"}},"op":{"tag":"addition"},"right":{"anno":[],"span":"(2:16)-(2:16)","tag":"value","value":{"contents":["6",null],"tag":"integer"}},"span":"(2:12)-(2:16)","tag":"binary"},"span":"(2:8)-(2:16)","tag":"assign_expression","target":{"anno":[],"span":"(2:8)-(2:8)","tag":"value","value":{"contents":"i","tag":"variable"}}},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.


	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #running }
FASTFortranJsonExporterVisitorTest >> testBinaryExpressionDivision [

	| expectedCode actualCode jsonCode |
	expectedCode := '      PROGRAM MYPROG
      i = 5/6
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:8)-(2:16)","statement":{"anno":[],"expression":{"anno":[],"left":{"anno":[],"span":"(2:12)-(2:12)","tag":"value","value":{"contents":["5",null],"tag":"integer"}},"op":{"tag":"division"},"right":{"anno":[],"span":"(2:16)-(2:16)","tag":"value","value":{"contents":["6",null],"tag":"integer"}},"span":"(2:12)-(2:16)","tag":"binary"},"span":"(2:8)-(2:16)","tag":"assign_expression","target":{"anno":[],"span":"(2:8)-(2:8)","tag":"value","value":{"contents":"i","tag":"variable"}}},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.


	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #running }
FASTFortranJsonExporterVisitorTest >> testBinaryExpressionEqKeyword [

	| expectedCode actualCode jsonCode |
	expectedCode := '      PROGRAM MYPROG
      IF(5.eq.6)THEN
      END IF
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"blocks":null,"conditions":[[{"anno":[],"left":{"anno":[],"span":"(2:13)-(2:13)","tag":"value","value":{"contents":["5",null],"tag":"integer"}},"op":{"tag":"eq"},"right":{"anno":[],"span":"(2:20)-(2:20)","tag":"value","value":{"contents":["6",null],"tag":"integer"}},"span":"(2:13)-(2:20)","tag":"binary"},[]]],"end_label":null,"label":null,"name":null,"span":"(2:8)-(3:13)","tag":"if"}],"name":"myprog","span":"(1:7)-(4:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.

	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #running }
FASTFortranJsonExporterVisitorTest >> testBinaryExpressionExponentiation [

	| expectedCode actualCode jsonCode |
	expectedCode := '      PROGRAM MYPROG
      i = 5**6
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:8)-(2:17)","statement":{"anno":[],"expression":{"anno":[],"left":{"anno":[],"span":"(2:12)-(2:12)","tag":"value","value":{"contents":["5",null],"tag":"integer"}},"op":{"tag":"exponentiation"},"right":{"anno":[],"span":"(2:17)-(2:17)","tag":"value","value":{"contents":["6",null],"tag":"integer"}},"span":"(2:12)-(2:17)","tag":"binary"},"span":"(2:8)-(2:17)","tag":"assign_expression","target":{"anno":[],"span":"(2:8)-(2:8)","tag":"value","value":{"contents":"i","tag":"variable"}}},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.

	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #running }
FASTFortranJsonExporterVisitorTest >> testBinaryExpressionMultiplication [

	| expectedCode actualCode jsonCode |
	expectedCode := '      PROGRAM MYPROG
      i = 5*6
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:8)-(2:16)","statement":{"anno":[],"expression":{"anno":[],"left":{"anno":[],"span":"(2:12)-(2:12)","tag":"value","value":{"contents":["5",null],"tag":"integer"}},"op":{"tag":"multiplication"},"right":{"anno":[],"span":"(2:16)-(2:16)","tag":"value","value":{"contents":["6",null],"tag":"integer"}},"span":"(2:12)-(2:16)","tag":"binary"},"span":"(2:8)-(2:16)","tag":"assign_expression","target":{"anno":[],"span":"(2:8)-(2:8)","tag":"value","value":{"contents":"i","tag":"variable"}}},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.

	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #running }
FASTFortranJsonExporterVisitorTest >> testBinaryExpressionSubtraction [

	| expectedCode actualCode jsonCode |
	expectedCode := '      PROGRAM MYPROG
      i = 5-6
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:8)-(2:16)","statement":{"anno":[],"expression":{"anno":[],"left":{"anno":[],"span":"(2:12)-(2:12)","tag":"value","value":{"contents":["5",null],"tag":"integer"}},"op":{"tag":"subtraction"},"right":{"anno":[],"span":"(2:16)-(2:16)","tag":"value","value":{"contents":["6",null],"tag":"integer"}},"span":"(2:12)-(2:16)","tag":"binary"},"span":"(2:8)-(2:16)","tag":"assign_expression","target":{"anno":[],"span":"(2:8)-(2:8)","tag":"value","value":{"contents":"i","tag":"variable"}}},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.

	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #running }
FASTFortranJsonExporterVisitorTest >> testContinueStatement [

	| expectedCode actualCode jsonCode |
	expectedCode := '      PROGRAM MYPROG
      CONTINUE
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:8)-(2:15)","statement":{"anno":[],"span":"(2:8)-(2:15)","tag":"continue"},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.

	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #running }
FASTFortranJsonExporterVisitorTest >> testExternalStatement [

	| expectedCode actualCode jsonCode |
	expectedCode := '      program main
      external mypnt
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:20)","statement":{"anno":[],"span":"(2:7)-(2:20)","tag":"external","vars":{"anno":[],"list":[{"anno":[],"span":"(2:16)-(2:20)","tag":"value","value":{"contents":"mypnt","tag":"variable"}}],"span":"(2:16)-(2:20)"}},"tag":"statement"}],"name":"main","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.

	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #running }
FASTFortranJsonExporterVisitorTest >> testFunctionNoParameter [

	| expectedCode actualCode jsonCode |
	expectedCode := '      integer function aFct()
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"arguments":null,"blocks":[],"name":"afct","result":null,"span":"(1:7)-(2:9)","subprograms":null,"tag":"function","type":{"anno":[],"base_type":"integer","selector":null,"span":"(1:7)-(1:13)"}}]}'.

	actualCode := self visitJsonCode: jsonCode.

	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #running }
FASTFortranJsonExporterVisitorTest >> testFunctionWithParameter [

	| expectedCode actualCode jsonCode |
	expectedCode := '      integer function aFct(i,j)
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"arguments":{"anno":[],"list":[{"anno":[],"span":"(2:29)-(2:29)","tag":"value","value":{"contents":"i","tag":"variable"}},{"anno":[],"span":"(2:31)-(2:31)","tag":"value","value":{"contents":"j","tag":"variable"}}],"span":"(2:29)-(2:31)"},"blocks":[],"name":"afct","result":null,"span":"(2:7)-(3:9)","subprograms":null,"tag":"function","type":{"anno":[],"base_type":"integer","selector":null,"span":"(2:7)-(2:13)"}}]}'.

	actualCode := self visitJsonCode: jsonCode.

	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #running }
FASTFortranJsonExporterVisitorTest >> testMainProgram [

	| expectedCode actualCode jsonCode |
	expectedCode := '      program main
      implicit none
c23456789 123456789 123456789 123456789 123456789 123456789 12
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:19)","statement":{"anno":[],"items":null,"span":"(2:7)-(2:19)","tag":"implicit"},"tag":"statement"},{"anno":[],"comment":"23456789 123456789 123456789 123456789 123456789 123456789 12","span":"(3:1)-(3:62)","tag":"comment"}],"name":"main","span":"(1:7)-(4:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.

	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #running }
FASTFortranJsonExporterVisitorTest >> testMainProgramAndSubroutine [

	| expectedCode actualCode jsonCode |
	expectedCode := '      PROGRAM TESTALT
      END
      SUBROUTINE RANK
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[],"name":"testalt","span":"(1:7)-(2:9)","subprograms":null,"tag":"main"},{"anno":[],"arguments":null,"blocks":[],"name":"rank","options":[null,null],"span":"(4:7)-(5:9)","subprograms":null,"tag":"subroutine"}]}'.

	actualCode := self visitJsonCode: jsonCode.

	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #running }
FASTFortranJsonExporterVisitorTest >> testReturnStatementEmpty [

	| expectedCode actualCode jsonCode |
	expectedCode := '      PROGRAM MYPROG
      return
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:12)","statement":{"anno":[],"span":"(2:7)-(2:12)","tag":"return","target":null},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.

	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #running }
FASTFortranJsonExporterVisitorTest >> testStatementCallSubroutine [

	| expectedCode actualCode jsonCode |
	expectedCode := '      PROGRAM TESTALT
      CALL SUB(N)
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"<stdin>"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:17)","statement":{"anno":[],"arguments":{"anno":[],"list":[{"anno":[],"expr":{"contents":{"anno":[],"span":"(2:16)-(2:16)","tag":"value","value":{"contents":"n","tag":"variable"}},"tag":"expr"},"name":null,"span":"(2:16)-(2:16)"}],"span":"(2:15)-(2:17)"},"function":{"anno":[],"span":"(2:12)-(2:14)","tag":"value","value":{"contents":"sub","tag":"variable"}},"span":"(2:7)-(2:17)","tag":"call"},"tag":"statement"}],"name":"testalt","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.


	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #running }
FASTFortranJsonExporterVisitorTest >> testStatementCallWrite [

	| expectedCode actualCode jsonCode |
	expectedCode := '      PROGRAM TESTALT
      WRITE (*,*) "OK - Normal Return [n=0]"
      END 
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:8)-(2:45)","statement":{"anno":[],"arguments":{"anno":[],"list":[{"anno":[],"span":"(2:20)-(2:45)","tag":"value","value":{"contents":"OK - Normal Return [n=0]","tag":"string"}}],"span":"(2:20)-(2:45)"},"format":{"anno":[],"list":[{"anno":[],"expr":{"anno":[],"span":"(2:15)-(2:15)","tag":"value","value":{"tag":"star"}},"name":null,"span":"(2:15)-(2:15)"},{"anno":[],"expr":{"anno":[],"span":"(2:17)-(2:17)","tag":"value","value":{"tag":"star"}},"name":null,"span":"(2:17)-(2:17)"}],"span":"(2:14)-(2:18)"},"span":"(2:8)-(2:45)","tag":"write"},"tag":"statement"}],"name":"testalt","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.


	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #running }
FASTFortranJsonExporterVisitorTest >> testStatementExit [

	| expectedCode actualCode jsonCode |
	expectedCode := '      PROGRAM TESTALT
      exit
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:8)-(2:11)","statement":{"anno":[],"span":"(2:8)-(2:11)","tag":"exit","var":null},"tag":"statement"}],"name":"testalt","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.


	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #running }
FASTFortranJsonExporterVisitorTest >> testStatementGoto [

	| expectedCode actualCode jsonCode |
	expectedCode := '      PROGRAM TESTALT
      GOTO 100
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:8)-(2:15)","statement":{"anno":[],"span":"(2:8)-(2:15)","tag":"goto","target":{"anno":[],"span":"(2:13)-(2:15)","tag":"value","value":{"contents":["100",null],"tag":"integer"}}},"tag":"statement"}],"name":"testalt","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.


	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #running }
FASTFortranJsonExporterVisitorTest >> testStatementStop [

	| expectedCode actualCode jsonCode |
	expectedCode := '      PROGRAM TESTALT
      STOP
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:8)-(2:11)","statement":{"anno":[],"message":null,"span":"(2:8)-(2:11)","tag":"stop"},"tag":"statement"}],"name":"testalt","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.


	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #running }
FASTFortranJsonExporterVisitorTest >> testStatementStopWithMessage [

	| expectedCode actualCode jsonCode |
	expectedCode := '      PROGRAM TESTALT
      STOP 10
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:8)-(2:14)","statement":{"anno":[],"message":{"anno":[],"span":"(2:13)-(2:14)","tag":"value","value":{"contents":["10",null],"tag":"integer"}},"span":"(2:8)-(2:14)","tag":"stop"},"tag":"statement"}],"name":"testalt","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.


	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #running }
FASTFortranJsonExporterVisitorTest >> testStatementWithLabel [

	| expectedCode actualCode jsonCode |
	expectedCode := '      PROGRAM TESTALT
10     STOP
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":{"anno":[],"span":"(2:1)-(2:2)","tag":"value","value":{"contents":["10",null],"tag":"integer"}},"span":"(2:1)-(2:11)","statement":{"anno":[],"message":null,"span":"(2:8)-(2:11)","tag":"stop"},"tag":"statement"}],"name":"testalt","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.


	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #running }
FASTFortranJsonExporterVisitorTest >> visitJsonCode: jsonCode [

	^ visitor visitProgramFile: (NeoJSONReader fromString: jsonCode)
]
