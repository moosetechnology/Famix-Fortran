Class {
	#name : #IASTToEsopeVisitor,
	#superclass : #IASTAbstractVisitor,
	#category : #'FortranCamfortImporter-Visitor'
}

{ #category : #visiting }
IASTToEsopeVisitor >> visitIASTEsopeSegCommand: aSegmentCommand [

	^ (self newEntity: FamixEsopeCommand)
		  sourceAnchor:
			  (self visitIndexedFileAnchor: aSegmentCommand sourceAnchor);
		  attributeAt: #entity put: aSegmentCommand;
		  name: aSegmentCommand esopeCommand;
		  yourself
]

{ #category : #visiting }
IASTToEsopeVisitor >> visitIASTEsopeSegment: aSegment [

	^ (self newEntity: FamixEsopeSegment)
		  sourceAnchor: (self visitIndexedFileAnchor: aSegment sourceAnchor);
		  name: aSegment entityName;
		  attributes:
			  (aSegment declarations collect: [ :attribute | 
					   attribute accept: self ]);
		  yourself
]

{ #category : #visiting }
IASTToEsopeVisitor >> visitIASTVarEsoAr: aVarEsoAr [

	self flag: #TODO.
	1halt.
]

{ #category : #visiting }
IASTToEsopeVisitor >> visitIASTVarEsoAt: aVarEsoAt [

	self flag: #TODO.
	1halt.
]

{ #category : #visiting }
IASTToEsopeVisitor >> visitIASTVarEsoSl: aVarEsoSl [

	self flag: #TODO.
	1halt.
]

{ #category : #visiting }
IASTToEsopeVisitor >> visitIASTVariable: aVariable [

	^ (self newEntity: FamixEsopeAttribute)
		  sourceAnchor:
			  (self visitIndexedFileAnchor: aVariable sourceAnchor);
		  name: aVariable entityName;
		  declaredType: (self visitIASTTypeRef: aVariable typeSpec);
		  yourself
]
