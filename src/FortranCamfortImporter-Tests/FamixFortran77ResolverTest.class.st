Class {
	#name : #FamixFortran77ResolverTest,
	#superclass : #TestCase,
	#instVars : [
		'mooseModel',
		'resolver',
		'famixProgFile'
	],
	#category : #'FortranCamfortImporter-Tests-Resolver'
}

{ #category : #'default values' }
FamixFortran77ResolverTest >> anchorFrom: startPoint to: endPoint [

	^ FamixFortran77IndexedFileAnchor new
		  mooseModel: mooseModel;
		  startLine: startPoint x;
		  startColumn: startPoint y;
		  endLine: endPoint x;
		  endColumn: endPoint y;
		  fileName: 'fortran77.f';
		  yourself
]

{ #category : #'default values' }
FamixFortran77ResolverTest >> defaultAccess: varName isWrite: boolean [

	^ FamixFortran77Access new
		  mooseModel: mooseModel;
		  attributeAt: #entity
		  put: (self defaultIASTVarAccess: varName isWrite: boolean);
		  sourceAnchor: self defaultAnchor;
		  yourself
]

{ #category : #'default values' }
FamixFortran77ResolverTest >> defaultAnchor [

	^ self anchorFrom: 1 @ 7 to: 2 @ 10
]

{ #category : #'default values' }
FamixFortran77ResolverTest >> defaultFunction: name [

	^ (self newNamedEntity: name toFamix: FamixFortran77PUFunction) 
		  programFile: famixProgFile
]

{ #category : #'default values' }
FamixFortran77ResolverTest >> defaultIASTInvocation: name [

	^ IASTInvocation new
		  entityName: name;
		  yourself
]

{ #category : #'default values' }
FamixFortran77ResolverTest >> defaultIASTVarAccess: name isWrite: boolean [

	^ IASTVarAccess new
		  isWrite: boolean;
		  entityName: name;
		  yourself
]

{ #category : #'default values' }
FamixFortran77ResolverTest >> defaultImplicit: ranges for: typeName [

	^ IASTImplicit new
		  forType: (self defaultType: typeName);
		  ranges: ranges;
		  yourself
]

{ #category : #'default values' }
FamixFortran77ResolverTest >> defaultImplicitNone [

	^ IASTImplicit new
		  forType: nil;
		  ranges: nil;
		  yourself
]

{ #category : #'default values' }
FamixFortran77ResolverTest >> defaultInvocation: name [

	^ FamixFortran77Invocation new
		  mooseModel: mooseModel;
		  attributeAt: #entity put: (self defaultIASTInvocation: name);
		  sourceAnchor: self defaultAnchor;
		  yourself
]

{ #category : #'default values' }
FamixFortran77ResolverTest >> defaultMain: name [

	^ (self newNamedEntity: name toFamix: FamixFortran77PUMain) 
		  programFile: famixProgFile
]

{ #category : #'default values' }
FamixFortran77ResolverTest >> defaultParameter: name [

	^ self newNamedEntity: name toFamix: FamixFortran77Parameter
]

{ #category : #'default values' }
FamixFortran77ResolverTest >> defaultProgramFile: aFilename [

	^ (self newNamedEntity: aFilename toFamix: FamixFortran77ProgramFile)
		  filename: aFilename;
		  yourself
]

{ #category : #'default values' }
FamixFortran77ResolverTest >> defaultSubroutine: name [

	^ (self newNamedEntity: name toFamix: FamixFortran77PUSubroutine) 
		  programFile: famixProgFile
]

{ #category : #'default values' }
FamixFortran77ResolverTest >> defaultSubroutine: name belongsTo: aFamixProgramFile [

	^ (self newNamedEntity: name toFamix: FamixFortran77PUSubroutine) 
		  programFile: aFamixProgramFile
]

{ #category : #'default values' }
FamixFortran77ResolverTest >> defaultType: anIntrinsicFortranType [

	^ FamixFortran77Type new
		  name: anIntrinsicFortranType;
		  sourceAnchor: self defaultAnchor;
		  yourself
]

{ #category : #'default values' }
FamixFortran77ResolverTest >> defaultVariable: name withType: type [

	^ (self newNamedEntity: name toFamix: FamixFortran77Variable) 
		  declaredType: (self defaultType: type)
]

{ #category : #running }
FamixFortran77ResolverTest >> newEntity: aFamixClass [

	^ aFamixClass new
		  mooseModel: mooseModel;
		  sourceAnchor: self defaultAnchor;
		  yourself
]

{ #category : #running }
FamixFortran77ResolverTest >> newNamedEntity: aName toFamix: aFamixClass [

	^ (self newEntity: aFamixClass)
		name: aName
]

{ #category : #running }
FamixFortran77ResolverTest >> setUp [

	super setUp.

	mooseModel := FamixEsopeModel new name: 'mooseModel-tests'; yourself.
	resolver := FamixFortran77Resolver newFrom: mooseModel.
	famixProgFile  := self defaultProgramFile: './main.f'.
]

{ #category : #running }
FamixFortran77ResolverTest >> testCreateFamixFortran77Access [
	| main access accessor |

	accessor := (self defaultMain: 'main')
		addLocalVariable: (self defaultVariable: 'var' withType: #integer);
		addAccess: (self defaultAccess: 'var' isWrite: false);
		yourself.
		
	main := (resolver model allWithSubTypesOf: FamixFortran77ProgramUnit) first.

 	resolver resolve.

	self assert: main accesses size equals: 1.
	access := main accesses first.

	self assert: access variable equals: main localVariables first.
]

{ #category : #running }
FamixFortran77ResolverTest >> testCreateFamixFortran77AccessNonDeclaredVariable [
	| main access accessor |
	"
      program main
      var
      end
	"

	accessor := (self defaultMain: 'main')
		addAccess: (self defaultAccess: 'var' isWrite: false);
		yourself.

	main := (resolver model allWithType: FamixFortran77PUMain) first.

	self assert: main localVariables size equals: 0.

 	resolver resolve.
	
	self assert: main localVariables size equals: 1.

	self assert: main accesses size equals: 1.
	access := main accesses first.

	self assert: access variable equals: main localVariables first.
	self assert: access variable declaredType name equals: 'real'.
]

{ #category : #running }
FamixFortran77ResolverTest >> testCreateFamixFortran77InvocationCalleeBeforeCaller [
	| sub main invocation callee caller |
	
	caller := (self defaultMain: 'main')
		addOutgoingInvocation: (self defaultInvocation: 'sub');
		yourself.
		
	callee := self defaultSubroutine: 'sub'.

 	resolver resolve.

	main := (resolver model allWithType: FamixFortran77PUMain) first.
	sub := (resolver model allWithType: FamixFortran77PUSubroutine) first.

	self assert: main outgoingInvocations size equals: 1.
	invocation := main outgoingInvocations first.
	
	self assert: invocation class equals: FamixFortran77Invocation.
	self assert: invocation sender equals: main.
	
	self assert: invocation candidates size equals: 1.
	self assert: invocation candidates first equals: sub.
]

{ #category : #running }
FamixFortran77ResolverTest >> testCreateFamixFortran77InvocationCallerBeforeCallee [
	| main sub invocation callee caller |
	caller := (self defaultMain: 'main')
		addOutgoingInvocation: (self defaultInvocation: 'sub');
		yourself.
		
	callee := self defaultSubroutine: 'sub'.

 	resolver resolve.

	main := (resolver model allWithType: FamixFortran77PUMain) first.
	sub := (resolver model allWithType: FamixFortran77PUSubroutine) first.

	self assert: main outgoingInvocations size equals: 1.
	invocation := main outgoingInvocations first.
	
	self assert: invocation class equals: FamixFortran77Invocation.
	self assert: invocation sender equals: main.
	
	self assert: invocation candidates size equals: 1.
	self assert: invocation candidates first equals: sub.
]

{ #category : #running }
FamixFortran77ResolverTest >> testCreateFamixFortran77InvocationInDifferentFiles [
	| invocation callee caller famixProgFile1 main sub |

	famixProgFile1  := self defaultProgramFile: './sub.f'.
	
	caller := (self defaultMain: 'main')
		addOutgoingInvocation: (self defaultInvocation: 'sub');
		yourself.
		
	callee := (self defaultSubroutine: 'sub' belongsTo: famixProgFile1).

	
	resolver resolve.
	
	main := (resolver model allWithType: FamixFortran77PUMain) anyOne.
	sub := (resolver model allWithType: FamixFortran77PUSubroutine) anyOne.

	self assert: main outgoingInvocations size equals: 1.
	invocation := main outgoingInvocations first.
	
	self assert: invocation class equals: FamixFortran77Invocation.
	self assert: invocation sender equals: main.
	
	self assert: invocation candidates size equals: 1.
	self assert: invocation candidates first equals: sub.
]

{ #category : #running }
FamixFortran77ResolverTest >> testCreateFamixFortran77InvocationMultipleCalleeBeforeCaller [
	| main sub fct invocation calleeSub calleeFct caller |
	caller := (self defaultMain: 'main')
		addOutgoingInvocation: (self defaultInvocation: 'sub');
		addOutgoingInvocation: (self defaultInvocation: 'fct');
		yourself.
		
	calleeSub := self defaultSubroutine: 'sub'.
	calleeFct := self defaultFunction: 'fct'.
	
	resolver resolve.

	main := (resolver model allWithType: FamixFortran77PUMain) first.
	fct := (resolver model allWithType: FamixFortran77PUFunction) first.
	sub := (resolver model allWithType: FamixFortran77PUSubroutine) first.

	self assert: main outgoingInvocations size equals: 2.
	invocation := main outgoingInvocations first.
	
	self assert: invocation class equals: FamixFortran77Invocation.
	self assert: invocation sender equals: main.
	
	self assert: invocation candidates size equals: 1.
	self assert: invocation candidates first equals: sub.
	
	invocation := main outgoingInvocations second.
	
	self assert: invocation class equals: FamixFortran77Invocation.
	self assert: invocation sender equals: main.
	
	self assert: invocation candidates size equals: 1.
	self assert: invocation candidates first equals: fct.
]

{ #category : #running }
FamixFortran77ResolverTest >> testCreateFamixFortran77LocalVariableAsFunction [
	| famixMain famixFunction |
	"
      program main
      real f
      end
      function f()
      end
	"
	(self defaultMain: 'main')
		addLocalVariable: (self defaultVariable: 'f' withType: #real).
		
	self defaultFunction: 'f'.
	
	famixMain := (resolver model allWithType: FamixFortran77PUMain) first.
	famixFunction := (resolver model allWithType: FamixFortran77PUFunction) first.

	self assert: famixFunction declaredType isNil.
	self assert: famixMain localVariables size equals: 1.
	
 	resolver resolve.

	self assert: famixMain localVariables isEmpty.
	self assert: famixFunction declaredType class equals: FamixFortran77Type.
	self assert: famixFunction declaredType name equals: 'real'.
]

{ #category : #running }
FamixFortran77ResolverTest >> testCreateFamixFortran77LocalVariableAsParameter [
	| subroutine access |

	(self defaultSubroutine: 'sub')
		addParameter: (self defaultParameter: 'var');
		addLocalVariable: (self defaultVariable: 'var' withType: #integer);
		addAccess: (self defaultAccess: 'var' isWrite: false);
		addAccess: (self defaultAccess: 'var' isWrite: false).
	
	subroutine := (resolver model allWithSubTypesOf: FamixFortran77ProgramUnit) first.

	self assert: subroutine localVariables size equals: 1.

 	resolver resolve.
	
	self assert: subroutine localVariables size equals: 0.

	self assert: subroutine accesses size equals: 2.
	access := subroutine accesses first.
	
	self assert: access class equals: FamixFortran77Access.
	self assert: access variable equals: subroutine parameters first.
	
	access := subroutine accesses second.
	
	self assert: access class equals: FamixFortran77Access.
	self assert: access variable equals: subroutine parameters first.
]

{ #category : #running }
FamixFortran77ResolverTest >> testCreateFamixFortran77ParameterWithLocalVariable [
	| subroutine access accessor |

	accessor := (self defaultSubroutine: 'sub')
		addParameter: (self defaultParameter: 'var');
		addLocalVariable: (self defaultVariable: 'var' withType: 'integer');
		addAccess: (self defaultAccess: 'var' isWrite: false);
		yourself.
	
	subroutine := (resolver model allWithSubTypesOf: FamixFortran77ProgramUnit) first.
	self assert: subroutine localVariables size equals: 1.

 	resolver resolve.

	self assert: subroutine localVariables size equals: 0.
	self assert: subroutine accesses size equals: 1.
	access := subroutine accesses first.
	
	self assert: access class equals: FamixFortran77Access.
	self assert: access variable equals: subroutine parameters first.
]

{ #category : #running }
FamixFortran77ResolverTest >> testCreateFamixFortran77ResolveImplicitNone [
	| famixSubroutine types subroutine |

	subroutine := (self defaultSubroutine: 'sub')
		attributeAt: #implicits put: { self defaultImplicitNone };
		addParameter: (self defaultParameter: 'var');
		addAccess: (self defaultAccess: 'var' isWrite: false);
		yourself.

 	resolver resolve.

	self assert: (resolver model allWithSubTypesOf: FamixFortran77ProgramUnit) size equals: 1.
	
	famixSubroutine := (resolver model allWithSubTypesOf: FamixFortran77ProgramUnit) first.

	self assert: famixSubroutine dicImplicit size equals: 26.
	
	types := ($a to: $z) collect: [:letter | famixSubroutine dicImplicit at: letter ].
	self assert: types size equals: 26.
	self assert: types asSet size equals: 1.
	self assert: types asSet anyOne isNil
]

{ #category : #running }
FamixFortran77ResolverTest >> testCreateFamixFortran77ResolveImplicits [
	| famixSubroutine subroutine types |

	subroutine := (self defaultSubroutine: 'sub')
		attributeAt: #implicits put: { self defaultImplicit: { #($c $s) . #($v $m) } for: 'character' };
		addParameter: (self defaultParameter: 'var');
		addAccess: (self defaultAccess: 'var' isWrite: false);
		yourself.

 	resolver resolve.

	self assert: (resolver model allWithSubTypesOf: FamixFortran77ProgramUnit) size equals: 1.
	
	famixSubroutine := (resolver model allWithSubTypesOf: FamixFortran77ProgramUnit) first.

	self assert: famixSubroutine dicImplicit size equals: 26.
	
	types := 'csvm' asArray collect: [:letter | famixSubroutine dicImplicit at: letter ].
	self assert: types size equals: 4.
	self assert: types asSet size equals: 1.
	self assert: types asSet anyOne equals: 'character'.
	
	types := 'ijkln' asArray collect: [:letter | famixSubroutine dicImplicit at: letter ].
	self assert: types size equals: 5.
	self assert: types asSet size equals: 1.
	self assert: types asSet anyOne equals: 'integer'.
	
	types := 'abdefghopqrtuwxyz' asArray collect: [:letter | famixSubroutine dicImplicit at: letter ].
	self assert: types size equals: 17.
	self assert: types asSet size equals: 1.
	self assert: types asSet anyOne equals: 'real'
]

{ #category : #running }
FamixFortran77ResolverTest >> testCreateFamixFortran77ResolveParametersType [
	| entity access accessor |

	accessor := (self defaultSubroutine: 'sub')
		addParameter: (self defaultParameter: 'var');
		addAccess: (self defaultAccess: 'var' isWrite: false);
		addAccess: (self defaultAccess: 'var' isWrite: false);
		yourself.

 	resolver resolve.

	self assert: (resolver model allWithSubTypesOf: FamixFortran77ProgramUnit) size equals: 1.
	
	entity := (resolver model allWithSubTypesOf: FamixFortran77ProgramUnit) first.

	self assert: entity accesses size equals: 2.
	access := entity accesses first.
	
	self assert: access class equals: FamixFortran77Access.
	self assert: access variable equals: entity parameters first.
	
	access := entity accesses second.
	
	self assert: access class equals: FamixFortran77Access.
	self assert: access variable equals: entity parameters first.
]

{ #category : #running }
FamixFortran77ResolverTest >> testCreateFamixFortran77ResolveParametersTypeWithDeclaration [
	| entity access accessor |

	accessor := (self defaultSubroutine: 'sub')
		addParameter: (self defaultParameter: 'var');
		addLocalVariable: (self defaultVariable: 'var' withType: #integer);
		addAccess: (self defaultAccess: 'var' isWrite: false);
		addAccess: (self defaultAccess: 'var' isWrite: false);
		yourself.

 	resolver resolve.

	self assert: (resolver model allWithSubTypesOf: FamixFortran77ProgramUnit) size equals: 1.
	
	entity := (resolver model allWithSubTypesOf: FamixFortran77ProgramUnit) first.

	self assert: entity accesses size equals: 2.
	access := entity accesses first.
	
	self assert: access class equals: FamixFortran77Access.
	self assert: access variable equals: entity parameters first.
	
	access := entity accesses second.
	
	self assert: access class equals: FamixFortran77Access.
	self assert: access variable equals: entity parameters first.
]

{ #category : #running }
FamixFortran77ResolverTest >> testResolveDeclaredImplicit [

	"
	      function fct(param)
	      implicit integer(a-m)
	      fct = param + 10
	      end
	"

	| function |

	function := (self defaultFunction: 'fct')
		            attributeAt: #implicits
		            put:
			            { (self defaultImplicit: { ($a to: $m) } for: 'integer') };
		            parameters: { (self defaultParameter: 'param') };
		            accesses: { 
				            (self defaultAccess: 'param' isWrite: false).
				            (self defaultAccess: 'fct' isWrite: true) }.
	self assert: function parameters first declaredType isNil.
	self assert: function declaredType isNil.
	resolver resolve.
	self
		assert: function parameters first declaredType name
		equals: 'real'.
	self assert: function declaredType name equals: 'integer'
]

{ #category : #running }
FamixFortran77ResolverTest >> testResolveDefaultImplicit [

	"
	      function fct(iparam)
	      fct = param + 10
	      end
	"

	| function |

	function := (self defaultFunction: 'fct')
		            parameters: { (self defaultParameter: 'iparam') };
		            accesses: { 
				            (self defaultAccess: 'iparam' isWrite: false).
				            (self defaultAccess: 'fct' isWrite: true) }.
	self assert: function parameters first declaredType isNil.
	self assert: function declaredType isNil.
	resolver resolve.
	self
		assert: function parameters first declaredType name
		equals: 'integer'.
	self assert: function declaredType name equals: 'real'
]

{ #category : #running }
FamixFortran77ResolverTest >> testResolveImplicitNone [

	"
	      function fct(param)
	      implicit none
	      fct = param + 10
	      end
	"

	| function |

	function := (self defaultFunction: 'fct')
		            attributeAt: #implicits
		            put: { self defaultImplicitNone };
		            parameters: { (self defaultParameter: 'param') };
		            accesses: { 
				            (self defaultAccess: 'param' isWrite: false).
				            (self defaultAccess: 'fct' isWrite: true) }.

	self assert: function parameters first declaredType isNil.
	self assert: function declaredType isNil.

	resolver resolve.

	self
		assert: function parameters first declaredType isNil.
	self assert: function declaredType isNil
]

{ #category : #running }
FamixFortran77ResolverTest >> testResolveImplicitNoneWithParameterDeclared [

	"
	      function fct(param)
	      implicit none
	      integer param
	      fct = param + 10
	      end
	"

	| function |

	function := (self defaultFunction: 'fct')
		            attributeAt: #implicits
		            put: { self defaultImplicitNone };
		            parameters: { (self defaultParameter: 'param') };
		            localVariables:
			            { (self defaultVariable: 'param' withType: 'integer') };
		            accesses: { 
				            (self defaultAccess: 'param' isWrite: false).
				            (self defaultAccess: 'fct' isWrite: true) }.

	self assert: function parameters first declaredType isNil.
	self assert: function declaredType isNil.

	resolver resolve.

	self assert: function parameters first declaredType name equals: 'integer'.
	self assert: function declaredType isNil
]

{ #category : #running }
FamixFortran77ResolverTest >> testResolveSegment [

	| sub access accessor |
	"
      subroutine demo
      segment point
      integer x,y
      end segment
      pointeur p.point
      p.x = 1
      p.y = p.x + 1
      end
	"
	accessor := (self
		             newNamedEntity: 'demo'
		             toFamix: FamixFortran77PUSubroutine)
		            programFile: famixProgFile;
		            addType:
			            ((self
				              newNamedEntity: 'point'
				              toFamix: FamixEsopeSegment) attributes: { 
						             ((self
							               newNamedEntity: 'x'
							               toFamix: FamixEsopeAttribute)
							              declaredType:
								              (self
									               newNamedEntity: 'integer'
									               toFamix: FamixFortran77Type);
							              isEsope: true;
							              yourself).
						             ((self
							               newNamedEntity: 'y'
							               toFamix: FamixEsopeAttribute)
							              declaredType:
								              (self
									               newNamedEntity: 'integer'
									               toFamix: FamixFortran77Type);
							              isEsope: true;
							              yourself) });
		            addLocalVariable:
			            ((self
				              newNamedEntity: 'p'
				              toFamix: FamixFortran77Variable) declaredType:
				             (self
					              newNamedEntity: 'point'
					              toFamix: FamixFortran77Type));
		            accesses: { 
				            ((self newEntity: FamixFortran77Access)
					             attributeAt: #entity
					             put: (self defaultIASTVarAccess: 'p' isWrite: true);
					             yourself).
				            ((self newEntity: FamixFortran77Access)
					             attributeAt: #entity
					             put: (self defaultIASTVarAccess: 'x' isWrite: true);
					             attributeAt: #pointer
					             put: (self defaultIASTVarAccess: 'p' isWrite: true);
					             yourself).
				            ((self newEntity: FamixFortran77Access)
					             attributeAt: #entity
					             put: (self defaultIASTVarAccess: 'p' isWrite: true);
					             yourself).
				            ((self newEntity: FamixFortran77Access)
					             attributeAt: #entity
					             put: (self defaultIASTVarAccess: 'y' isWrite: true);
					             attributeAt: #pointer
					             put: (self defaultIASTVarAccess: 'p' isWrite: true);
					             yourself).
				            ((self newEntity: FamixFortran77Access)
					             attributeAt: #entity
					             put: (self defaultIASTVarAccess: 'p' isWrite: true);
					             yourself).
				            ((self newEntity: FamixFortran77Access)
					             attributeAt: #entity
					             put: (self defaultIASTVarAccess: 'x' isWrite: true);
					             attributeAt: #pointer
					             put: (self defaultIASTVarAccess: 'p' isWrite: true);
					             yourself) }.


	sub := (resolver model allWithSubTypesOf: FamixFortran77ProgramUnit)
		       first.

	resolver resolve.

	self assert: sub accesses size equals: 6.

	access := sub accesses at: 1.
	self assert: access variable equals: sub localVariables first.

	access := sub accesses at: 3.
	self assert: access variable equals: sub localVariables first.

	access := sub accesses at: 5.
	self assert: access variable equals: sub localVariables first.

	access := sub accesses at: 2.
	self assert: access variable equals: sub types first attributes first.

	access := sub accesses at: 4.
	self
		assert: access variable
		equals: sub types first attributes second.

	access := sub accesses at: 6.
	self assert: access variable equals: sub types first attributes first
]
