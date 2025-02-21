Class {
	#name : 'FamixFortran77Test',
	#superclass : 'TestCase',
	#category : 'Famix-Fortran77-Tests',
	#package : 'Famix-Fortran77-Tests'
}

{ #category : 'private - utility' }
FamixFortran77Test >> comment: text [
	^FamixF77Comment new
		sourceAnchor: (FamixF77SourceTextAnchor new source: text);
		yourself
]

{ #category : 'private - utility' }
FamixFortran77Test >> invocationFrom: invocable to: anEntity [

	^ FamixF77Invocation new
		  sender: invocable;
		  addCandidate: anEntity;
		  yourself
]

{ #category : 'private - utility' }
FamixFortran77Test >> newEntity: aClass named: entityName [

	^ aClass new
		  name: entityName;
		  yourself
]

{ #category : 'private - utility' }
FamixFortran77Test >> programFile: fileName [

	^ FamixF77ProgramFile new
		  filename: fileName;
		  version: 'Fortran77';
		  yourself
]

{ #category : 'running' }
FamixFortran77Test >> testEntityAccessingLocalVariableOfItsContainer: anEntity [

	| fct var |
	fct := self newEntity: FamixF77PUFunction named: 'fct'.
	var := self newEntity: FamixF77Variable named: 'var'.
	var parentBehaviouralEntity: fct.

	self assert: fct localVariables size equals: 1.
	self assert: fct localVariables first name equals: 'var'
]

{ #category : 'running' }
FamixFortran77Test >> testEntityWithComment [

	self testEntityWithComment:
		(self newEntity: FamixF77PUFunction named: 'fct').
	self testEntityWithComment:
		(self newEntity: FamixF77PUSubroutine named: 'sub').
	self testEntityWithComment:
		(self newEntity: FamixF77PUMain named: 'main').
	self testEntityWithComment:
		(self newEntity: FamixF77PUBlockdata named: 'bdata')
]

{ #category : 'running' }
FamixFortran77Test >> testEntityWithComment: anEntity [

	| comment |
	comment := self comment: 'a comment'.

	self assert: anEntity comments isEmptyOrNil.
	self assert: comment commentedEntity isNil.

	anEntity addComment: comment.

	self assert: anEntity comments size equals: 1.
	self assert: comment commentedEntity equals: anEntity
]

{ #category : 'running' }
FamixFortran77Test >> testEntityWithParameter: anEntity [

	| parameter1 parameter2 |
	parameter1 := self newEntity: FamixF77Parameter named: 'parameter1'.
	parameter2 := self newEntity: FamixF77Parameter named: 'parameter2'.


	self assert: parameter1 parentBehaviouralEntity isNil.
	self assert: anEntity parameters isEmpty.

	parameter1 parentBehaviouralEntity: anEntity.

	self assert: parameter1 parentBehaviouralEntity equals: anEntity.
	self assert: anEntity parameters size equals: 1.
	self
		assertCollection: anEntity parameters
		hasSameElements: { parameter1 }.

	self assert: parameter2 parentBehaviouralEntity isNil.

	parameter2 parentBehaviouralEntity: anEntity.

	self assert: parameter2 parentBehaviouralEntity equals: anEntity.
	self assert: anEntity parameters size equals: 2.
	self assertCollection: anEntity parameters hasSameElements: {
			parameter1.
			parameter2 }
]

{ #category : 'running' }
FamixFortran77Test >> testEntityWithVariable: anEntity [

	| variable1 variable2 |
	variable1 := self newEntity: FamixF77Variable named: 'variable1'.
	variable2 := self newEntity: FamixF77Variable named: 'variable2'.

	self assert: variable1 parentBehaviouralEntity isNil.
	self assert: anEntity localVariables isEmpty.

	variable1 parentBehaviouralEntity: anEntity.

	self assert: variable1 parentBehaviouralEntity equals: anEntity.
	self assert: anEntity localVariables size equals: 1.
	self
		assertCollection: anEntity localVariables
		hasSameElements: { variable1 }.

	self assert: variable2 parentBehaviouralEntity isNil.

	variable2 parentBehaviouralEntity: anEntity.

	self assert: variable2 parentBehaviouralEntity equals: anEntity.
	self assert: anEntity localVariables size equals: 2.
	self assertCollection: anEntity localVariables hasSameElements: {
			variable1.
			variable2 }
]

{ #category : 'running' }
FamixFortran77Test >> testExternalProcedureInvokingEntity: anEntity [

	| extProc invocation |
	extProc := self newEntity: FamixF77PUFunction named: 'fct'.

	self assert: anEntity incomingInvocations size equals: 0.
	self assert: extProc outgoingInvocations size equals: 0.

	invocation := self invocationFrom: extProc to: anEntity.

	self assert: anEntity incomingInvocations size equals: 1.
	self assert: anEntity incomingInvocations first equals: invocation.
	self assert: extProc outgoingInvocations size equals: 1.
	self assert: extProc outgoingInvocations first equals: invocation
]

{ #category : 'running' }
FamixFortran77Test >> testExternalProcedureInvokingFunction [

	self testExternalProcedureInvokingEntity:
		(self newEntity: FamixF77PUFunction named: 'fct')
]

{ #category : 'running' }
FamixFortran77Test >> testFunctionWithAccessingItsLocalVariable [

	self testEntityAccessingLocalVariableOfItsContainer:
		(self newEntity: FamixF77PUFunction named: 'fct')
]

{ #category : 'running' }
FamixFortran77Test >> testFunctionWithParameters [

	self testEntityWithParameter:
		(self newEntity: FamixF77PUFunction named: 'fct')
]

{ #category : 'running' }
FamixFortran77Test >> testFunctionWithVariables [

	self testEntityWithVariable:
		(self newEntity: FamixF77PUFunction named: 'fct')
]

{ #category : 'running' }
FamixFortran77Test >> testProgramFile [

	| pf |
	pf := self programFile: 'file.f'.
	self assert: pf filename equals: 'file.f'.
	self assert: pf version equals: 'Fortran77'
]

{ #category : 'running' }
FamixFortran77Test >> testProgramFileWithProgramAndSubProgram [

	| pf program function subroutine |
	pf := self programFile: 'test.f'.
	program := self newEntity: FamixF77PUMain named: 'main'.
	function := self newEntity: FamixF77PUFunction named: 'fct'.
	subroutine := self newEntity: FamixF77PUSubroutine named: 'sub'.

	self assertEmpty: pf programUnits.

	pf
		addProgramUnit: program;
		addProgramUnit: function;
		addProgramUnit: subroutine.

	self assert: pf programUnits size equals: 3.

	self assertCollection: pf programUnits hasSameElements: {
			program.
			function.
			subroutine }.

	self flag: #FIXME "Tester les contenances. qui contient quoi ?"
]

{ #category : 'running' }
FamixFortran77Test >> testSubroutineWithParameters [

	self testEntityWithParameter:
		(self newEntity: FamixF77PUSubroutine named: 'sub')
]

{ #category : 'running' }
FamixFortran77Test >> testSubroutineWithVariables [

	self testEntityWithVariable:
		(self newEntity: FamixF77PUSubroutine named: 'sub')
]
