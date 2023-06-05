Class {
	#name : #IASTMainProgram,
	#superclass : #IASTProgramUnit,
	#category : #'FortranCamfortImporter-AST-IR'
}

{ #category : #accessing }
IASTMainProgram >> accept: aVisitor [

	^ aVisitor visitIASTMainProgram: self.
]
