Class {
	#name : #IASTVarEsoSl,
	#superclass : #IASTVarEso,
	#category : #'FortranCamfortImporter-AST-IR'
}

{ #category : #accessing }
IASTVarEsoSl >> accept: aVisitor [

	^ aVisitor visitIASTVarEsoSl: self
]
