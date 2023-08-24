Class {
	#name : #IASTBlockData,
	#superclass : #IASTProgramUnit,
	#category : #'FamixFortranCamfortImporter-IR-AST'
}

{ #category : #accessing }
IASTBlockData >> accept: aVisitor [

	^ aVisitor visitIASTBlockData: self.
]
