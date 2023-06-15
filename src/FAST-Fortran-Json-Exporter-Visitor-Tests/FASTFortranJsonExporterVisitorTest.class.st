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

{ #category : #'tests-expression' }
FASTFortranJsonExporterVisitorTest >> testAssignementIntegerLiteral [

	| expectedCode actualCode jsonCode |
	expectedCode := '      PROGRAM MYPROG
      c = 1
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"<stdin>"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:11)","statement":{"anno":[],"expression":{"anno":[],"span":"(2:11)-(2:11)","tag":"value","value":{"contents":["1",null],"tag":"integer"}},"span":"(2:7)-(2:11)","tag":"assign_expression","target":{"anno":[],"span":"(2:7)-(2:7)","tag":"value","value":{"contents":"c","tag":"variable"}}},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.


	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #'tests-expression' }
FASTFortranJsonExporterVisitorTest >> testAssignementRealLiteral [

	| expectedCode actualCode jsonCode |
	expectedCode := '      PROGRAM MYPROG
      c = 2.12
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"<stdin>"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:14)","statement":{"anno":[],"expression":{"anno":[],"span":"(2:11)-(2:14)","tag":"value","value":{"contents":[{"exponent":{"letter":"e","num":"0"},"significand":"2.12"},null],"tag":"real"}},"span":"(2:7)-(2:14)","tag":"assign_expression","target":{"anno":[],"span":"(2:7)-(2:7)","tag":"value","value":{"contents":"c","tag":"variable"}}},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.

	self assert: actualCode equals: expectedCode asLowercase.
]

