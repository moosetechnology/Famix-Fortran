Class {
	#name : #IASTVarEsoAr,
	#superclass : #IASTVarEso,
	#category : #'FortranCamfortImporter-AST-IR'
}

{ #category : #accessing }
IASTVarEsoAr >> accept: aVisitor [

	^ aVisitor visitIASTVarEsoAr: self
]
