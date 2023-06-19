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
		<< self sixSpaces;
		<< 'end';
		cr
]

{ #category : #initialization }
FASTFortranJsonExporterVisitor >> initialize [

	super initialize.
	output := String new writeStream
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
FASTFortranJsonExporterVisitor >> unmarkAsEsope: anEsopeCommentNode [
	output
		<< sixSpaces ;
		<< ((anEsopeCommentNode at: 'comment') allButFirst: 5) ;
		cr
]

{ #category : #'visiting expression' }
FASTFortranJsonExporterVisitor >> visitAddition: anAdditionOperatorNode [

	output << ' + '
]

{ #category : #'visiting prog-unit' }
FASTFortranJsonExporterVisitor >> visitArguments: anArgumentList [
	anArgumentList ifNotNil: [
		(anArgumentList at: 'list')
			do: [ :param | self visitJsonElement: param ]
			separatedBy: [ output << $, ]
	]

]

{ #category : #'visiting expression' }
FASTFortranJsonExporterVisitor >> visitAssign_expression: anAssignExpressionNode [
	"output << self sixSpaces."
	self visitJsonElement: (anAssignExpressionNode at: 'target').
	output 	<< ' = '.
	self visitJsonElement: (anAssignExpressionNode at: 'expression').
	"output cr."
]

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitAssign_expressionStatement: anAssignExpressionNode [
	"assign_expression and assign_expressionStatement are the same"
	output << self sixSpaces.
	self visitAssign_expression: anAssignExpressionNode.
	output cr.
]

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitBase_type: aString [
	"to offer the possibility to handle each baseType differently, we create #visitXYZBaseType: methods"

	self visitJsonNode: (aString , 'BaseType') value: aString

]

{ #category : #'visiting expression' }
FASTFortranJsonExporterVisitor >> visitBinary: aBinaryExpressionNode [
	"^self visitJsonMap: aBinaryExpressionNode keys: #( span left op right)"
	self visitJsonElement: (aBinaryExpressionNode at: 'left').
	self visitJsonElement: (aBinaryExpressionNode at: 'op').
	self visitJsonElement: (aBinaryExpressionNode at: 'right').
]

{ #category : #'visiting prog-unit' }
FASTFortranJsonExporterVisitor >> visitBlock_data: aBlockDataNode [

	output
		<< self sixSpaces;
		<< 'block data ';
		<< (aBlockDataNode at: 'name');
		cr.

	self visitJsonElement: (aBlockDataNode at: 'blocks').

	self endProgramUnit
]

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitCallStatement: aCallStatementNode [

	"^self visitJsonMap: aCallStatementNode keys: #(span function arguments)"
	output << self sixSpaces; << 'call '.
	self visitJsonElement: (aCallStatementNode at: 'function').
	output << $(.
	self visitJsonElement: (aCallStatementNode at:'arguments').
	output << $) ; cr.
]

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitCharacterBaseType: aString [

	output << ((super visitCharacterBaseType: aString) , ' ')
]

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitComment: aCommentNode [
	"Separates comments that are genuine fortran comments and the one that contain Esope commands"
	| content |
	content := aCommentNode at: 'comment'.

	(self isEsopeComment: content)
		ifTrue: [  self visitEsopeComment: aCommentNode ]
		ifFalse: [ self visitFortranComment: aCommentNode ]
	
]

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitCommonStatement: aCommonStatementNode [

	"^self visitJsonMap: aCommonStatementNode keys: #(span common_groups)"

	output
		<< self sixSpaces;
		<< 'common '.
	self visitJsonElement: (aCommonStatementNode at: 'common_groups').
	output cr
]

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitConditions: aConditionList [

	| ifPart |
	ifPart := aConditionList first.

	output
		<< self sixSpaces;
		<< 'if '.
	self visitIfCondition: ifPart first.
	output
		<< ' then';
		cr.
	self visitThenPart: ifPart second.

	aConditionList allButFirst do: [ :aCondition | 
		output
			<< self sixSpaces;
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
		<< self sixSpaces;
		<< 'continue';
		cr
]

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitDeclarationStatement: aDeclarationStatementNode [

	"^self visitJsonMap: aDeclarationStatementNode keys: #(span type attributes declarators)"
	output << self sixSpaces.
	self visitJsonElement: (aDeclarationStatementNode at: 'type').
	self visitAttributes: (aDeclarationStatementNode at: 'attributes').
	self visitDeclarators: (aDeclarationStatementNode at: 'declarators').
	output cr.

	
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
	self visitJsonElement: (aDeclaratorNode at: 'variable')

]

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitDeclarators: aDeclaratorsList [

	aDeclaratorsList ifNotNil: [
		(aDeclaratorsList at: 'list')
			do: [ :decl | self visitDeclarator: decl ]
			separatedBy: [ output << $, ]
	]
]

{ #category : #'visiting expression' }
FASTFortranJsonExporterVisitor >> visitDivision: aDivisionOperatorNode [

	output << ' / '
]

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitDo: aDoNode [

	"^self visitJsonMap: aDoNode keys: #(span do_spec body)"

	output
		<< self sixSpaces;
		<< 'do '.
	"self visitJsonElement: (aDoNode at: 'do_spec')."
	self visitDo_spec: (aDoNode at: 'do_spec').
	self visitJsonElement: (aDoNode at: 'body').
	output
		<< self sixSpaces;
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
		<< ' .';
		<< (super visitEq: anEqualtoOperatorNode);
		<< '. '
]

{ #category : #'visiting esope' }
FASTFortranJsonExporterVisitor >> visitEsopeEndsegmentComment: anEsopeCommentNode [

	self unmarkAsEsope: anEsopeCommentNode
]

{ #category : #'visiting esope' }
FASTFortranJsonExporterVisitor >> visitEsopePointeurComment: anEsopeCommentNode [

	self unmarkAsEsope: anEsopeCommentNode
]

{ #category : #'visiting esope' }
FASTFortranJsonExporterVisitor >> visitEsopeSegactComment: anEsopeCommentNode [

	self unmarkAsEsope: anEsopeCommentNode
]

{ #category : #'visiting esope' }
FASTFortranJsonExporterVisitor >> visitEsopeSegadjComment: anEsopeCommentNode [

	self unmarkAsEsope: anEsopeCommentNode
]

{ #category : #'visiting esope' }
FASTFortranJsonExporterVisitor >> visitEsopeSegdesComment: anEsopeCommentNode [

	self unmarkAsEsope: anEsopeCommentNode
]

{ #category : #'visiting esope' }
FASTFortranJsonExporterVisitor >> visitEsopeSeginiComment: anEsopeCommentNode [

	self unmarkAsEsope: anEsopeCommentNode
]

{ #category : #'visiting esope' }
FASTFortranJsonExporterVisitor >> visitEsopeSegmentComment: anEsopeCommentNode [

	self unmarkAsEsope: anEsopeCommentNode
]

{ #category : #'visiting esope' }
FASTFortranJsonExporterVisitor >> visitEsopeSegsupComment: anEsopeCommentNode [

	self unmarkAsEsope: anEsopeCommentNode
]

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitExitStatement: anExitNode [

	"^self visitJsonMap: anExitNode keys: #(span var)"

	output << self sixSpaces << 'exit'.
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
	output << self sixSpaces; << 'external '.
	self visitJsonElement: (anExternalStatementNode at: 'vars').
	output cr
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
	output << $(.
	aParameterList ifNotNil: [
		(aParameterList at: 'list')
			do: [ :param | self visitJsonElement: param ]
			separatedBy: [ output << $, ]
	].
	output << $).

]

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitFunctionStatement: aFunctionStatementNode [
	"'name' is an object, not a string so, cannot call #visitName: on it"
	"^{ self visitSpan: (aFunctionStatementNode at: 'span') .
	 self visitJsonElement: (aFunctionStatementNode at: 'name') }
	,
	(self visitJsonMap: aFunctionStatementNode keys:  #(arguments body))."

	output << self sixSpaces.
	self visitJsonElement: (aFunctionStatementNode at: 'name').
	self visitFunctionParameters: (aFunctionStatementNode at: 'arguments').
	output << ' = '.
	self visitJsonElement: (aFunctionStatementNode at: 'body').
	output cr.
]

{ #category : #'visiting prog-unit' }
FASTFortranJsonExporterVisitor >> visitFunctionWithBlocks: aFunctionNode [

	"^self visitJsonMap: aFunctionNode keys: #(span name type arguments blocks)"
	output << self sixSpaces.
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
FASTFortranJsonExporterVisitor >> visitGotoStatement: aGotoStatementNode [

	"^self visitJsonMap: aGotoStatementNode keys: #(span target)"

	output << self sixSpaces << 'goto'.
	(aGotoStatementNode at: 'target') ifNotNil: [ 
		output << ' '.
		self visitJsonElement: (aGotoStatementNode at: 'target') ].
	output cr
]

{ #category : #'visiting expression' }
FASTFortranJsonExporterVisitor >> visitGt: aGreaterthanOperatorNode [

	output
		<< ' .';
		<< (super visitGt: aGreaterthanOperatorNode);
		<< '. '
]

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitIf: anIfNode [

	"^self visitJsonMap: anIfNode keys: #(span label conditions blocks)"

	"self visitJsonElement: (anIfNode at: 'label')."

	"self visitJsonElement: (anIfNode at: 'conditions')."
	self visitConditions: (anIfNode at: 'conditions').
	
	(anIfNode at: 'blocks') ifNotNil: [ :elsePart | 
		(output << self sixSpaces)
			<< 'else';
			cr.
		self visitJsonElement: elsePart ].

	output
		<< self sixSpaces;
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
FASTFortranJsonExporterVisitor >> visitImplicitStatement: anImplicitStatementNode [

	"^self visitJsonMap: anImplicitStatementNode keys:  #(span items)"
	output
		<< self sixSpaces;
		<< 'implicit '.
	(anImplicitStatementNode at: 'items')
		ifNil: [ output << 'none' ]
		ifNotNil: [ 
		self visitJsonElement: (anImplicitStatementNode at: 'items') ].
	output cr
]

{ #category : #'visiting expression' }
FASTFortranJsonExporterVisitor >> visitInteger: anIntegerNode [
	"to be more explicit, Integer nodes are 'transformed' in IntegerLiteralValue nodes"
	self visitIntegerLiteralValue: (anIntegerNode at: 'contents')
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
FASTFortranJsonExporterVisitor >> visitLogicalBaseType: aString [

	output << ((super visitLogicalBaseType: aString) , ' ')
]

{ #category : #'visiting expression' }
FASTFortranJsonExporterVisitor >> visitLt: anLessthanOperatorNode [

	output
		<< ' .';
		<< (super visitLt: anLessthanOperatorNode);
		<< '. '
]

{ #category : #'visiting prog-unit' }
FASTFortranJsonExporterVisitor >> visitMain: aMainProgramNode [

	output
		<< self sixSpaces;
		<< 'program ';
		<< (aMainProgramNode at: 'name');
		cr.

	self visitJsonElement: (aMainProgramNode at: 'blocks').
	self visitJsonElement: (aMainProgramNode at: 'subprograms').
	self endProgramUnit
]

{ #category : #'visiting prog-unit' }
FASTFortranJsonExporterVisitor >> visitMeta: aMetaNode [
	^nil
]

{ #category : #'visiting expression' }
FASTFortranJsonExporterVisitor >> visitMultiplication: aMultiplicationOperatorNode [

	output << ' * '
]

{ #category : #'visiting prog-unit' }
FASTFortranJsonExporterVisitor >> visitProgramFile: aProgramFileNode [
	"^self visitJsonMap: aProgramFileNode keys: #(meta program_units)".
	"self visitJsonElement: (aProgramFileNode at: 'meta')."
	self visitJsonElement: (aProgramFileNode at: 'program_units').
	^ output contents
]

{ #category : #'visiting expression' }
FASTFortranJsonExporterVisitor >> visitReal: aRealNode [
	"to be more explicit, Real nodes are 'transformed' in RealLiteralValue nodes"
	self visitRealLiteralValue: (aRealNode at: 'contents')
]

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitRealBaseType: aString [

	output << ((super visitRealBaseType: aString) , ' ')
]

{ #category : #'visiting expression' }
FASTFortranJsonExporterVisitor >> visitRealLiteralValue: aRealLiteralValueNode [
	self visitJsonMap: aRealLiteralValueNode first keys: #(significand exponent)
]

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitReturnStatement: aReturnStatementNode [

	"^self visitJsonMap: aReturnStatementNode keys: #(span target)"

	output << self sixSpaces << 'return'.
	(aReturnStatementNode at: 'target') ifNotNil: [ 
		output << ' '.
		self visitJsonElement: (aReturnStatementNode at: 'target') ].
	output cr
]

{ #category : #'visiting expression' }
FASTFortranJsonExporterVisitor >> visitSignificand: aRealLiteralSignificandNode [
	output << aRealLiteralSignificandNode
]

{ #category : #visiting }
FASTFortranJsonExporterVisitor >> visitStar: aStarNode [
	output << $*
]

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitStopStatement: aStopStatementNode [

	"^self visitJsonMap: aStopStatementNode keys: #(span message)"

	output << self sixSpaces << 'stop'.
	(aStopStatementNode at: 'message') ifNotNil: [ 
		output << ' '.
		self visitJsonElement: (aStopStatementNode at: 'message') ].
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
		<< self sixSpaces;
		<< 'subroutine ';
		<< (aSubroutineNode at: 'name').
	self visitFunctionParameters: (aSubroutineNode at: 'arguments').
	output cr.
	self visitJsonElement: (aSubroutineNode at: 'blocks').
	self endProgramUnit
]

{ #category : #'visiting expression' }
FASTFortranJsonExporterVisitor >> visitSubtraction: aSubtractionOperatorNode [

	"Its possible to use #surroundedBy: to put a prefix and suffix around the operator"

	output << ' - '
]

{ #category : #visiting }
FASTFortranJsonExporterVisitor >> visitType: aTypeNode [

	"^self visitJsonMap: aTypeNode keys: #(span base_type selector)"
	self visitJsonElement: (aTypeNode at: 'base_type').
	self visitJsonElement: (aTypeNode at: 'selector').
]

{ #category : #'visiting expression' }
FASTFortranJsonExporterVisitor >> visitVariableName: aString [
	output << aString
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
		<< sixSpaces ;
		<< 'write '.
	self visitWriteFormat: (aWriteStatementNode at: 'format') .
	self visitArguments: (aWriteStatementNode at: 'arguments').
	output cr
]
