Extension { #name : #FamixEsopeSegment }

{ #category : #'*FortranCamfortImporter' }
FamixEsopeSegment >> addLocalVariable: aVariable [

	self addAttribute: aVariable
]

{ #category : #'*FortranCamfortImporter' }
FamixEsopeSegment >> localVariableClass [

	^ FamixEsopeAttribute
]
