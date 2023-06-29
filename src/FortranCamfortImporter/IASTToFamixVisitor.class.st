Class {
	#name : #IASTToFamixVisitor,
	#superclass : #IASTAbstractVisitor,
	#instVars : [
		'f77sourcefile',
		'stack'
	],
	#category : #'FortranCamfortImporter-Visitor'
}

{ #category : #'private-helper' }
IASTToFamixVisitor class >> getBasename: filename [

	^ filename asFileReference basename
]

{ #category : #'private-helper' }
IASTToFamixVisitor class >> getLines: filename [

	^ filename asFileReference contents lines
]

{ #category : #visiting }
IASTToFamixVisitor >> defaultImplicitTyping: firstLetter [

	"God is real . . . unless declared integer"

	"{ 
		($i -> #TypeInteger).
		($j -> #TypeInteger).
		($k -> #TypeInteger).
		($l -> #TypeInteger).
		($m -> #TypeInteger).
		($n -> #TypeInteger) } asDictionary at: $b ifAbsent: [ #TypeReal ]"

	^ ('ijklmn' includes: firstLetter)
		  ifTrue: [ #TypeInteger ]
		  ifFalse: [ #TypeReal ]
]

{ #category : #accessing }
IASTToFamixVisitor >> f77sourcefile [

	^ f77sourcefile
]

{ #category : #accessing }
IASTToFamixVisitor >> f77sourcefile: anObject [

	f77sourcefile := anObject
]

{ #category : #initialization }
IASTToFamixVisitor >> initialize [

	super initialize.
	model := FamixFortran77Model new name: 'mooseModelF77'.
	stack := Stack new.
	f77sourcefile := ''
]

{ #category : #'private-creation' }
IASTToFamixVisitor >> newIndexedFileAnchor: filename [
	| file |
	file := filename asFileReference.
	^ (self newEntity: FamixFortran77IndexedFileAnchor)
		  startLine: 1;
		  endLine: (file
				   ifExists: [ (self class getLines: filename) size ]
				   ifAbsent: [ 1 ]);
		  startColumn: 1;
		  endColumn: (file
				   ifExists: [ (self class getLines: filename) last size + 1]
				   ifAbsent: [ 1 ]);
		  fileName: file basename;
		  yourself
]

{ #category : #accessing }
IASTToFamixVisitor >> stack [

	^ stack
]

{ #category : #accessing }
IASTToFamixVisitor >> stack: anObject [

	stack := anObject
]

{ #category : #visiting }
IASTToFamixVisitor >> visit: anIASTModel [

	^ anIASTModel accept: self
]

{ #category : #visiting }
IASTToFamixVisitor >> visitIASTBlockData: aBlockData [

	| blockdata |

	blockdata := (self newEntity: FamixFortran77PUBlockdata)
						sourceAnchor: (self visitIndexedFileAnchor: aBlockData sourceAnchor);
						name: aBlockData entityName;
						yourself.
	stack push: blockdata.
	
	"prossess accesses"
	aBlockData accesses do: [ :access | 
		blockdata addAccess: (access accept: self) ].

	"prossess the comments inside this progUnit"
	aBlockData localComments do: [ :comment | 
		blockdata addComment: (comment accept: self) ].

	stack pop.
	^ blockdata
]

{ #category : #visiting }
IASTToFamixVisitor >> visitIASTComment: aComment [

	| comment |
	comment := aComment isProgUnit
		           ifTrue: [ self newEntity: FamixFortran77PUComment ]
		           ifFalse: [ 
			           (self newEntity: FamixFortran77Comment)
				           isEsope: aComment isEsope;
				           commentedEntity: stack top ].
	^ comment
		  sourceAnchor: (self visitIndexedFileAnchor: aComment sourceAnchor);
		  content: aComment text;
		  yourself
]

{ #category : #visiting }
IASTToFamixVisitor >> visitIASTEsopeSegCommand: aSegmentCommand [

	^ aSegmentCommand accept: (self spawn: IASTToEsopeVisitor)
]

{ #category : #visiting }
IASTToFamixVisitor >> visitIASTEsopeSegment: aSegment [

	| segment |
	segment := aSegment accept: (self spawn: IASTToEsopeVisitor).

	self flag: #FIXME. "link the segment to the prograUnit in which its defined"
	stack top addType: segment.

	^ segment
]

{ #category : #visiting }
IASTToFamixVisitor >> visitIASTFunction: aFunction [

	| function |
	function := self
		            visitIASTProgramUnit: aFunction
		            toFamix: FamixFortran77PUFunction.
	aFunction parameters do: [ :parameter | 
		function addParameter: (parameter accept: self) ].

	^ function
]

{ #category : #visiting }
IASTToFamixVisitor >> visitIASTImplicit: anImplicit [

	self flag: #TODO.
	"put implicit info into the FamixFortranProgramFile"
]

{ #category : #visiting }
IASTToFamixVisitor >> visitIASTInvocation: anInvocation [

	| invocation |
	invocation := (self newEntity: FamixFortran77Invocation)
		              sourceAnchor:
			              (self visitIndexedFileAnchor:
					               anInvocation sourceAnchor);
		              attributeAt: #entity put: anInvocation;
		              yourself.
	stack top addOutgoingInvocation: invocation.
	^ invocation
]

{ #category : #visiting }
IASTToFamixVisitor >> visitIASTMainProgram: aMainProgram [

	^ self
		  visitIASTProgramUnit: aMainProgram
		  toFamix: FamixFortran77PUMain
]

{ #category : #visiting }
IASTToFamixVisitor >> visitIASTParameter: aParameter [

	^ (self newEntity: FamixFortran77Parameter)
		  sourceAnchor:
			  (self visitIndexedFileAnchor: aParameter sourceAnchor);
		  name: aParameter entityName;
		  yourself
]

{ #category : #visiting }
IASTToFamixVisitor >> visitIASTProgramFile: aProgramFile [

	| progFile |
	self f77sourcefile: aProgramFile filename.
	progFile := (self newEntity: FamixFortran77ProgramFile)
		filename: aProgramFile filename;
		name: aProgramFile filename;
		yourself.

	stack push: progFile.

	aProgramFile progUnits do: [ :progUnit | 
		progFile addProgramUnit: (progUnit accept: self) ].

	stack pop.
	^progFile
]

{ #category : #visiting }
IASTToFamixVisitor >> visitIASTProgramUnit: aProgramUnit toFamix: aFamixFortranClass [

	| progUnit |
	progUnit := (self newEntity: aFamixFortranClass)
		            sourceAnchor:
			            (self visitIndexedFileAnchor: aProgramUnit sourceAnchor);
		            name: aProgramUnit entityName;
		            yourself.
	stack push: progUnit.

	aProgramUnit body ifNotNil: [ :body | 
		body do: [ :each | each accept: self ] ].

	"aProgramUnit localVariables do: [ :localVariable | 
		progUnit addLocalVariable: (localVariable accept: self) ].

	aProgramUnit accesses do: [ :access | 
		progUnit addAccess: (access accept: self) ].
	
	aProgramUnit invocations do: [ :invocation | 
		progUnit addOutgoingInvocation: (invocation accept: self) ].
	
	aProgramUnit localComments do: [ :comment | 
		progUnit addComment: (comment accept: self) ]."

	progUnit attributeAt: #implicits put: aProgramUnit implicits.

	stack pop.
	^ progUnit
]

{ #category : #visiting }
IASTToFamixVisitor >> visitIASTSubroutine: aSubroutine [

	| subroutine |
	subroutine := self
		              visitIASTProgramUnit: aSubroutine
		              toFamix: FamixFortran77PUSubroutine.
	aSubroutine parameters do: [ :parameter | 
		subroutine addParameter: (parameter accept: self) ].

	^ subroutine
]

{ #category : #visiting }
IASTToFamixVisitor >> visitIASTVarAccess: aVarAccess [

	| access |
	access := (self newEntity: FamixFortran77Access)
		          sourceAnchor:
			          (self visitIndexedFileAnchor: aVarAccess sourceAnchor);
		          attributeAt: #entity put: aVarAccess;
		          isWrite: aVarAccess isWrite;
		          yourself.

	stack top addAccess: access.

	^ access
]

{ #category : #visiting }
IASTToFamixVisitor >> visitIASTVariable: aVariable [

	| var |
	var := (self newEntity: FamixFortran77Variable)
		       sourceAnchor:
			       (self visitIndexedFileAnchor: aVariable sourceAnchor);
		       name: aVariable entityName;
		       declaredType: (self visitIASTTypeRef: aVariable typeSpec);
		       yourself.
	stack top symbolTable at: var name put: var.
	stack top addLocalVariable: var.
	^ var
]
