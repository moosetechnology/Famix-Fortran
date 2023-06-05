Class {
	#name : #IASTVarEsoAt,
	#superclass : #IASTVarEso,
	#category : #'FortranCamfortImporter-AST-IR'
}

{ #category : #accessing }
IASTVarEsoAt >> accept: aVisitor [

	^ aVisitor visitIASTVarEsoAt: self
]
