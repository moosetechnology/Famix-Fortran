Class {
	#name : #IASTParameter,
	#superclass : #IASTEntityRef,
	#category : #'FortranCamfortImporter-AST-IR'
}

{ #category : #accessing }
IASTParameter >> accept: aVisitor [

	^ aVisitor visitIASTParameter: self.
]