{ #category : #'tests-expression' }
FASTFortranJsonExporterVisitorTest >> testAssignementStringLiteral [

	| expectedCode actualCode jsonCode |
	expectedCode := '      PROGRAM MYPROG
      c = ''once upon a time''
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"<stdin>"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:28)","statement":{"anno":[],"expression":{"anno":[],"span":"(2:11)-(2:28)","tag":"value","value":{"contents":"once upon a time","tag":"string"}},"span":"(2:7)-(2:28)","tag":"assign_expression","target":{"anno":[],"span":"(2:7)-(2:7)","tag":"value","value":{"contents":"c","tag":"variable"}}},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.

	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #'tests-expression' }
FASTFortranJsonExporterVisitorTest >> testBinaryExpressionAddition [

	| expectedCode actualCode jsonCode |
	expectedCode := '      PROGRAM MYPROG
      i = 5 + 6
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"<stdin>"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:15)","statement":{"anno":[],"expression":{"anno":[],"left":{"anno":[],"span":"(2:11)-(2:11)","tag":"value","value":{"contents":["5",null],"tag":"integer"}},"op":{"tag":"addition"},"right":{"anno":[],"span":"(2:15)-(2:15)","tag":"value","value":{"contents":["6",null],"tag":"integer"}},"span":"(2:11)-(2:15)","tag":"binary"},"span":"(2:7)-(2:15)","tag":"assign_expression","target":{"anno":[],"span":"(2:7)-(2:7)","tag":"value","value":{"contents":"i","tag":"variable"}}},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.


	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #'tests-expression' }
FASTFortranJsonExporterVisitorTest >> testBinaryExpressionDivision [

	| expectedCode actualCode jsonCode |
	expectedCode := '      PROGRAM MYPROG
      i = 5 / 6
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"<stdin>"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:15)","statement":{"anno":[],"expression":{"anno":[],"left":{"anno":[],"span":"(2:11)-(2:11)","tag":"value","value":{"contents":["5",null],"tag":"integer"}},"op":{"tag":"division"},"right":{"anno":[],"span":"(2:15)-(2:15)","tag":"value","value":{"contents":["6",null],"tag":"integer"}},"span":"(2:11)-(2:15)","tag":"binary"},"span":"(2:7)-(2:15)","tag":"assign_expression","target":{"anno":[],"span":"(2:7)-(2:7)","tag":"value","value":{"contents":"i","tag":"variable"}}},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.


	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #'tests-expression' }
FASTFortranJsonExporterVisitorTest >> testBinaryExpressionEqKeyword [

	| expectedCode actualCode jsonCode |
	expectedCode := '      PROGRAM MYPROG
      IF (5 .eq. 6) THEN
      END IF
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"<stdin>"},"program_units":[{"anno":[],"blocks":[{"anno":[],"blocks":null,"conditions":[[{"anno":[],"left":{"anno":[],"span":"(2:11)-(2:11)","tag":"value","value":{"contents":["5",null],"tag":"integer"}},"op":{"tag":"eq"},"right":{"anno":[],"span":"(2:18)-(2:18)","tag":"value","value":{"contents":["6",null],"tag":"integer"}},"span":"(2:11)-(2:18)","tag":"binary"},[]]],"end_label":null,"label":null,"name":null,"span":"(2:7)-(3:12)","tag":"if"}],"name":"myprog","span":"(1:7)-(4:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.

	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #'tests-expression' }
FASTFortranJsonExporterVisitorTest >> testBinaryExpressionExponentiation [

	| expectedCode actualCode jsonCode |
	expectedCode := '      PROGRAM MYPROG
      i = 5 ** 6
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"<stdin>"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:16)","statement":{"anno":[],"expression":{"anno":[],"left":{"anno":[],"span":"(2:11)-(2:11)","tag":"value","value":{"contents":["5",null],"tag":"integer"}},"op":{"tag":"exponentiation"},"right":{"anno":[],"span":"(2:16)-(2:16)","tag":"value","value":{"contents":["6",null],"tag":"integer"}},"span":"(2:11)-(2:16)","tag":"binary"},"span":"(2:7)-(2:16)","tag":"assign_expression","target":{"anno":[],"span":"(2:7)-(2:7)","tag":"value","value":{"contents":"i","tag":"variable"}}},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.

	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #'tests-expression' }
FASTFortranJsonExporterVisitorTest >> testBinaryExpressionGtKeyword [

	| expectedCode actualCode jsonCode |
	expectedCode := '      PROGRAM MYPROG
      IF (5 .gt. 6) THEN
      END IF
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"<stdin>"},"program_units":[{"anno":[],"blocks":[{"anno":[],"blocks":null,"conditions":[[{"anno":[],"left":{"anno":[],"span":"(2:11)-(2:11)","tag":"value","value":{"contents":["5",null],"tag":"integer"}},"op":{"tag":"gt"},"right":{"anno":[],"span":"(2:18)-(2:18)","tag":"value","value":{"contents":["6",null],"tag":"integer"}},"span":"(2:11)-(2:18)","tag":"binary"},[]]],"end_label":null,"label":null,"name":null,"span":"(2:7)-(3:12)","tag":"if"}],"name":"myprog","span":"(1:7)-(4:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.

	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #'tests-expression' }
FASTFortranJsonExporterVisitorTest >> testBinaryExpressionGtSymbol [

	| expectedCode actualCode jsonCode |
	self skip.
	self flag: #NOTE. "symbol > seen as .gt."
	expectedCode := '      PROGRAM MYPROG
      IF (5 > 6) THEN
      END IF
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"./fortran77.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"blocks":null,"conditions":[[{"anno":[],"left":{"anno":[],"span":"(2:13)-(2:13)","tag":"value","value":{"contents":["5",null],"tag":"integer"}},"op":{"tag":"gt"},"right":{"anno":[],"span":"(2:17)-(2:17)","tag":"value","value":{"contents":["6",null],"tag":"integer"}},"span":"(2:13)-(2:17)","tag":"binary"},[]]],"end_label":null,"label":null,"name":null,"span":"(2:8)-(3:13)","tag":"if"}],"name":"myprog","span":"(1:7)-(4:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.

	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #'tests-expression' }
FASTFortranJsonExporterVisitorTest >> testBinaryExpressionLtKeyword [

	| expectedCode actualCode jsonCode |
	expectedCode := '      PROGRAM MYPROG
      IF (5 .Lt. 6) THEN
      END IF
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"<stdin>"},"program_units":[{"anno":[],"blocks":[{"anno":[],"blocks":null,"conditions":[[{"anno":[],"left":{"anno":[],"span":"(2:11)-(2:11)","tag":"value","value":{"contents":["5",null],"tag":"integer"}},"op":{"tag":"lt"},"right":{"anno":[],"span":"(2:18)-(2:18)","tag":"value","value":{"contents":["6",null],"tag":"integer"}},"span":"(2:11)-(2:18)","tag":"binary"},[]]],"end_label":null,"label":null,"name":null,"span":"(2:7)-(3:12)","tag":"if"}],"name":"myprog","span":"(1:7)-(4:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.

	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #'tests-expression' }
FASTFortranJsonExporterVisitorTest >> testBinaryExpressionMultiplication [

	| expectedCode actualCode jsonCode |
	expectedCode := '      PROGRAM MYPROG
      i = 5 * 6
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"<stdin>"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:15)","statement":{"anno":[],"expression":{"anno":[],"left":{"anno":[],"span":"(2:11)-(2:11)","tag":"value","value":{"contents":["5",null],"tag":"integer"}},"op":{"tag":"multiplication"},"right":{"anno":[],"span":"(2:15)-(2:15)","tag":"value","value":{"contents":["6",null],"tag":"integer"}},"span":"(2:11)-(2:15)","tag":"binary"},"span":"(2:7)-(2:15)","tag":"assign_expression","target":{"anno":[],"span":"(2:7)-(2:7)","tag":"value","value":{"contents":"i","tag":"variable"}}},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.

	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #'tests-expression' }
FASTFortranJsonExporterVisitorTest >> testBinaryExpressionSubtraction [

	| expectedCode actualCode jsonCode |
	expectedCode := '      PROGRAM MYPROG
      i = 5 - 6
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"<stdin>"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:15)","statement":{"anno":[],"expression":{"anno":[],"left":{"anno":[],"span":"(2:11)-(2:11)","tag":"value","value":{"contents":["5",null],"tag":"integer"}},"op":{"tag":"subtraction"},"right":{"anno":[],"span":"(2:15)-(2:15)","tag":"value","value":{"contents":["6",null],"tag":"integer"}},"span":"(2:11)-(2:15)","tag":"binary"},"span":"(2:7)-(2:15)","tag":"assign_expression","target":{"anno":[],"span":"(2:7)-(2:7)","tag":"value","value":{"contents":"i","tag":"variable"}}},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.

	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #'tests-programUnit' }
FASTFortranJsonExporterVisitorTest >> testBlockData [

	| expectedCode actualCode jsonCode |
	self skip.
	self flag: #TODO. ""
	expectedCode := '      block data myblck
      common /mycom/ i
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"<stdin>"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:22)","statement":{"anno":[],"common_groups":{"anno":[],"list":[{"anno":[],"name":{"anno":[],"span":"(2:14)-(2:20)","tag":"value","value":{"contents":"mycom","tag":"variable"}},"span":"(2:14)-(2:22)","vars":{"anno":[],"list":[{"anno":[],"initial":null,"length":null,"span":"(2:22)-(2:22)","type":"scalar","variable":{"anno":[],"span":"(2:22)-(2:22)","tag":"value","value":{"contents":"i","tag":"variable"}}}],"span":"(2:22)-(2:22)"}}],"span":"(2:14)-(2:22)"},"span":"(2:7)-(2:22)","tag":"common"},"tag":"statement"}],"name":"myblck","span":"(1:7)-(3:9)","tag":"block_data"}]}'.

	actualCode := self visitJsonCode: jsonCode.

	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #'tests-statement' }
FASTFortranJsonExporterVisitorTest >> testContinueStatement [

	| expectedCode actualCode jsonCode |
	expectedCode := '      PROGRAM MYPROG
      CONTINUE
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"<stdin>"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:14)","statement":{"anno":[],"span":"(2:7)-(2:14)","tag":"continue"},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.

	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #'tests-statement' }
FASTFortranJsonExporterVisitorTest >> testDoStatementEmptyNoIncrement [

	| expectedCode actualCode jsonCode |
	expectedCode := '      program main
      do i = 1,max
      end do
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"<stdin>"},"program_units":[{"anno":[],"blocks":[{"anno":[],"body":[],"do_spec":{"anno":[],"increment":null,"initial":{"anno":[],"expression":{"anno":[],"span":"(2:14)-(2:14)","tag":"value","value":{"contents":["1",null],"tag":"integer"}},"span":"(2:10)-(2:14)","tag":"assign_expression","target":{"anno":[],"span":"(2:10)-(2:10)","tag":"value","value":{"contents":"i","tag":"variable"}}},"limit":{"anno":[],"span":"(2:16)-(2:18)","tag":"value","value":{"contents":"max","tag":"variable"}},"span":"(2:10)-(2:18)"},"end_label":null,"label":null,"name":null,"span":"(2:7)-(3:12)","tag":"do","target":null}],"name":"main","span":"(1:7)-(4:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.

	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #'tests-statement' }
FASTFortranJsonExporterVisitorTest >> testExternalStatement [

	| expectedCode actualCode jsonCode |
	expectedCode := '      program main
      external mypnt
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"<stdin>"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:20)","statement":{"anno":[],"span":"(2:7)-(2:20)","tag":"external","vars":{"anno":[],"list":[{"anno":[],"span":"(2:16)-(2:20)","tag":"value","value":{"contents":"mypnt","tag":"variable"}}],"span":"(2:16)-(2:20)"}},"tag":"statement"}],"name":"main","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.

	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #'tests-programUnit' }
FASTFortranJsonExporterVisitorTest >> testFunctionNoParameter [

	| expectedCode actualCode jsonCode |
	expectedCode := '      integer function aFct()
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"<stdin>"},"program_units":[{"anno":[],"arguments":null,"blocks":[],"name":"afct","result":null,"span":"(1:7)-(2:9)","subprograms":null,"tag":"function","type":{"anno":[],"base_type":"integer","selector":null,"span":"(1:7)-(1:13)"}}]}'.

	actualCode := self visitJsonCode: jsonCode.

	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #'tests-statement' }
FASTFortranJsonExporterVisitorTest >> testFunctionStatement [

	| expectedCode actualCode jsonCode |
	expectedCode := '      program myprog
      f(i) = 2 * i
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"<stdin>"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:18)","statement":{"anno":[],"arguments":{"anno":[],"list":[{"anno":[],"span":"(2:9)-(2:9)","tag":"value","value":{"contents":"i","tag":"variable"}}],"span":"(2:9)-(2:9)"},"body":{"anno":[],"left":{"anno":[],"span":"(2:14)-(2:14)","tag":"value","value":{"contents":["2",null],"tag":"integer"}},"op":{"tag":"multiplication"},"right":{"anno":[],"span":"(2:18)-(2:18)","tag":"value","value":{"contents":"i","tag":"variable"}},"span":"(2:14)-(2:18)","tag":"binary"},"name":{"anno":[],"span":"(2:7)-(2:7)","tag":"value","value":{"contents":"f","tag":"variable"}},"span":"(2:7)-(2:18)","tag":"function"},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.

	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #'tests-programUnit' }
FASTFortranJsonExporterVisitorTest >> testFunctionWithParameter [

	| expectedCode actualCode jsonCode |
	expectedCode := '      integer function aFct(i,j)
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"<stdin>"},"program_units":[{"anno":[],"arguments":{"anno":[],"list":[{"anno":[],"span":"(1:29)-(1:29)","tag":"value","value":{"contents":"i","tag":"variable"}},{"anno":[],"span":"(1:31)-(1:31)","tag":"value","value":{"contents":"j","tag":"variable"}}],"span":"(1:29)-(1:31)"},"blocks":[],"name":"afct","result":null,"span":"(1:7)-(2:9)","subprograms":null,"tag":"function","type":{"anno":[],"base_type":"integer","selector":null,"span":"(1:7)-(1:13)"}}]}'.

	actualCode := self visitJsonCode: jsonCode.

	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #'tests-statement' }
FASTFortranJsonExporterVisitorTest >> testIfElse [

	| expectedCode actualCode jsonCode |
	expectedCode := '      PROGRAM MYPROG
      IF (A) THEN
      a = 1
      ELSE
      d = 1
      END IF
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"<stdin>"},"program_units":[{"anno":[],"blocks":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(5:7)-(5:11)","statement":{"anno":[],"expression":{"anno":[],"span":"(5:11)-(5:11)","tag":"value","value":{"contents":["1",null],"tag":"integer"}},"span":"(5:7)-(5:11)","tag":"assign_expression","target":{"anno":[],"span":"(5:7)-(5:7)","tag":"value","value":{"contents":"d","tag":"variable"}}},"tag":"statement"}],"conditions":[[{"anno":[],"span":"(2:11)-(2:11)","tag":"value","value":{"contents":"a","tag":"variable"}},[{"anno":[],"label":null,"span":"(3:7)-(3:11)","statement":{"anno":[],"expression":{"anno":[],"span":"(3:11)-(3:11)","tag":"value","value":{"contents":["1",null],"tag":"integer"}},"span":"(3:7)-(3:11)","tag":"assign_expression","target":{"anno":[],"span":"(3:7)-(3:7)","tag":"value","value":{"contents":"a","tag":"variable"}}},"tag":"statement"}]]],"end_label":null,"label":null,"name":null,"span":"(2:7)-(6:12)","tag":"if"}],"name":"myprog","span":"(1:7)-(7:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.

	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #'tests-statement' }
FASTFortranJsonExporterVisitorTest >> testIfElseIf [

	| expectedCode actualCode jsonCode |
	expectedCode := '      PROGRAM MYPROG
      IF (A) THEN
      a = 1
      else if (b) then
      b = 1
      else if (c) then
      c = 1
      ELSE
      d = 1
      END IF
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"<stdin>"},"program_units":[{"anno":[],"blocks":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(9:7)-(9:11)","statement":{"anno":[],"expression":{"anno":[],"span":"(9:11)-(9:11)","tag":"value","value":{"contents":["1",null],"tag":"integer"}},"span":"(9:7)-(9:11)","tag":"assign_expression","target":{"anno":[],"span":"(9:7)-(9:7)","tag":"value","value":{"contents":"d","tag":"variable"}}},"tag":"statement"}],"conditions":[[{"anno":[],"span":"(2:11)-(2:11)","tag":"value","value":{"contents":"a","tag":"variable"}},[{"anno":[],"label":null,"span":"(3:7)-(3:11)","statement":{"anno":[],"expression":{"anno":[],"span":"(3:11)-(3:11)","tag":"value","value":{"contents":["1",null],"tag":"integer"}},"span":"(3:7)-(3:11)","tag":"assign_expression","target":{"anno":[],"span":"(3:7)-(3:7)","tag":"value","value":{"contents":"a","tag":"variable"}}},"tag":"statement"}]],[{"anno":[],"span":"(4:16)-(4:16)","tag":"value","value":{"contents":"b","tag":"variable"}},[{"anno":[],"label":null,"span":"(5:7)-(5:11)","statement":{"anno":[],"expression":{"anno":[],"span":"(5:11)-(5:11)","tag":"value","value":{"contents":["1",null],"tag":"integer"}},"span":"(5:7)-(5:11)","tag":"assign_expression","target":{"anno":[],"span":"(5:7)-(5:7)","tag":"value","value":{"contents":"b","tag":"variable"}}},"tag":"statement"}]],[{"anno":[],"span":"(6:16)-(6:16)","tag":"value","value":{"contents":"c","tag":"variable"}},[{"anno":[],"label":null,"span":"(7:7)-(7:11)","statement":{"anno":[],"expression":{"anno":[],"span":"(7:11)-(7:11)","tag":"value","value":{"contents":["1",null],"tag":"integer"}},"span":"(7:7)-(7:11)","tag":"assign_expression","target":{"anno":[],"span":"(7:7)-(7:7)","tag":"value","value":{"contents":"c","tag":"variable"}}},"tag":"statement"}]]],"end_label":null,"label":null,"name":null,"span":"(2:7)-(10:12)","tag":"if"}],"name":"myprog","span":"(1:7)-(11:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.

	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #running }
FASTFortranJsonExporterVisitorTest >> testIfElseWithStatement [

	| expectedCode actualCode jsonCode |
	expectedCode := '      PROGRAM MYPROG
      IF (A) THEN
      ELSE
      I = 1
      END IF
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"<stdin>"},"program_units":[{"anno":[],"blocks":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(4:7)-(4:11)","statement":{"anno":[],"expression":{"anno":[],"span":"(4:11)-(4:11)","tag":"value","value":{"contents":["1",null],"tag":"integer"}},"span":"(4:7)-(4:11)","tag":"assign_expression","target":{"anno":[],"span":"(4:7)-(4:7)","tag":"value","value":{"contents":"i","tag":"variable"}}},"tag":"statement"}],"conditions":[[{"anno":[],"span":"(2:11)-(2:11)","tag":"value","value":{"contents":"a","tag":"variable"}},[]]],"end_label":null,"label":null,"name":null,"span":"(2:7)-(5:12)","tag":"if"}],"name":"myprog","span":"(1:7)-(6:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.

	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #'tests-statement' }
FASTFortranJsonExporterVisitorTest >> testIfEmpty [

	| expectedCode actualCode jsonCode |
	expectedCode := '      PROGRAM MYPROG
      IF (A) THEN
      END IF
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"<stdin>"},"program_units":[{"anno":[],"blocks":[{"anno":[],"blocks":null,"conditions":[[{"anno":[],"span":"(2:11)-(2:11)","tag":"value","value":{"contents":"a","tag":"variable"}},[]]],"end_label":null,"label":null,"name":null,"span":"(2:7)-(3:12)","tag":"if"}],"name":"myprog","span":"(1:7)-(4:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.

	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #'tests-statement' }
FASTFortranJsonExporterVisitorTest >> testIfThenWithStatement [

	| expectedCode actualCode jsonCode |
	expectedCode := '      PROGRAM MYPROG
      IF (A) THEN
      I = 1
      END IF
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"<stdin>"},"program_units":[{"anno":[],"blocks":[{"anno":[],"blocks":null,"conditions":[[{"anno":[],"span":"(2:11)-(2:11)","tag":"value","value":{"contents":"a","tag":"variable"}},[{"anno":[],"label":null,"span":"(3:7)-(3:11)","statement":{"anno":[],"expression":{"anno":[],"span":"(3:11)-(3:11)","tag":"value","value":{"contents":["1",null],"tag":"integer"}},"span":"(3:7)-(3:11)","tag":"assign_expression","target":{"anno":[],"span":"(3:7)-(3:7)","tag":"value","value":{"contents":"i","tag":"variable"}}},"tag":"statement"}]]],"end_label":null,"label":null,"name":null,"span":"(2:7)-(4:12)","tag":"if"}],"name":"myprog","span":"(1:7)-(5:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.

	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #'tests-statement' }
FASTFortranJsonExporterVisitorTest >> testIfThenWithTwoStatements [

	| expectedCode actualCode jsonCode |
	expectedCode := '      PROGRAM MYPROG
      if (iur .eq. 0) then
      write (*,*) '' user''
      return
      end if
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"<stdin>"},"program_units":[{"anno":[],"blocks":[{"anno":[],"blocks":null,"conditions":[[{"anno":[],"left":{"anno":[],"span":"(2:11)-(2:13)","tag":"value","value":{"contents":"iur","tag":"variable"}},"op":{"tag":"eq"},"right":{"anno":[],"span":"(2:20)-(2:20)","tag":"value","value":{"contents":["0",null],"tag":"integer"}},"span":"(2:11)-(2:20)","tag":"binary"},[{"anno":[],"label":null,"span":"(3:7)-(3:25)","statement":{"anno":[],"arguments":{"anno":[],"list":[{"anno":[],"span":"(3:19)-(3:25)","tag":"value","value":{"contents":" user","tag":"string"}}],"span":"(3:19)-(3:25)"},"format":{"anno":[],"list":[{"anno":[],"expr":{"anno":[],"span":"(3:14)-(3:14)","tag":"value","value":{"tag":"star"}},"name":null,"span":"(3:14)-(3:14)"},{"anno":[],"expr":{"anno":[],"span":"(3:16)-(3:16)","tag":"value","value":{"tag":"star"}},"name":null,"span":"(3:16)-(3:16)"}],"span":"(3:13)-(3:17)"},"span":"(3:7)-(3:25)","tag":"write"},"tag":"statement"},{"anno":[],"label":null,"span":"(4:7)-(4:12)","statement":{"anno":[],"span":"(4:7)-(4:12)","tag":"return","target":null},"tag":"statement"}]]],"end_label":null,"label":null,"name":null,"span":"(2:7)-(5:12)","tag":"if"}],"name":"myprog","span":"(1:7)-(6:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.

	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #'tests-statement' }
FASTFortranJsonExporterVisitorTest >> testImplicitNoneStatement [

	| expectedCode actualCode jsonCode |
	expectedCode := '      PROGRAM MYPROG
      implicit none
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"<stdin>"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:19)","statement":{"anno":[],"items":null,"span":"(2:7)-(2:19)","tag":"implicit"},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.

	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #'tests-programUnit' }
FASTFortranJsonExporterVisitorTest >> testMainProgram [

	| expectedCode actualCode jsonCode |
	expectedCode := '      program main
      implicit none
c23456789 123456789 123456789 123456789 123456789 123456789 12
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"<stdin>"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:19)","statement":{"anno":[],"items":null,"span":"(2:7)-(2:19)","tag":"implicit"},"tag":"statement"},{"anno":[],"comment":"23456789 123456789 123456789 123456789 123456789 123456789 12","span":"(3:1)-(3:62)","tag":"comment"}],"name":"main","span":"(1:7)-(4:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.

	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #'tests-programUnit' }
FASTFortranJsonExporterVisitorTest >> testMainProgramAndSubroutine [

	| expectedCode actualCode jsonCode |
	expectedCode := '      PROGRAM TESTALT
      END
      SUBROUTINE RANK()
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"<stdin>"},"program_units":[{"anno":[],"blocks":[],"name":"testalt","span":"(1:7)-(2:9)","subprograms":null,"tag":"main"},{"anno":[],"arguments":null,"blocks":[],"name":"rank","options":[null,null],"span":"(3:7)-(4:9)","subprograms":null,"tag":"subroutine"}]}'.

	actualCode := self visitJsonCode: jsonCode.

	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #'tests-programUnit' }
FASTFortranJsonExporterVisitorTest >> testMainProgramEmpty [

	| expectedCode actualCode jsonCode |
	expectedCode := '      program main
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"<stdin>"},"program_units":[{"anno":[],"blocks":[],"name":"main","span":"(1:7)-(2:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.


	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #'tests-statement' }
FASTFortranJsonExporterVisitorTest >> testReturnStatementEmpty [

	| expectedCode actualCode jsonCode |
	expectedCode := '      PROGRAM MYPROG
      return
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"<stdin>"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:12)","statement":{"anno":[],"span":"(2:7)-(2:12)","tag":"return","target":null},"tag":"statement"}],"name":"myprog","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.

	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #'tests-statement' }
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

{ #category : #'tests-statement' }
FASTFortranJsonExporterVisitorTest >> testStatementCallWrite [

	| expectedCode actualCode jsonCode |
	expectedCode := '      PROGRAM TESTALT
      WRITE (*,*) ''ok - normal return [n=0]''
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"<stdin>"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:44)","statement":{"anno":[],"arguments":{"anno":[],"list":[{"anno":[],"span":"(2:19)-(2:44)","tag":"value","value":{"contents":"ok - normal return [n=0]","tag":"string"}}],"span":"(2:19)-(2:44)"},"format":{"anno":[],"list":[{"anno":[],"expr":{"anno":[],"span":"(2:14)-(2:14)","tag":"value","value":{"tag":"star"}},"name":null,"span":"(2:14)-(2:14)"},{"anno":[],"expr":{"anno":[],"span":"(2:16)-(2:16)","tag":"value","value":{"tag":"star"}},"name":null,"span":"(2:16)-(2:16)"}],"span":"(2:13)-(2:17)"},"span":"(2:7)-(2:44)","tag":"write"},"tag":"statement"}],"name":"testalt","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.

	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #'tests-statement' }
FASTFortranJsonExporterVisitorTest >> testStatementCallWriteWithMultipleArguments [

	| expectedCode actualCode jsonCode |
	expectedCode := '      PROGRAM TESTALT
      write (*,*) '' user'',name,'' does not exist''
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"<stdin>"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:48)","statement":{"anno":[],"arguments":{"anno":[],"list":[{"anno":[],"span":"(2:19)-(2:25)","tag":"value","value":{"contents":" user","tag":"string"}},{"anno":[],"span":"(2:27)-(2:30)","tag":"value","value":{"contents":"name","tag":"variable"}},{"anno":[],"span":"(2:32)-(2:48)","tag":"value","value":{"contents":" does not exist","tag":"string"}}],"span":"(2:19)-(2:48)"},"format":{"anno":[],"list":[{"anno":[],"expr":{"anno":[],"span":"(2:14)-(2:14)","tag":"value","value":{"tag":"star"}},"name":null,"span":"(2:14)-(2:14)"},{"anno":[],"expr":{"anno":[],"span":"(2:16)-(2:16)","tag":"value","value":{"tag":"star"}},"name":null,"span":"(2:16)-(2:16)"}],"span":"(2:13)-(2:17)"},"span":"(2:7)-(2:48)","tag":"write"},"tag":"statement"}],"name":"testalt","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.

	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #'tests-statement' }
FASTFortranJsonExporterVisitorTest >> testStatementExit [

	| expectedCode actualCode jsonCode |
	expectedCode := '      PROGRAM TESTALT
      exit
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"<stdin>"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:10)","statement":{"anno":[],"span":"(2:7)-(2:10)","tag":"exit","var":null},"tag":"statement"}],"name":"testalt","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.


	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #'tests-statement' }
FASTFortranJsonExporterVisitorTest >> testStatementGoto [

	| expectedCode actualCode jsonCode |
	expectedCode := '      PROGRAM TESTALT
      GOTO 100
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"<stdin>"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:14)","statement":{"anno":[],"span":"(2:7)-(2:14)","tag":"goto","target":{"anno":[],"span":"(2:12)-(2:14)","tag":"value","value":{"contents":["100",null],"tag":"integer"}}},"tag":"statement"}],"name":"testalt","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.


	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #'tests-statement' }
FASTFortranJsonExporterVisitorTest >> testStatementStop [

	| expectedCode actualCode jsonCode |
	expectedCode := '      PROGRAM TESTALT
      STOP
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"<stdin>"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:10)","statement":{"anno":[],"message":null,"span":"(2:7)-(2:10)","tag":"stop"},"tag":"statement"}],"name":"testalt","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.


	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #'tests-statement' }
FASTFortranJsonExporterVisitorTest >> testStatementStopWithMessage [

	| expectedCode actualCode jsonCode |
	expectedCode := '      PROGRAM TESTALT
      STOP 10
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"<stdin>"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:13)","statement":{"anno":[],"message":{"anno":[],"span":"(2:12)-(2:13)","tag":"value","value":{"contents":["10",null],"tag":"integer"}},"span":"(2:7)-(2:13)","tag":"stop"},"tag":"statement"}],"name":"testalt","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.


	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #'tests-statement' }
FASTFortranJsonExporterVisitorTest >> testStatementWithLabel [

	| expectedCode actualCode jsonCode |
	self skip.
	self flag: #FIXME. "The line '10     STOP' need to be processed in order to take an account the length of the label"
	expectedCode := '      PROGRAM TESTALT
10      STOP
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"<stdin>"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":{"anno":[],"span":"(2:1)-(2:2)","tag":"value","value":{"contents":["10",null],"tag":"integer"}},"span":"(2:1)-(2:12)","statement":{"anno":[],"message":null,"span":"(2:9)-(2:12)","tag":"stop"},"tag":"statement"}],"name":"testalt","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.


	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #'tests-programUnit' }
FASTFortranJsonExporterVisitorTest >> testSubroutineEmpty [

	| expectedCode actualCode jsonCode |
	expectedCode := '      SUBROUTINE RANK()
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"<stdin>"},"program_units":[{"anno":[],"arguments":null,"blocks":[],"name":"rank","options":[null,null],"span":"(1:7)-(2:9)","subprograms":null,"tag":"subroutine"}]}'.

	actualCode := self visitJsonCode: jsonCode.


	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #'tests-programUnit' }
FASTFortranJsonExporterVisitorTest >> testSubroutineWithParameters [

	| expectedCode actualCode jsonCode |
	expectedCode := '      SUBROUTINE RANK(A,B)
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"<stdin>"},"program_units":[{"anno":[],"arguments":{"anno":[],"list":[{"anno":[],"span":"(1:23)-(1:23)","tag":"value","value":{"contents":"a","tag":"variable"}},{"anno":[],"span":"(1:25)-(1:25)","tag":"value","value":{"contents":"b","tag":"variable"}}],"span":"(1:23)-(1:25)"},"blocks":[],"name":"rank","options":[null,null],"span":"(1:7)-(2:9)","subprograms":null,"tag":"subroutine"}]}'.

	actualCode := self visitJsonCode: jsonCode.


	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #running }
FASTFortranJsonExporterVisitorTest >> testTokenPosition [

	| expectedCode actualCode jsonCode |
	self skip.
	self flag: #FIXME. "The line '100      CONTINUE' need to be processed in order to take an account the length of the label"
	expectedCode := '      PROGRAM MYPROG
      STOP
100      CONTINUE
      EXIT
      END
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"<stdin>"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:10)","statement":{"anno":[],"message":null,"span":"(2:7)-(2:10)","tag":"stop"},"tag":"statement"},{"anno":[],"label":{"anno":[],"span":"(3:1)-(3:3)","tag":"value","value":{"contents":["100",null],"tag":"integer"}},"span":"(3:1)-(3:17)","statement":{"anno":[],"span":"(3:10)-(3:17)","tag":"continue"},"tag":"statement"},{"anno":[],"label":null,"span":"(4:7)-(4:10)","statement":{"anno":[],"span":"(4:7)-(4:10)","tag":"exit","var":null},"tag":"statement"}],"name":"myprog","span":"(1:7)-(5:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.


	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #running }
FASTFortranJsonExporterVisitorTest >> testVariableDeclarationCharacter [

	| expectedCode actualCode jsonCode |
	self skip.
	self flag: #TODO.
	expectedCode := '      program main
      character*40 aString
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"<stdin>"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:26)","statement":{"anno":[],"attributes":null,"declarators":{"anno":[],"list":[{"anno":[],"initial":null,"length":null,"span":"(2:20)-(2:26)","type":"scalar","variable":{"anno":[],"span":"(2:20)-(2:26)","tag":"value","value":{"contents":"astring","tag":"variable"}}}],"span":"(2:20)-(2:26)"},"span":"(2:7)-(2:26)","tag":"declaration","type":{"anno":[],"base_type":"character","selector":{"anno":[],"kind":null,"length":{"anno":[],"span":"(2:17)-(2:18)","tag":"value","value":{"contents":["40",null],"tag":"integer"}},"span":"(2:16)-(2:18)"},"span":"(2:7)-(2:18)"}},"tag":"statement"}],"name":"main","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.


	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #running }
FASTFortranJsonExporterVisitorTest >> testVariableDeclarationInteger [

	| expectedCode actualCode jsonCode |
	expectedCode := '      program main
      integer i
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"<stdin>"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:15)","statement":{"anno":[],"attributes":null,"declarators":{"anno":[],"list":[{"anno":[],"initial":null,"length":null,"span":"(2:15)-(2:15)","type":"scalar","variable":{"anno":[],"span":"(2:15)-(2:15)","tag":"value","value":{"contents":"i","tag":"variable"}}}],"span":"(2:15)-(2:15)"},"span":"(2:7)-(2:15)","tag":"declaration","type":{"anno":[],"base_type":"integer","selector":null,"span":"(2:7)-(2:13)"}},"tag":"statement"}],"name":"main","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.


	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #running }
FASTFortranJsonExporterVisitorTest >> testVariableDeclarationLogical [

	| expectedCode actualCode jsonCode |
	expectedCode := '      program main
      logical b
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"<stdin>"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:15)","statement":{"anno":[],"attributes":null,"declarators":{"anno":[],"list":[{"anno":[],"initial":null,"length":null,"span":"(2:15)-(2:15)","type":"scalar","variable":{"anno":[],"span":"(2:15)-(2:15)","tag":"value","value":{"contents":"b","tag":"variable"}}}],"span":"(2:15)-(2:15)"},"span":"(2:7)-(2:15)","tag":"declaration","type":{"anno":[],"base_type":"logical","selector":null,"span":"(2:7)-(2:13)"}},"tag":"statement"}],"name":"main","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.


	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #running }
FASTFortranJsonExporterVisitorTest >> testVariableDeclarationReal [

	| expectedCode actualCode jsonCode |
	expectedCode := '      program main
      real c
      end
'.
	jsonCode := '{"meta":{"miVersion":"fortran77","miFilename":"<stdin>"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:12)","statement":{"anno":[],"attributes":null,"declarators":{"anno":[],"list":[{"anno":[],"initial":null,"length":null,"span":"(2:12)-(2:12)","type":"scalar","variable":{"anno":[],"span":"(2:12)-(2:12)","tag":"value","value":{"contents":"c","tag":"variable"}}}],"span":"(2:12)-(2:12)"},"span":"(2:7)-(2:12)","tag":"declaration","type":{"anno":[],"base_type":"real","selector":null,"span":"(2:7)-(2:10)"}},"tag":"statement"}],"name":"main","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'.

	actualCode := self visitJsonCode: jsonCode.


	self assert: actualCode equals: expectedCode asLowercase
]

{ #category : #running }
FASTFortranJsonExporterVisitorTest >> visitJsonCode: jsonCode [

	^ visitor visitProgramFile: (NeoJSONReader fromString: jsonCode)
]
