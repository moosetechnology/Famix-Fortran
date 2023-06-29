"
An IASTVisitorF77Test is a test class for testing the behavior of IASTVisitorF77
"
Class {
	#name : #IASTToFamixVisitorTest,
	#superclass : #TestCase,
	#instVars : [
		'visitor',
		'programFile'
	],
	#category : #'FortranCamfortImporter-Tests-Visitor'
}

{ #category : #running }
IASTToFamixVisitorTest >> anchorFrom: startPoint to: endPoint [

	^ IASTIndexedFileAnchor new
		  startLine: startPoint x;
		  startColumn: startPoint y;
		  endLine: endPoint x;
		  endColumn: endPoint y;
		  fileName: 'fortran77.f';
		  yourself
]

{ #category : #running }
IASTToFamixVisitorTest >> defaultAnchor [

	^ self anchorFrom: 1 @ 7 to: 2 @ 10
]

{ #category : #'default values' }
IASTToFamixVisitorTest >> defaultEmptySegment: segmentName [

	^ IASTEsopeSegment new
		  sourceAnchor: self defaultAnchor;
		  entityName: segmentName;
		  declarations: {  };
		  yourself
]

{ #category : #running }
IASTToFamixVisitorTest >> defaultImplicit: ranges for: typeName [

	^ IASTImplicit new
		  forType: (self defaultType: typeName);
		  ranges: ranges;
		  yourself
]

{ #category : #running }
IASTToFamixVisitorTest >> defaultImplicitNone [

	^ IASTImplicit new
]

{ #category : #running }
IASTToFamixVisitorTest >> defaultParameter [

	^ IASTParameter new
		  entityName: 'var';
		  sourceAnchor: self defaultAnchor;
		  yourself
]

{ #category : #'default values' }
IASTToFamixVisitorTest >> defaultSegment: segmentName [

	^ IASTEsopeSegment new
		  sourceAnchor: self defaultAnchor;
		  entityName: segmentName;
		  declarations: {  };
		  yourself
]

{ #category : #'default values' }
IASTToFamixVisitorTest >> defaultSegment: segmentName with: dictDeclarations [

	^ IASTEsopeSegment new
		  sourceAnchor: self defaultAnchor;
		  entityName: segmentName;
		  declarations: (dictDeclarations collect: [ :assoc | 
					   self defaultVariable: assoc key withType: assoc value ]);
		  yourself
]

{ #category : #running }
IASTToFamixVisitorTest >> defaultSegmentComand: commandName on: varName [

	^ IASTEsopeSegCommand new
		  esopeCommand: commandName;
		  entityName: varName;
		  sourceAnchor: self defaultAnchor;
		  yourself
]

{ #category : #running }
IASTToFamixVisitorTest >> defaultType: typeName [

	^ IASTTypeRef new
		  entityName: typeName;
		  sourceAnchor: self defaultAnchor;
		  yourself
]

{ #category : #'default values' }
IASTToFamixVisitorTest >> defaultVariable: assoc [

	^ IASTVariable new
		  sourceAnchor: self defaultAnchor;
		  entityName: assoc key;
		  typeSpec: (IASTTypeRef new
				   sourceAnchor: self defaultAnchor;
				   entityName: assoc value;
				   yourself);
		  yourself
]

{ #category : #running }
IASTToFamixVisitorTest >> defaultVariable: varName withType: typeName [

	^ IASTVariable new
		  sourceAnchor: self defaultAnchor;
		  entityName: varName;
		  typeSpec: (self defaultType: typeName);
		  yourself
]

{ #category : #running }
IASTToFamixVisitorTest >> setUp [
	super setUp.
	
	programFile := IASTProgramFile new filename: 'fortran77.f' ; yourself.
	visitor := IASTToFamixVisitor new.
]

{ #category : #running }
IASTToFamixVisitorTest >> testCreateFamixEsopeCommandSegini [

	"
	segini ptr
	"

	| famixSegini iastSegini progFile |
	iastSegini := self defaultSegmentComand: 'segini' on: 'ptr'.

	programFile progUnits: { IASTSubroutine new
			 entityName: 'sub';
			 body: { iastSegini };
			 yourself }.

	progFile := programFile accept: visitor.
	
	self assert: progFile programUnits size equals: 1.

	self assert: (visitor model allWithType: FamixEsopeCommand) size equals: 1.
	famixSegini := (visitor model allWithType: FamixEsopeCommand) first.
	self assert: famixSegini name equals: 'segini'.
]

{ #category : #running }
IASTToFamixVisitorTest >> testCreateFamixEsopeSegment [

	"
	segment myseg
	 character uname
	 logical status
	 integer age
	end segment
	"

	| segment entity attribute |
	segment := self defaultSegment: 'myseg' with: { 
			           (#uname -> #character).
			           (#status -> #logical).
			           (#age -> #integer) }.

	programFile progUnits: { IASTSubroutine new
			 entityName: 'sub';
			 body: { segment };
			 yourself }.

	entity := programFile accept: visitor.
	
	self assert: entity programUnits size equals: 1.

	self assert: (visitor model allWithType: FamixEsopeSegment) size equals: 1.
	entity := (visitor model allWithType: FamixEsopeSegment) first.
	self assert: entity name equals: 'myseg'.
	self assert: entity isType.
	self assert: entity attributes size equals: 3.
	
	self assert: entity attributes size equals: 3.
	attribute := entity attributes first.
	self assert: attribute class equals: FamixEsopeAttribute.
	self assert: attribute name equals: 'uname'.
	self assert: attribute declaredType name equals: 'character'.
	
	attribute := entity attributes second.
	self assert: attribute class equals: FamixEsopeAttribute.
	self assert: attribute name equals: 'status'.
	self assert: attribute declaredType name equals: 'logical'.
	
	attribute := entity attributes third.
	self assert: attribute class equals: FamixEsopeAttribute.
	self assert: attribute name equals: 'age'.
	self assert: attribute declaredType name equals: 'integer'.
]

{ #category : #running }
IASTToFamixVisitorTest >> testCreateFamixFortran77 [

	| entity |
	programFile progUnits: { IASTSubroutine new
		entityName: 'sub';
		body: #();
		yourself
	}.
	programFile accept: visitor.

	self assert: visitor model size equals: 2.

	entity := visitor model detect: [:each | each class = FamixFortran77ProgramFile ].
	self assert: entity programUnits size equals: 1.

	entity := entity programUnits first.
	self assert: entity class equals: FamixFortran77PUSubroutine.
	self assert: entity name equals: 'sub'.

]

{ #category : #running }
IASTToFamixVisitorTest >> testCreateFamixFortran77Comment [

	| entity comment |

	programFile progUnits: { IASTMainProgram new
			 entityName: 'main';
			 body: { IASTComment new
		           text: 'a normal comment';
		           yourself. };
			 yourself }.

	entity := programFile accept: visitor.

	self assert: entity programUnits size equals: 1.
	self assert: entity programUnits first comments size equals: 1.

	comment := entity programUnits first comments first.
	self assert: comment class equals: FamixFortran77Comment.
	self assert: comment content equals: 'a normal comment'.
	self deny: comment isEsope.
	
	self assert: comment commentedEntity equals: entity programUnits first.
]

{ #category : #running }
IASTToFamixVisitorTest >> testCreateFamixFortran77Invocation [
	| entity invocation caller callee |

	callee := IASTSubroutine new
		entityName: 'sub';
		yourself.

	caller := IASTMainProgram new
			entityName: 'main';
			body: { IASTInvocation new entityName: 'sub'; yourself };
			yourself.
	programFile progUnits: { callee . caller }.

	programFile accept: visitor.
	entity := visitor model detect: [:each | each class = FamixFortran77ProgramFile ].

	self assert: entity programUnits first class equals: FamixFortran77PUSubroutine.
	self assert: entity programUnits second class equals: FamixFortran77PUMain.

	self assert: entity programUnits second outgoingInvocations size equals: 1.
	invocation := entity programUnits second outgoingInvocations first.
	
	self assert: invocation class equals: FamixFortran77Invocation.
	self assert: invocation sender equals: entity programUnits second.
	self assert: (invocation attributeAt: #entity ifAbsent: [ nil ] ) isNotNil
]

{ #category : #running }
IASTToFamixVisitorTest >> testCreateFamixFortran77LocalVariable [

	| entity var |
	programFile progUnits: { IASTSubroutine new
			 entityName: 'sub';
			 body: { (self defaultVariable: 'aVar' withType: 'integer') };
			 yourself }.
	programFile accept: visitor.

	entity := visitor model detect: [:each | each class = FamixFortran77ProgramFile ].

	self assert: entity programUnits first localVariables size equals: 1.

	var := entity programUnits first localVariables first.
	self assert: var class equals: FamixFortran77Variable.
	self assert: var name equals: 'aVar'.
	self assert: var declaredType class equals: FamixFortran77Type.
	self assert: var declaredType name equals: 'integer'.
	self assert: var parentBehaviouralEntity isNotNil.
	self
		assert: var parentBehaviouralEntity
		equals: entity programUnits first
]

{ #category : #running }
IASTToFamixVisitorTest >> testCreateFamixFortran77PUBlockdata [

	| entity |
	programFile progUnits: { IASTBlockData new
			 entityName: 'bdata';
			 yourself
	}.

	entity := programFile accept: visitor.

	self assert: entity programUnits size equals: 1.

	entity := entity programUnits first.
	self assert: entity class equals: FamixFortran77PUBlockdata.
	self assert: entity name equals: 'bdata'.
	self assert: entity programFile isNotNil.
]

{ #category : #running }
IASTToFamixVisitorTest >> testCreateFamixFortran77PUComment [
	| entity |
	programFile progUnits: { IASTComment new
		text: ' a comment' ;
		isProgUnit: true ;
		yourself  
	}.

	entity := programFile accept: visitor.

	self assert: entity programUnits size equals: 1.

	entity := entity programUnits first.
	self assert: entity class equals: FamixFortran77PUComment.
	self assert: entity content equals: ' a comment'.
	self assert: entity programFile isNotNil.
]

{ #category : #running }
IASTToFamixVisitorTest >> testCreateFamixFortran77PUFunction [

	| entity |
	programFile progUnits: { IASTFunction new
			 entityName: 'fct';
			 yourself }.

	entity := programFile accept: visitor.

	self assert: entity programUnits size equals: 1.

	entity := entity programUnits first.
	self assert: entity class equals: FamixFortran77PUFunction.
	self assert: entity name equals: 'fct'.
	self assert: entity programFile isNotNil.
]

{ #category : #running }
IASTToFamixVisitorTest >> testCreateFamixFortran77PUFunctionWithParameter [

	| entity param |
	programFile progUnits: { IASTFunction new
			 entityName: 'fct';
			 parameters: { self defaultParameter };
			 yourself }.

	entity := programFile accept: visitor.

	self assert: entity programUnits size equals: 1.

	entity := entity programUnits first.
	self assert: entity class equals: FamixFortran77PUFunction.
	self assert: entity name equals: 'fct'.
	self assert: entity programFile isNotNil.

	self assert: entity parameters size equals: 1.
	param := entity parameters first.
	self assert: param class equals: FamixFortran77Parameter.
	self assert: param name equals: 'var'.
	self assert: param parentBehaviouralEntity equals: entity.
]

{ #category : #running }
IASTToFamixVisitorTest >> testCreateFamixFortran77PUMain [

	| entity |
	programFile progUnits: { IASTMainProgram new
			 entityName: 'main';
			 yourself }.

	entity := programFile accept: visitor.

	self assert: entity programUnits size equals: 1.

	entity := entity programUnits first.
	self assert: entity class equals: FamixFortran77PUMain.
	self assert: entity name equals: 'main'.
	self assert: entity programFile isNotNil.
]

{ #category : #running }
IASTToFamixVisitorTest >> testCreateFamixFortran77ProgramFile [
	| entity |
	programFile accept: visitor.

	self assert: visitor model size equals: 1.

	entity := visitor model first.
	self assert: entity class equals: FamixFortran77ProgramFile.
	self assert: entity filename equals: 'fortran77.f'.
	self assert: entity programUnits size equals: 0
]

{ #category : #running }
IASTToFamixVisitorTest >> testCreateFamixFortran77SourceAnchor [
	| entity |
	entity := self defaultAnchor accept: visitor.
	
	self assert: entity class equals: FamixFortran77IndexedFileAnchor.
	self assert: entity fileName equals: 'fortran77.f'.
	self assert: entity startLine equals: 1.
	self assert: entity startColumn equals: 7.
	self assert: entity endLine equals: 2.
	self assert: entity endColumn equals: 10.
]

{ #category : #running }
IASTToFamixVisitorTest >> testCreateFamixFortran77Subroutine [

	| entity |
	programFile progUnits: { IASTSubroutine new
			 entityName: 'sub';
			 yourself }.

	entity := programFile accept: visitor.

	self assert: entity programUnits size equals: 1.

	entity := entity programUnits first.
	self assert: entity class equals: FamixFortran77PUSubroutine.
	self assert: entity name equals: 'sub'.
	self assert: entity programFile isNotNil.
	self assert: entity parameters size equals: 0
]

{ #category : #running }
IASTToFamixVisitorTest >> testCreateFamixFortran77SubroutineWithSimpleImplicit [

	| entity sub |
	programFile progUnits: { IASTSubroutine new
			 entityName: 'sub';
			 body: {
			 	self defaultImplicit: { #($c $s) } for: 'character' .
				self defaultImplicit: { #($i $j $k) } for: 'integer' .
			 };
			 yourself }.

	entity := programFile accept: visitor.

	self assert: entity programUnits size equals: 1.

	sub := entity programUnits first.
	self assert: sub class equals: FamixFortran77PUSubroutine.
	self assert: sub name equals: 'sub'.
	self assert: sub programFile isNotNil.

	self assert: sub implicits size equals: 2.
	self assert: sub implicits first class equals: IASTImplicit.
	self assert: sub implicits second class equals: IASTImplicit.
	
]
