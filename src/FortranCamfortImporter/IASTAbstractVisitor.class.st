Class {
	#name : #IASTAbstractVisitor,
	#superclass : #Object,
	#instVars : [
		'model'
	],
	#category : #'FortranCamfortImporter-Visitor'
}

{ #category : #accessing }
IASTAbstractVisitor >> model [

	^ model
]

{ #category : #accessing }
IASTAbstractVisitor >> model: anObject [

	model := anObject
]

{ #category : #'private-creation' }
IASTAbstractVisitor >> newEntity: aClass [
	^aClass new
		  mooseModel: model;
		  yourself
]

{ #category : #visiting }
IASTAbstractVisitor >> spawn: aVisitorClass [
	^aVisitorClass new
		model: self model ;
		yourself
]

{ #category : #visiting }
IASTAbstractVisitor >> visitIASTTypeRef: aType [

	self flag: #TODO. "How to deal with length and kind for example character*20 name produce aType object like:
	- sourceAnchor: ...
	- entityName: TypeCharacter
	- kind: nil"
	^(self newEntity: FamixFortran77Type)
		sourceAnchor: (self visitIndexedFileAnchor: aType sourceAnchor);
		name: aType entityName;
		length: aType length;
		kind: aType kind;
		yourself
]

{ #category : #visiting }
IASTAbstractVisitor >> visitIASTVariable: aVariable [

	| var |
	var := (self newEntity: FamixEsopeAttribute)
		       sourceAnchor: (self visitIndexedFileAnchor: aVariable sourceAnchor);
		       name: aVariable entityName;
				 declaredType: (self visitIASTTypeRef: aVariable typeSpec);
		       yourself.
	^ var
]

{ #category : #visiting }
IASTAbstractVisitor >> visitIndexedFileAnchor: aSourceAnchor [
	^aSourceAnchor
	ifNil: [ nil ]
	ifNotNil: [	(self newEntity: FamixFortran77IndexedFileAnchor)
		  startLine: aSourceAnchor startLine ;
		  endLine: aSourceAnchor endLine ;
		  startColumn: aSourceAnchor startColumn ;
		  endColumn: aSourceAnchor endColumn ;
		  fileName: aSourceAnchor fileName ;
		  yourself ]
]
