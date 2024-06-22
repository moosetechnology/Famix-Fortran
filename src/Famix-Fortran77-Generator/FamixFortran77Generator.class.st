"
# F77 Metamodel generator

```txt
    Instance Variables
	access:		<Object>
	argument:		<Object>
	body:		<Object>
	fType:		<Object>
	include:		<Object>
	indexedFileAnchor:		<Object>
	invocation:		<Object>
	parameter:		<Object>
	programFile:		<Object>
	programUnit:		<Object>
	puBlockdata:		<Object>
	puComment:		<Object>
	puFunction:		<Object>
	puMain:		<Object>
	puProcedure:		<Object>
	puSubroutine:		<Object>
	tStaticInvocable:		<Object>
	tStaticInvocation:		<Object>
	tWithBody:		<Object>
	tWithStaticInvocations:		<Object>
	variable:		<Object>
```

### NEED TO BE FIXED

will move the `namedEntity` from `programUnit` to its children which are `namedEntity` (this is not the case for `puComment`). However, this does not add the `FamixTNamedEntity` trait to the children.

"
Class {
	#name : #FamixFortran77Generator,
	#superclass : #FamixBasicInfrastructureGenerator,
	#instVars : [
		'access',
		'invocation',
		'parameter',
		'programUnit',
		'puBlockdata',
		'puFunction',
		'puMain',
		'puProcedure',
		'puSubroutine',
		'variable',
		'indexedFileAnchor',
		'programFile',
		'type',
		'typeIntrinsic',
		'include',
		'includedFile',
		'typeUnknown',
		'externalDeclaration',
		'implicit',
		'statementFunction',
		'tWithStatements',
		'unknownVariable',
		'intrinsicRoutine'
	],
	#category : #'Famix-Fortran77-Generator'
}

