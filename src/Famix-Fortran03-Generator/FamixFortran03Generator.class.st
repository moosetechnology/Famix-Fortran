Class {
	#name : #FamixFortran03Generator,
	#superclass : #FamixBasicInfrastructureGenerator,
	#instVars : [
		'abstractProgramUnit',
		'function',
		'module',
		'procedure',
		'program',
		'programFile',
		'programUnit',
		'puComment',
		'subroutine',
		'type',
		'use',
		'variable'
	],
	#category : #'Famix-Fortran03-Generator'
}

{ #category : #accessing }
FamixFortran03Generator class >> packageName [

	^ #'Famix-Fortran03-Entities'
]

{ #category : #accessing }
FamixFortran03Generator class >> prefix [

	^ #'FamixFortran03'
]

{ #category : #accessing }
FamixFortran03Generator class >> submetamodels [

	^ { FamixGenerator }
]

{ #category : #definition }
FamixFortran03Generator >> defineClasses [

	super defineClasses.
	abstractProgramUnit := builder
		                       newClassNamed: #AbstractProgramUnit
		                       comment:
		                       'Im a program unit with a special fake program unit PUComment'.


	function := builder
		            newClassNamed: #Function
		            comment:
		            'Im a function. You can use me in a expression and I have a declaredType: r = fct(p1,...,pN)'.

	module := builder
		          newClassNamed: #Module
		          comment:
		          'Im a module. Use me if you want to organize your projet and avoid some legacy constructs like common, equivalence and so on...'.

	procedure := builder
		             newClassNamed: #Procedure
		             comment:
		             'Im an invocable subprogram. I may be either a Function or Subroutine. Im also can be an internal or external(In this case, replace me with a Module)'.

	program := builder
		           newClassNamed: #Program
		           comment: 'Im a main program'.

	programFile := builder
		               newClassNamed: #ProgramFile
		               comment: 'Im a file containing a ProgUnit'.

	programUnit := builder
		               newClassNamed: #ProgramUnit
		               comment:
		               'Im a genuine program unit. I contains a statement'.

	puComment := builder
		             newClassNamed: #PUComment
		             comment:
		             'Im a special program unit. Im here for distinguish Comment belongs to ProgramUnit and comment not belongs to programUnit. Im a the later one'.

	subroutine := builder
		              newClassNamed: #Subroutine
		              comment:
		              'Im a subroutine. You can use me only as a statement, e.g: `call sub(p1,...,pN)`'.

	type := builder
		        newClassNamed: #Type
		        comment:
		        'Im a type. I can be either a Instrinsic or User-defined-type'.

	use := builder
		       newClassNamed: #Use
		       comment:
		       'Thanks to me, you can import a procedures, variables, constants,... defined in a module. Im an association between a program unit and a module'.

	variable := builder
		            newClassNamed: #Variable
		            comment:
		            'Im a local variable defined inside a program unit. I have a declared type. My type can be explicit or implicit (in this case, my first letter is used to infere my type)'
]

{ #category : #definition }
FamixFortran03Generator >> defineHierarchy [

	super defineHierarchy.

	abstractProgramUnit --|> #TWithComments.

	function --|> procedure.
	function --|> #TFunction.

	module --|> programUnit.

	procedure --|> programUnit.
	procedure --|> #THasSignature.
	procedure --|> #TWithParameters.

	program --|> programUnit.

	programFile --|> #TCompilationUnit.

	programUnit --|> abstractProgramUnit.
	programUnit --|> #TNamedEntity.
	programUnit --|> #TWithLocalVariables.
	programUnit --|> #TWithStatements.
	programUnit --|> #TWithTypes.

	puComment --|> abstractProgramUnit.

	subroutine --|> procedure.

	type --|> #TType.

	use --|> #TAssociation.

	variable --|> #TLocalVariable
]

{ #category : #definition }
FamixFortran03Generator >> defineProperties [

	super defineProperties
]

{ #category : #definition }
FamixFortran03Generator >> defineRelations [

	super defineRelations.

	programFile <>-* abstractProgramUnit.

	programUnit <>-* procedure.


	((use property: #used)
		 comment: 'Module used';
		 target)
	*- ((module property: #users) comment: 'All users of this module').

	((use property: #usedBy)
		 comment: 'used by this program unit';
		 source) *- ((programUnit property: #uses) comment:
		 'All uses made by this programUnits')
]
