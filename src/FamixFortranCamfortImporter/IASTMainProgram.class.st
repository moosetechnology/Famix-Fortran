Class {
	#name : #IASTMainProgram,
	#superclass : #IASTProgramUnit,
	#category : #'FamixFortranCamfortImporter-IR-AST'
}

{ #category : #accessing }
IASTMainProgram >> accept: aVisitor [

	^ aVisitor visitIASTMainProgram: self.
]