{ #category : #accessing }
FamixFortran77Generator class >> packageName [

	^ #'Famix-Fortran77-Entities'
]

{ #category : #accessing }
FamixFortran77Generator class >> prefix [

	^ #'FamixF77'
]

{ #category : #'class comment' }
FamixFortran77Generator >> accessEntityComment [

	^ 'an access of a variable'
]

{ #category : #'class comment' }
FamixFortran77Generator >> argumentEntityComment [

	^ 'an actual parameter'
]

{ #category : #'class comment' }
FamixFortran77Generator >> bodyEntityComment [

	^ 'an executable code of a program unit'
]

{ #category : #definition }
FamixFortran77Generator >> defineClasses [

	super defineClasses.

	access := builder
		          newClassNamed: #Access
		          comment: self accessEntityComment.

	"character := builder newClassNamed: #Character comment: 'Im a character'.

	complex := builder newClassNamed: #Complex comment: 'Im a complex'."

	comment comment: self fCommentEntityComment.

	externalDeclaration := builder
		                       newClassNamed: #ExternalDeclaration
		                       comment: self externalDeclarationComment.
	
	implicit := builder newClassNamed: #Implicit comment: self implicitComment.

	indexedFileAnchor := builder
		                     newClassNamed: #IndexedFileAnchor
		                     comment: self indexedFileAnchorComment.

	intrinsicRoutine := builder
		newClassNamed: #IntrinsicRoutine
		comment: self intrinsicRoutineComment.

	invocation := builder
		              newClassNamed: #Invocation
		              comment: self invocationEntityComment.

	include := builder
		           newClassNamed: #Include
		           comment: self includeComment.
	includedFile := builder
		                newClassNamed: #IncludedFile
		                comment: 'includedFile'.

	parameter := builder
		             newClassNamed: #Parameter
		             comment: self parameterEntityComment.

	programFile := builder
		               newClassNamed: #ProgramFile
		               comment: self fileEntityComment.

	programUnit := builder
		               newAbstractClassNamed: #ProgramUnit
		               comment: self programUnitEntityComment.

	puBlockdata := builder
		               newClassNamed: #PUBlockdata
		               comment: self puBlockdataEntityComment.

	puFunction := builder
		              newClassNamed: #PUFunction
		              comment: self puFunctionEntityComment.

	puMain := builder
		          newClassNamed: #PUMain
		          comment: self puMainEntityComment.

	puProcedure := builder
		newClassNamed: #PUProcedure
		comment: self puProcedureEntityComment.

	puSubroutine := builder
		newClassNamed: #PUSubroutine
		comment: self puSubroutineEntityComment.

	statementFunction := builder
		newClassNamed: #StatementFunction
		comment: self statementFunctionEntityComment.

	type := builder newClassNamed: #Type comment: self typeComment.

	typeIntrinsic := builder
		                 newClassNamed: #TypeIntrinsic
		                 comment: self typeIntrinsicComment.

	typeUnknown := builder
		               newClassNamed: #TypeUnknown
		               comment: self typeIntrinsicComment.

	variable := builder
		            newClassNamed: #Variable
		            comment: self variableEntityComment.

	unknownVariable := builder
		            newClassNamed: #UnknownVariable
		            comment: 'Variable used but not resolved'.

]

{ #category : #definition }
FamixFortran77Generator >> defineHierarchy [

	super defineHierarchy.

	access --|> #TAccess.
	access --|> #TEntityMetaLevelDependency.

	externalDeclaration --|> namedEntity.
	externalDeclaration --|> #TSourceEntity.

	include --|> #TAssociation.

	indexedFileAnchor --|> sourceAnchor.
	indexedFileAnchor --|> #TFileNavigation.

	invocation --|> #TInvocation.
	invocation --|> #TEntityMetaLevelDependency.

	intrinsicRoutine --|> puProcedure.

	includedFile --|> programUnit.
	includedFile --|> #TWithTypes.
	includedFile --|> tWithStatements.

	parameter --|> #TParameter.

	programFile --|> namedEntity.
	programFile inheritsFromTrait: #TSourceEntity without: { #sourceText }.
	programFile --|> #TWithComments.
	programFile --|> #TCompilationUnit.
	programFile --|> #TEntityMetaLevelDependency.
	programFile --|> #TSourceEntity.
	programFile --|> #TWithComments.

	programUnit --|> namedEntity.
	programUnit --|> #TSourceEntity.
	programUnit --|> #TWithComments.
	programUnit --|> #TEntityMetaLevelDependency.
	programUnit --|> #TWithLocalVariables.

	puBlockdata --|> programUnit.
	"puBlockdata --|> #TWithTypes."

	puFunction --|> puProcedure.
	puFunction --|> #TTypedEntity.

	puMain --|> programUnit.
	puMain --|> tWithStatements.
	puMain --|> #TWithTypes.

	puProcedure --|> programUnit.
	puProcedure --|> tWithStatements.
	puProcedure --|> #THasSignature.
	puProcedure --|> #TWithParameters.
	puProcedure --|> #TWithTypes.
	puProcedure --|> #TInvocable.

	puSubroutine --|> puProcedure.

	statementFunction --|> namedEntity.
	statementFunction --|> #TSourceEntity.
	statementFunction --|> tWithStatements.
	statementFunction --|> #TTypedEntity.
	statementFunction --|> #THasSignature.
	statementFunction --|> #TWithParameters.
	statementFunction --|> #TWithTypes.
	statementFunction --|> #TWithLocalVariables.
	statementFunction --|> #TInvocable.
	statementFunction --|> #TEntityMetaLevelDependency.

	tWithStatements --|> #TWithStatements.

	type --|> #TType.

	typeIntrinsic --|> type.

	typeUnknown --|> type.

	variable --|> #TLocalVariable.

	unknownVariable  --|> #TUnknownVariable
]

{ #category : #definition }
FamixFortran77Generator >> defineProperties [

	super defineProperties.

	(comment property: #isEsope type: #Boolean defaultValue: false) 
		comment: 'Is it an esope comment ?'.
		
	(implicit property: #letters type: #Object) comment: 'Initials for the IMPLICIT statement'.
	(implicit property: #type type: #FamixTType) comment: 'Type for the initials of the IMPLICIT statement'.

	(include property: #isLocal type: #Boolean) comment:
		'Whether this is a local include (with "included.h") or a system one (with <included.h>)'.

	(include property: #filename type: #String) comment:
		'Hold the name of the file included. Will be used to link this relation with the includedFile entity'.

	(type property: #length type: #Number) comment: 'length attribute of a type'.
	(type property: #kind type: #Number) comment: 'kind attribute of a type'.

	(programFile property: #version type: #String) comment:
		'Fortran version of the file'.

	(programFile property: #filename type: #String) comment:
		'Fortran name of the file'.

	(puFunction property: #isEsope type: #Boolean defaultValue: false) 
		comment: 'Is it an Esope function (segini,...) ?'.

	(variable property: #isEsope type: #Boolean defaultValue: false) 
		comment: 'Is it an Esope pointer ?'.

]

{ #category : #definition }
FamixFortran77Generator >> defineRelations [

	super defineRelations.

	programFile <>-* programUnit.
	programUnit <>-* externalDeclaration.

	((include property: #included)
		 comment: 'File included';
		 target) *- ((includedFile property: #inclusions) comment:
		 'All inclusions of this file').

	((include property: #includedBy)
		 comment: 'File including the receiver';
		 source) *- ((programUnit property: #includes) comment:
		 'All inclusions made by this programUnits').

	((tWithStatements property: #statementFunctions)
		comment: 'Statement functions defined in the body')
		<>-* ((statementFunction property: #parentEntity)
			comment: 'Entity in which body I am defined')
]

{ #category : #definition }
FamixFortran77Generator >> defineTraits [

	super defineTraits.

	tWithStatements := builder newTraitNamed: #TWithStatements
]

{ #category : #'class comment' }
FamixFortran77Generator >> externalDeclarationComment [

	^ 'Im a external declaration. 
	[See more](https://docs.oracle.com/cd/E19957-01/805-4939/6j4m0vn9d/index.html)'
]

{ #category : #'class comment' }
FamixFortran77Generator >> fCommentEntityComment [

	^ 'a fortran comment'
]

{ #category : #'class comment' }
FamixFortran77Generator >> fileEntityComment [

	^ 'a fortran file'
]

{ #category : #'class comment' }
FamixFortran77Generator >> implicitComment [

	^ '[Implicit](https://docs.oracle.com/cd/E19957-01/805-4939/6j4m0vn9v/index.html) statement'
]

{ #category : #'private - utility' }
FamixFortran77Generator >> implicitPropertyFor: anInstanceVar [
	(anInstanceVar
		 property: #implicitDictionary
		 type: #Object
		 defaultValue: 'Dictionary new') comment:
		'dictionary to carry implicits declaration rule for each type'.
]

{ #category : #'class comment' }
FamixFortran77Generator >> includeComment [

	^ 'Entity to hold `#include "file.inc"` directive
	we need to have a path pointed by the file and the relation with all the subroutine including this file
	'
]

{ #category : #'class comment' }
FamixFortran77Generator >> indexedFileAnchorComment [
	^ 'Its the sourceAnchor (position of the token) in the source file (startLine@startColumn)-(endLine@endColumn).'
]

{ #category : #'class comment' }
FamixFortran77Generator >> intrinsicRoutineComment [

	^'A subroutine (or function) defined in the Fortran language itself'
]

{ #category : #'class comment' }
FamixFortran77Generator >> invocationEntityComment [
	^ 'an invocation of procedure inside a procedure or main program'
]

{ #category : #definition }
FamixFortran77Generator >> newBuilder [

	^ super newBuilder
		  withFileImport;
		  yourself
]

{ #category : #'class comment' }
FamixFortran77Generator >> parameterEntityComment [

	^ 'a formal parameter'
]

{ #category : #'class comment' }
FamixFortran77Generator >> programUnitEntityComment [

	^ 'a program unit'
]

{ #category : #'class comment' }
FamixFortran77Generator >> puBlockdataEntityComment [

	^ 'a block data for common variable'
]

{ #category : #'class comment' }
FamixFortran77Generator >> puFunctionEntityComment [

	^ 'a function procedure'
]

{ #category : #'class comment' }
FamixFortran77Generator >> puMainEntityComment [

	^ 'a main program'
]

{ #category : #'class comment' }
FamixFortran77Generator >> puProcedureEntityComment [

	^ 'a procedure'
]

{ #category : #'class comment' }
FamixFortran77Generator >> puSubroutineEntityComment [

	^ 'a subroutine procedure'
]

{ #category : #'class comment' }
FamixFortran77Generator >> statementFunctionEntityComment [

	^ 'a statement function'
]

{ #category : #'class comment' }
FamixFortran77Generator >> typeComment [

	^ 'Im a Abstract Type, can be subclassed by TypeInstrinsic and Segment'
]

{ #category : #'class comment' }
FamixFortran77Generator >> typeIntrinsicComment [

	^ 'Im an fortran77 instrinsic type.
	- Numeric
	   * Integer
	   * Real
	   * Complex
	- Character
	- Logical
	'
]

{ #category : #'class comment' }
FamixFortran77Generator >> variableEntityComment [
	^ 'a local variable of a program unit'
]
