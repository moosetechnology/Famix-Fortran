Class {
	#name : #IASTParameter,
	#superclass : #IASTEntityRef,
	#category : #'FamixFortranCamfortImporter-IR-AST'
}

{ #category : #accessing }
IASTParameter >> accept: aVisitor [

	^ aVisitor visitIASTParameter: self.
]
