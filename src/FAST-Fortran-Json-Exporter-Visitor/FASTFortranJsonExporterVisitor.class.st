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

{ #category : #'visiting expression' }
FASTFortranJsonExporterVisitor >> visitAddition: anAdditionOperatorNode [
	output << '+'
]

{ #category : #'visiting prog-unit' }
FASTFortranJsonExporterVisitor >> visitArgument: anArgumentNode [
	"used for argument in subprogram calls and parameter in subprogram definition
	 So can take many different forms :-("
	1halt.
	^(anArgumentNode includesKey: 'tag')
		ifTrue: [ self visitJsonTaggedElement: anArgumentNode ]
		ifFalse: [ self visitJsonMap: anArgumentNode keys: #(span expr) ]
]

{ #category : #'visiting expression' }
FASTFortranJsonExporterVisitor >> visitAssign_expression: anAssignExpressionNode [
	output << self sixSpaces.
	self visitJsonElement: (anAssignExpressionNode at: 'target').
	output 	<< ' = '.
	self visitJsonElement: (anAssignExpressionNode at: 'expression').
	output cr.
]

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitAssign_expressionStatement: anAssignExpressionNode [
	"assign_expression and assign_expressionStatement are the same"
	self visitAssign_expression: anAssignExpressionNode

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
FASTFortranJsonExporterVisitor >> visitComment: aCommentNode [
	"Separates comments that are genuine fortran comments and the one that contain Esope commands"
	| content |
	content := aCommentNode at: 'comment'.

	(self isEsopeComment: content)
		ifTrue: [  self visitEsopeComment: aCommentNode ]
		ifFalse: [ self visitFortranComment: aCommentNode ]
	
]

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitContinueStatement: aContinueStatementNode [

	output
		<< self sixSpaces;
		<< 'continue';
		cr
]

{ #category : #'visiting expression' }
FASTFortranJsonExporterVisitor >> visitDivision: aDivisionOperatorNode [
	output << '/'
]

{ #category : #'visiting expression' }
FASTFortranJsonExporterVisitor >> visitEq: anEqualtoOperatorNode [
	output << '.eq.'
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

	self flag: #TODO.
	(aRealLiteralExponentNode at: 'num') = '0'
		ifTrue: [  ]
		ifFalse: [ 
			output
				<< (aRealLiteralExponentNode at: 'letter');
				<< (aRealLiteralExponentNode at: 'num') ]
]

{ #category : #'visiting expression' }
FASTFortranJsonExporterVisitor >> visitExponentiation: aExponentiationOperatorNode [
	output << '**'
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
FASTFortranJsonExporterVisitor >> visitFunctionWithBlocks: aFunctionNode [

	"^self visitJsonMap: aFunctionNode keys: #(span name type arguments blocks)"

	"result subprograms"

	output << self sixSpaces.

	self visitJsonElement: (aFunctionNode at: 'type').
	output
		<< 'function ';
		<< (aFunctionNode at: 'name');
		<< $(.
	self visitJsonElement: (aFunctionNode at: 'arguments').
	
	output << $); cr.
	
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

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitIf: anIfNode [
	"^self visitJsonMap: anIfNode keys: #(span label conditions blocks)"
	
	"self visitJsonElement: (anIfNode at: 'label')."
	output << self sixSpaces;<< 'if'.
	
	output << $( .
	self visitJsonElement: (anIfNode at: 'conditions').
	output << $).
	
	output << 'then'; cr.
	
	self visitJsonElement: (anIfNode at: 'blocks').
	
	output << self sixSpaces; << 'end if'; cr

	

]

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitIfCondition: anIfConditionNode [
	1halt.
	output << $(.
	self visitJsonElement: anIfConditionNode.
	output << $).
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
	output << (aString, ' ')

]

{ #category : #'visiting expression' }
FASTFortranJsonExporterVisitor >> visitIntegerLiteralValue: anIntegerLiteralValueNode [
	output << anIntegerLiteralValueNode first
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

	output << '*'
]

{ #category : #'visiting prog-unit' }
FASTFortranJsonExporterVisitor >> visitProgramFile: aProgramFileNode [
	self visitJsonMap: aProgramFileNode keys: #(meta program_units).
	^ output contents
]

{ #category : #'visiting expression' }
FASTFortranJsonExporterVisitor >> visitReal: aRealNode [
	"to be more explicit, Real nodes are 'transformed' in RealLiteralValue nodes"
	self visitRealLiteralValue: (aRealNode at: 'contents')
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
	(aSubroutineNode at: 'arguments')
		ifNotNil: [ 
		output << $(.
		self visitJsonElement: (aSubroutineNode at: 'arguments').
		output << $); cr ]
		ifNil: [  ].

	output cr.

	self visitJsonElement: (aSubroutineNode at: 'blocks').
	self endProgramUnit
]

{ #category : #'visiting expression' }
FASTFortranJsonExporterVisitor >> visitSubtraction: aSubtractionOperatorNode [
	output << '-'
]

{ #category : #'visiting expression' }
FASTFortranJsonExporterVisitor >> visitValue: aValueNode [
	self visitJsonTaggedElement: (aValueNode at: 'value')
]

{ #category : #'visiting expression' }
FASTFortranJsonExporterVisitor >> visitVariable: aVariableNode [
	self visitVariableName: (aVariableNode at: 'contents')
]

{ #category : #'visiting expression' }
FASTFortranJsonExporterVisitor >> visitVariableName: aString [
	output << aString
]

{ #category : #'visiting statement' }
FASTFortranJsonExporterVisitor >> visitWriteFormat: aWriteFormatNode [
	1halt.
	"^{ self visitSpan: (aWriteFormatNode at: 'span') .
	  (aWriteFormatNode at: 'list')
		collect: [ :each | self visitFormatArgument: each ] }"
]
