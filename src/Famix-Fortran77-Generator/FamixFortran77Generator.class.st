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
		'argument',
		'body',
		'invocation',
		'parameter',
		'programUnit',
		'puBlockdata',
		'puComment',
		'puFunction',
		'puMain',
		'puProcedure',
		'puSubroutine',
		'variable',
		'indexedFileAnchor',
		'programFile',
		'type',
		'eComment',
		'eEntity',
		'typeIntrinsic'
	],
	#category : #'Famix-Fortran77-Generator'
}

{ #category : #accessing }
FamixFortran77Generator class >> packageName [

	^ #'Famix-Fortran77-Entities'
]

{ #category : #accessing }
FamixFortran77Generator class >> prefix [

	^ #'FamixFortran77'
]

{ #category : #accessing }
FamixFortran77Generator class >> submetamodels [

	^ { FamixGenerator }
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

	comment comment: self fCommentEntityComment.

	indexedFileAnchor := builder
		                     newClassNamed: #IndexedFileAnchor
		                     comment: self indexedFileAnchorComment.

	invocation := builder
		              newClassNamed: #Invocation
		              comment: self invocationEntityComment.

	"include := builder newClassNamed: #Include comment: ''."

	parameter := builder
		             newClassNamed: #Parameter
		             comment: self parameterEntityComment.



	programFile := builder
		               newClassNamed: #ProgramFile
		               comment: self fileEntityComment.

	programUnit := builder
		               newClassNamed: #ProgramUnit
		               comment: self programUnitEntityComment.

	puBlockdata := builder
		               newClassNamed: #PUBlockdata
		               comment: self puBlockdataEntityComment.

	puComment := builder
		             newClassNamed: #PUComment
		             comment: self puCommentEntityComment.

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


	type := builder newClassNamed: #Type comment: self typeComment.

	typeIntrinsic := builder
		                 newClassNamed: #TypeIntrinsic
		                 comment: self typeIntrinsicComment.


	variable := builder
		            newClassNamed: #Variable
		            comment: self variableEntityComment
]

{ #category : #definition }
FamixFortran77Generator >> defineHierarchy [

	super defineHierarchy.

	access --|> #TAccess.
	access --|> #TEntityMetaLevelDependency.

	programFile --|> namedEntity.
	programFile --|> #TCompilationUnit.
	programFile --|> #TEntityMetaLevelDependency.
	programFile --|> #TSourceEntity.

	indexedFileAnchor --|> sourceAnchor.
	indexedFileAnchor --|> #TFileNavigation.

	invocation --|> #TInvocation.
	invocation --|> #TEntityMetaLevelDependency.

	parameter --|> #TParameter.

	programUnit --|> #TSourceEntity.
	programUnit --|> #TEntityMetaLevelDependency.
	programUnit --|> #TWithComments.
	programUnit --|> namedEntity.

	puBlockdata --|> programUnit.
	puBlockdata --|> #TWithAccesses.
	puBlockdata --|> #TWithLocalVariables.
	puBlockdata --|> #TWithStatements.
	"puBlockdata --|> #TWithTypes."

	puComment --|> programUnit.
	puComment --|> #TComment.

	puFunction --|> puProcedure.
	puFunction --|> #TTypedEntity.

	puMain --|> programUnit.
	puMain --|> #TWithAccesses.
	puMain --|> #TWithInvocations.
	puMain --|> #TWithLocalVariables.
	puMain --|> #TWithStatements.
	puMain --|> #TWithTypes.

	puProcedure --|> programUnit.
	puProcedure --|> #THasSignature.
	puProcedure --|> #TInvocable.
	puProcedure --|> #TWithAccesses.
	puProcedure --|> #TWithInvocations.
	puProcedure --|> #TWithLocalVariables.
	puProcedure --|> #TWithParameters.
	puProcedure --|> #TWithStatements.
	puProcedure --|> #TWithTypes.

	puSubroutine --|> puProcedure.

	variable --|> #TLocalVariable.

	type --|> #TType.
	typeIntrinsic --|> type
]

{ #category : #definition }
FamixFortran77Generator >> defineProperties [

	super defineProperties.

	(comment property: #isEsope type: #Boolean defaultValue: false) 
		comment: 'It is esope comment ?'.

	(type property: #length type: #Number) comment: 'length attribute'.
	(type property: #kind type: #Number) comment: 'kind attribute'.

	"(parameter property: #variable type: #Object) comment:
		'variable declaration related to this parameter'."

	(programFile property: #version type: #String) comment:
		'Fortran version of the file'.

	(programFile property: #filename type: #String) comment:
		'Fortran name of the file'.

	(programFile
		 property: #symbolTable
		 type: #Object
		 defaultValue: 'Dictionary new') comment:
		'Table of symbols for programFile'.

	(puBlockdata
		 property: #symbolTable
		 type: #Object
		 defaultValue: 'Dictionary new') comment:
		'Table of symbols for blockdata'.
	self implicitPropertyFor: puBlockdata.

	(puFunction property: #isEsope type: #Boolean defaultValue: false) 
		comment: 'It is kind of esope function ?'.

	(puMain
		 property: #symbolTable
		 type: #Object
		 defaultValue: 'Dictionary new') comment:
		'Table of symbols for program'.
	self implicitPropertyFor: puMain.

	(puProcedure
		 property: #symbolTable
		 type: #Object
		 defaultValue: 'Dictionary new') comment:
		'Table of symbols for procedure(function, subroutine)'.
	self implicitPropertyFor: puProcedure.

	(variable property: #isEsope type: #Boolean defaultValue: false) 
		comment: 'It is esope attribute variable from segment definition ?'.

	(variable property: #segment type: #String) comment:
		'variable belong to this segment'
]

{ #category : #definition }
FamixFortran77Generator >> defineRelations [

	super defineRelations.

	programFile <>-* programUnit.
]

{ #category : #'class comment' }
FamixFortran77Generator >> fCommentEntityComment [

	^ 'a fortran comment'
]

{ #category : #'class comment' }
FamixFortran77Generator >> fileEntityComment [

	^ 'a fortran file'
]

{ #category : #'private - utility' }
FamixFortran77Generator >> implicitPropertyFor: anInstanceVar [
	(anInstanceVar
		 property: #dicImplicit
		 type: #Object
		 defaultValue: 'Dictionary new') comment:
		'dictionary to carry implicits declaration rule for each type'.
]

{ #category : #'class comment' }
FamixFortran77Generator >> indexedFileAnchorComment [
	^ 'Its the sourceAnchor (position of the token) in the source file (startLine@startColumn)-(endLine@endColumn).'
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
FamixFortran77Generator >> puCommentEntityComment [

	^ 'a comment belongs to fortran file'
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
FamixFortran77Generator >> typeComment [

	^ 'Im a Abstract Type, can be subclassed by TypeInstrinsic and Segment'
]

{ #category : #definition }
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
