Class {
	#name : #IASTBlockData,
	#superclass : #IASTProgramUnit,
	#category : #'FortranCamfortImporter-AST-IR'
}

{ #category : #accessing }
IASTBlockData >> accept: aVisitor [

	^ aVisitor visitIASTBlockData: self.
]
