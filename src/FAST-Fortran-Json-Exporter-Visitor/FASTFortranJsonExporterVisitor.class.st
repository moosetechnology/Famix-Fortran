Class {
	#name : #FASTFortranJsonExporterVisitor,
	#superclass : #FortranAbstractJsonVisitor,
	#instVars : [
		'output',
		'sixSpaces'
	],
	#category : #'FAST-Fortran-Json-Exporter-Visitor'
}

{ #category : #'visiting prog-unit' }
FASTFortranJsonExporterVisitor >> endProgramUnit [

	output
		<< sixSpaces;
		<< 'end';
		cr
]

{ #category : #initialization }
FASTFortranJsonExporterVisitor >> initialize [

	super initialize.
	output := String new writeStream.
	sixSpaces := '      '
]

{ #category : #'private - helpers' }
FASTFortranJsonExporterVisitor >> numberOfSpaces: startPosition [

	"
	2 because of `@_#include` No need to have an prepend spaces
	startPosition for this comment is 2: we skip the two first characters.
	"

	^ startPosition > 2
		  ifFalse: [ '' ]
		  ifTrue: [ sixSpaces ]
]

{ #category : #accessing }
FASTFortranJsonExporterVisitor >> output [

	^ output ifNil: [ output := String new writeStream ]
]

{ #category : #accessing }
FASTFortranJsonExporterVisitor >> output: anObject [

	output := anObject
]

{ #category : #accessing }
FASTFortranJsonExporterVisitor >> sixSpaces [

	^ sixSpaces ifNil: [ sixSpaces := '      ' ]
]

{ #category : #accessing }
FASTFortranJsonExporterVisitor >> sixSpaces: anObject [

	sixSpaces := anObject
]

{ #category : #'private - helpers' }
FASTFortranJsonExporterVisitor >> unmarkAsEsope: anEsopeCommentNode from: startPosition [

	output
		<< (self numberOfSpaces: startPosition);
		<< ((anEsopeCommentNode at: 'comment') allButFirst: startPosition);
		cr
]

{ #category : #'visiting expression' }
FASTFortranJsonExporterVisitor >> visitAddition: anAdditionOperatorNode [

	output << ' + '
]

{ #category : #'visiting prog-unit' }
FASTFortranJsonExporterVisitor >> visitArguments: anArgumentList [
	output << $(.
	self visitList: anArgumentList separatedBy: $, .
	output << $)
]

{ #category : #'visiting expression' }
FASTFortranJsonExporterVisitor >> visitAssign_expression: anAssignExpressionNode [

	self visitJsonElement: (anAssignExpressionNode at: 'target').
	output << ' = '.
	self visitJsonElement: (anAssignExpressionNode at: 'expression')
]

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitAssign_expressionStatement: anAssignExpressionNode [

	"assign_expression and assign_expressionStatement are the same"

	output << sixSpaces.
	self visitAssign_expression: anAssignExpressionNode.
	output cr
]

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitBase_type: aString [
	"to offer the possibility to handle each baseType differently, we create #visitXYZBaseType: methods"

	self visitJsonNode: (aString , 'BaseType') value: aString

]

{ #category : #'visiting prog-unit' }
FASTFortranJsonExporterVisitor >> visitBlock_data: aBlockDataNode [

	output
		<< sixSpaces;
		<< 'block data ';
		<< (aBlockDataNode at: 'name');
		cr.

	self visitJsonElement: (aBlockDataNode at: 'blocks').

	self endProgramUnit
]

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitCallStatement: aCallStatementNode [

	"^self visitJsonMap: aCallStatementNode keys: #(span function arguments)"

	output
		<< sixSpaces;
		<< 'call '.
	self visitJsonElement: (aCallStatementNode at: 'function').

	(aCallStatementNode at: 'arguments') ifNotNil: [ :arguments | 
		(arguments at: 'list') ifNotEmpty: [ self visitArguments: arguments ] ].
	output cr
]

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitCharacterBaseType: aString [

	output << ((super visitCharacterBaseType: aString) , ' ')
]

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitCommonStatement: aCommonStatementNode [

	"^self visitJsonMap: aCommonStatementNode keys: #(span common_groups)"

	output
		<< sixSpaces;
		<< 'common '.
	self visitJsonElement: (aCommonStatementNode at: 'common_groups').
	output cr
]

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitCondition: aLogicalIfConditionNode [

	self visitIfCondition: aLogicalIfConditionNode
]

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitConditions: aConditionList [

	| ifPart |
	ifPart := aConditionList first.

	output
		<< sixSpaces;
		<< 'if '.
	self visitIfCondition: ifPart first.
	output
		<< ' then';
		cr.
	self visitThenPart: ifPart second.

	aConditionList allButFirst do: [ :aCondition | 
		output
			<< sixSpaces;
			<< 'else if '.
		self visitIfCondition: aCondition first.
		output
			<< ' then';
			cr.
		self visitThenPart: aCondition second ]
]

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitContinueStatement: aContinueStatementNode [

	output
		<< sixSpaces;
		<< 'continue';
		cr
]

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitDeclarationStatement: aDeclarationStatementNode [

	"^self visitJsonMap: aDeclarationStatementNode keys: #(span type attributes declarators)"

	output << sixSpaces.
	output << ((aDeclarationStatementNode at: 'type') at: 'base_type').
	self visitJsonElement:
		((aDeclarationStatementNode at: 'type') at: 'selector').

	output << ' '.

	self visitAttributes: (aDeclarationStatementNode at: 'attributes').
	self visitDeclarators: (aDeclarationStatementNode at: 'declarators').
	output cr
]

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitDeclarator: aDeclaratorNode [

	"
	'dims' attribute need to be considered in the case of an array. can be confused with 'length'
	example: a = 1 =>
	aDeclaratorNode contains
	 - 'span': sourceAnchor
	 - 'initial': 1, not relevant for fortran77
	 - 'length': nil, see documentation to understand the intent of this attribute
	 - 'type': scalar indicate that 'a' is an array or not; can take two values between 'array' and 'scalar'
	 - 'variable': a, the name of the variable
	"

	self visitJsonElement: (aDeclaratorNode at: 'variable').
	(aDeclaratorNode at: 'type') = #array ifFalse: [ ^ self ].
	output << $(.
	self visitJsonElement: (aDeclaratorNode at: 'dims').
	output << $)
]

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitDeclarators: aDeclaratorsList [

	aDeclaratorsList ifNotNil: [
		(aDeclaratorsList at: 'list')
			do: [ :decl | self visitDeclarator: decl ]
			separatedBy: [ output << $, ]
	]
]

{ #category : #'visiting prog-unit' }
FASTFortranJsonExporterVisitor >> visitDims: aList [

	aList ifNotNil: [ 
		(aList at: 'list') allButLast
			do: [ :param | self visitJsonElement: param ]
			separatedBy: [ output << $. ].
			output << '(/'.
			self visitJsonElement: (aList at: 'list') last.
			output << ')' ]
]

{ #category : #'visiting expression' }
FASTFortranJsonExporterVisitor >> visitDivision: aDivisionOperatorNode [

	output << ' / '
]

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitDo: aDoNode [

	"^self visitJsonMap: aDoNode keys: #(span do_spec body)"

	output
		<< sixSpaces;
		<< 'do '.
	"self visitJsonElement: (aDoNode at: 'do_spec')."
	self visitDo_spec: (aDoNode at: 'do_spec').
	self visitJsonElement: (aDoNode at: 'body').
	output
		<< sixSpaces;
		<< 'end do';
		cr
]

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitDo_spec: aDoSpecNode [

	"^self visitJsonMap: aDoSpecNode keys: #(span initial limit increment)"

	self visitJsonElement: (aDoSpecNode at: 'initial').
	output << $,.
	self visitJsonElement: (aDoSpecNode at: 'limit').
	(aDoSpecNode at: 'increment') ifNotNil: [ :increment | 
		output << $,.
		self visitJsonElement: increment ].
	output cr
]

{ #category : #'visiting expression' }
FASTFortranJsonExporterVisitor >> visitEq: anEqualtoOperatorNode [

	output
		<< ' ';
		<< (super visitEq: anEqualtoOperatorNode);
		<< ' '
]

{ #category : #'visiting esope' }
FASTFortranJsonExporterVisitor >> visitEsopeEndsegmentComment: anEsopeCommentNode [

	self unmarkAsEsope: anEsopeCommentNode from: 5
]

{ #category : #'visiting esope' }
FASTFortranJsonExporterVisitor >> visitEsopeIncludeComment: anEsopeIncludeCommentNode [

	"An include comment looks like this: 
	 - @_#include ""file.inc""
	 - @_#include <file.inc>
	So we need to skip the only two first characters, ie @_
	"
	self unmarkAsEsope: anEsopeIncludeCommentNode from: 2
]

{ #category : #'visiting esope' }
FASTFortranJsonExporterVisitor >> visitEsopePointeurComment: anEsopeCommentNode [

	self unmarkAsEsope: anEsopeCommentNode from: 5
]

{ #category : #'visiting esope' }
FASTFortranJsonExporterVisitor >> visitEsopeSegactComment: anEsopeCommentNode [

	self unmarkAsEsope: anEsopeCommentNode from: 5
]

{ #category : #'visiting esope' }
FASTFortranJsonExporterVisitor >> visitEsopeSegadjComment: anEsopeCommentNode [

	self unmarkAsEsope: anEsopeCommentNode from: 5
]

{ #category : #'visiting esope' }
FASTFortranJsonExporterVisitor >> visitEsopeSegdesComment: anEsopeCommentNode [

	self unmarkAsEsope: anEsopeCommentNode from: 5
]

{ #category : #'visiting esope' }
FASTFortranJsonExporterVisitor >> visitEsopeSeginiComment: anEsopeCommentNode [

	self unmarkAsEsope: anEsopeCommentNode from: 5
]

{ #category : #'visiting esope' }
FASTFortranJsonExporterVisitor >> visitEsopeSegmentComment: anEsopeCommentNode [

	self unmarkAsEsope: anEsopeCommentNode from: 5
]

{ #category : #'visiting esope' }
FASTFortranJsonExporterVisitor >> visitEsopeSegsupComment: anEsopeCommentNode [

	self unmarkAsEsope: anEsopeCommentNode from: 5
]

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitEsopeTranformation: functionName with: argumentsNode [

	functionName = 'd__' ifTrue: [ 
		self visitList: argumentsNode separatedBy: $. ].
	functionName = 's__' ifTrue: [ 
		self visitDims: argumentsNode]
]

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitExitStatement: anExitNode [

	"^self visitJsonMap: anExitNode keys: #(span var)"

	output
		<< sixSpaces;
		<< 'exit'.
	(anExitNode at: 'var') ifNotNil: [ 
		output << ' '.
		self visitJsonElement: (anExitNode at: 'var') ].
	output cr
]

{ #category : #'visiting expression' }
FASTFortranJsonExporterVisitor >> visitExponent: aRealLiteralExponentNode [

	(aRealLiteralExponentNode at: 'num') = '0'
		ifTrue: [  ]
		ifFalse: [ 
			output
				<< (aRealLiteralExponentNode at: 'letter');
				<< (aRealLiteralExponentNode at: 'num') ]
]

{ #category : #'visiting expression' }
FASTFortranJsonExporterVisitor >> visitExponentiation: aExponentiationOperatorNode [

	output << ' ** '
]

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitExternalStatement: anExternalStatementNode [

	output
		<< sixSpaces;
		<< 'external '.
	self visitJsonElement: (anExternalStatementNode at: 'vars').
	output cr
]

{ #category : #'visiting expression' }
FASTFortranJsonExporterVisitor >> visitFalseLiteralValue: aString [

	output
		<< $.;
		<< ((super visitFalseLiteralValue: aString) first) asString;
		<< $.
]

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitFortranComment: aFortranCommentNode [

	"A reaf Fortran comment as opposed to a comment that contains an Esope command
	cannot call visitJsonMap: because contains a key 'comment' that would recursively loop on this method"

	output
		<< 'c';
		<< (aFortranCommentNode at: 'comment');
		cr
]

{ #category : #'visiting prog-unit' }
FASTFortranJsonExporterVisitor >> visitFunction: aFunctionNode [

	(aFunctionNode includesKey: 'blocks')
	 ifTrue: [ self visitFunctionWithBlocks: aFunctionNode ]
	 ifFalse: [ self visitFunctionAsValue: aFunctionNode ]

]

{ #category : #'visiting prog-unit' }
FASTFortranJsonExporterVisitor >> visitFunctionParameters: aParameterList [

	self visitFunctionParameters: aParameterList separatedBy: $,
]

{ #category : #'visiting prog-unit' }
FASTFortranJsonExporterVisitor >> visitFunctionParameters: aParameterList separatedBy: separator [
	"aParameterList ifNil: [ ^self ].
	aParameterList ifEmpty: [ ^self ]."

	separator = $. ifFalse: [ output << $(. ]. 
	
	aParameterList ifNotNil: [
		(aParameterList at: 'list')
			do: [ :param | self visitJsonElement: param ]
			separatedBy: [ output << separator ]
	].
	separator = $. ifFalse: [ output << $).  ]

]

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitFunctionStatement: aFunctionStatementNode [

	"'name' is an object, not a string so, cannot call #visitName: on it"

	"^{ self visitSpan: (aFunctionStatementNode at: 'span') .
	 self visitJsonElement: (aFunctionStatementNode at: 'name') }
	,
	(self visitJsonMap: aFunctionStatementNode keys:  #(arguments body))."

	| functionName |
	functionName := ((aFunctionStatementNode at: 'name') at: 'value') 
		                at: 'contents'.
	output << sixSpaces.
	
	(self isEsopeTransformation: functionName)
		ifTrue: [ 
			self
				visitFunctionParameters: (aFunctionStatementNode at: 'arguments')
				separatedBy: $. ]
		ifFalse: [ 
			output << functionName.
			self
				visitFunctionParameters: (aFunctionStatementNode at: 'arguments')
				separatedBy: $, ].

	output << ' = '.
	self visitJsonElement: (aFunctionStatementNode at: 'body').
	output cr
]

{ #category : #'visiting prog-unit' }
FASTFortranJsonExporterVisitor >> visitFunctionWithBlocks: aFunctionNode [

	"^self visitJsonMap: aFunctionNode keys: #(span name type arguments blocks)"
	output << sixSpaces.
	self visitJsonElement: (aFunctionNode at: 'type').
	output
		<< 'function ';
		<< (aFunctionNode at: 'name').
	self visitFunctionParameters: (aFunctionNode at: 'arguments').
	output cr.
	self visitJsonElement: (aFunctionNode at: 'blocks').
	self endProgramUnit
]

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitFunction_call: aFunctionCallNode [

	| functionName |
	functionName := ((aFunctionCallNode at: 'function') at: 'value') at:
		                'contents'.

	(self isEsopeTransformation: functionName)
		ifTrue: [ 
			self
				visitEsopeTranformation: functionName
				with: (aFunctionCallNode at: 'arguments') ]
		ifFalse: [ 
			output << functionName.
			self visitArguments: (aFunctionCallNode at: 'arguments') ]
]

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitGotoStatement: aGotoStatementNode [

	"^self visitJsonMap: aGotoStatementNode keys: #(span target)"

	output 
		<< sixSpaces; 
		<< 'goto'.
	(aGotoStatementNode at: 'target') ifNotNil: [ 
		output << ' '.
		self visitJsonElement: (aGotoStatementNode at: 'target') ].
	output cr
]

{ #category : #'visiting expression' }
FASTFortranJsonExporterVisitor >> visitGt: aGreaterthanOperatorNode [

	output
		<< ' ';
		<< (super visitGt: aGreaterthanOperatorNode);
		<< ' '
]

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitIf: anIfNode [

	"^self visitJsonMap: anIfNode keys: #(span label conditions blocks)"

	self visitConditions: (anIfNode at: 'conditions').

	(anIfNode at: 'blocks') ifNotNil: [ :elsePart | 
		output
			<< sixSpaces;
			<< 'else';
			cr.
		self visitJsonElement: elsePart ].

	output
		<< sixSpaces;
		<< 'end if';
		cr
]

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitIfCondition: anIfConditionNode [

	output << $(.
	self visitJsonElement: anIfConditionNode.
	output << $)
]

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitIf_logicalStatement: anIfNode [

	"^self visitJsonMap: anIfNode keys: #(span condition statement)."

	output << sixSpaces; << 'if '.
	self visitCondition: (anIfNode at: 'condition').
	output << ' '.
	self visitJsonElement: (anIfNode at: 'statement').
	output cr
]

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitImplicitStatement: anImplicitStatementNode [

	"^self visitJsonMap: anImplicitStatementNode keys:  #(span items)"
	output
		<< sixSpaces;
		<< 'implicit '.
	(anImplicitStatementNode at: 'items')
		ifNil: [ output << 'none' ]
		ifNotNil: [ 
		self visitJsonElement: (anImplicitStatementNode at: 'items') ].
	output cr
]

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitIntegerBaseType: aString [

	output << ((super visitIntegerBaseType: aString) , ' ')
]

{ #category : #'visiting expression' }
FASTFortranJsonExporterVisitor >> visitIntegerLiteralValue: anIntegerLiteralValueNode [

	output << anIntegerLiteralValueNode first
]

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitLength: aLengthNode [

	| isStar |
	aLengthNode ifNil: [ ^ self ].
	output << $*.
	isStar := ((aLengthNode at: 'value') at: 'tag') = #star.
	isStar ifTrue: [ output << $(].
	self visitJsonElement: (aLengthNode at: 'value').
	isStar ifTrue: [ output << $)].
]

{ #category : #'visiting prog-unit' }
FASTFortranJsonExporterVisitor >> visitList: aList separatedBy: separator [

	aList ifNotNil: [ 
		(aList at: 'list')
			do: [ :param | self visitJsonElement: param ]
			separatedBy: [ output << separator ] ]
]

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitLogicalBaseType: aString [

	output << ((super visitLogicalBaseType: aString) , ' ')
]

{ #category : #'visiting expression' }
FASTFortranJsonExporterVisitor >> visitLt: anLessthanOperatorNode [

	output
		<< ' ';
		<< (super visitLt: anLessthanOperatorNode);
		<< ' '
]

{ #category : #'visiting prog-unit' }
FASTFortranJsonExporterVisitor >> visitMain: aMainProgramNode [

	output
		<< sixSpaces;
		<< 'program ';
		<< (aMainProgramNode at: 'name');
		cr.

	self visitJsonElement: (aMainProgramNode at: 'blocks').
	self visitJsonElement: (aMainProgramNode at: 'subprograms').
	self endProgramUnit
]

{ #category : #'visiting expression' }
FASTFortranJsonExporterVisitor >> visitMinus: aMinusOperatorNode [

	output << '-'
]

{ #category : #'visiting expression' }
FASTFortranJsonExporterVisitor >> visitMultiplication: aMultiplicationOperatorNode [

	output << ' * '
]

{ #category : #'visiting expression' }
FASTFortranJsonExporterVisitor >> visitNe: aNotEqualtoOperatorNode [

	output
		<< ' ';
		<< (super visitNe: aNotEqualtoOperatorNode);
		<< ' '
]

{ #category : #'visiting expression' }
FASTFortranJsonExporterVisitor >> visitNot: aNottoOperatorNode [

	output
		<< ' ';
		<< (super visitNot: aNottoOperatorNode);
		<< ' '
]

{ #category : #'visiting prog-unit' }
FASTFortranJsonExporterVisitor >> visitProgramFile: aProgramFileNode [

	"^self visitJsonMap: aProgramFileNode keys: #(meta program_units)"

	super visitProgramFile: aProgramFileNode.
	^ output contents
]

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitRealBaseType: aString [

	output << ((super visitRealBaseType: aString) , ' ')
]

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitReturnStatement: aReturnStatementNode [

	"^self visitJsonMap: aReturnStatementNode keys: #(span target)"

	output
		<< sixSpaces;
		<< 'return'.
	(aReturnStatementNode at: 'target') ifNotNil: [ 
		output << ' '.
		self visitJsonElement: (aReturnStatementNode at: 'target') ].
	output cr
]

{ #category : #visiting }
FASTFortranJsonExporterVisitor >> visitSelector: aSelectorNode [

	aSelectorNode ifNil: [ ^ self ].

	((aSelectorNode at: 'kind') isNotNil or: [ 
		 (aSelectorNode at: 'length') isNotNil ]) ifFalse: [ ^ self ].
	(aSelectorNode at: 'length') ifNotNil: [ output << $* ].
	output << $(.
	self visitJsonElement: (aSelectorNode at: 'kind').
	self visitJsonElement: (aSelectorNode at: 'length').
	output << $)
]

{ #category : #'visiting expression' }
FASTFortranJsonExporterVisitor >> visitSignificand: aRealLiteralSignificandNode [

	output << (super visitSignificand: aRealLiteralSignificandNode)
]

{ #category : #visiting }
FASTFortranJsonExporterVisitor >> visitStar: aStarNode [

	output << $*
]

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitStopStatement: aStopStatementNode [

	"^self visitJsonMap: aStopStatementNode keys: #(span message)"

	output
		<< sixSpaces;
		<< 'stop'.
	(aStopStatementNode at: 'message') ifNotNil: [ :message | 
		output << ' '.
		self visitJsonElement: message ].
	output cr
]

{ #category : #'visiting expression' }
FASTFortranJsonExporterVisitor >> visitStringLiteralValue: aStringLiteralNode [

	output
		<< $';
		<< (super visitStringLiteralValue: aStringLiteralNode);
		<< $'
]

{ #category : #'visiting prog-unit' }
FASTFortranJsonExporterVisitor >> visitSubroutine: aSubroutineNode [

	"^self visitJsonMap: aSubroutineNode keys: #(span name arguments blocks)"

	output
		<< sixSpaces;
		<< 'subroutine ';
		<< (aSubroutineNode at: 'name').
	(aSubroutineNode at: 'arguments') ifNotNil: [ :parameters | 
		self visitFunctionParameters: parameters ].
	output cr.
	self visitJsonElement: (aSubroutineNode at: 'blocks').
	self endProgramUnit
]

{ #category : #'visiting expression' }
FASTFortranJsonExporterVisitor >> visitSubscript: aSubscriptNode [

	self visitJsonElement: (aSubscriptNode at: 'expression').
	output << $(.
	self visitJsonElement: (aSubscriptNode at: 'indices').
	output << $)
]

{ #category : #'visiting expression' }
FASTFortranJsonExporterVisitor >> visitSubtraction: aSubtractionOperatorNode [

	"Its possible to use #surroundedBy: to put a prefix and suffix around the operator"

	output << ' - '
]

{ #category : #'visiting expression' }
FASTFortranJsonExporterVisitor >> visitTrueLiteralValue: aString [

	output
		<< $.;
		<< ((super visitTrueLiteralValue: aString) first) asString;
		<< $.
]

{ #category : #visiting }
FASTFortranJsonExporterVisitor >> visitType: aTypeNode [

	self visitJsonMap: aTypeNode keys: #( span base_type selector )
]

{ #category : #'visiting expression' }
FASTFortranJsonExporterVisitor >> visitVariableName: aString [

	(self isEsopeTransformation: aString)
		ifFalse: [ output << aString ]
]

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitWriteFormat: aWriteFormatNode [
	output << $(.
	(aWriteFormatNode at: 'list')
		do: [ :each | self visitFormatArgument: each ]
		separatedBy: [ output << $, ].
	output << ') '
]

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitWriteStatement: aWriteStatementNode [

	output
		<< sixSpaces;
		<< 'write '.
	self visitWriteFormat: (aWriteStatementNode at: 'format').
	self visitList: (aWriteStatementNode at: 'arguments') separatedBy: $,.
	output cr
]
