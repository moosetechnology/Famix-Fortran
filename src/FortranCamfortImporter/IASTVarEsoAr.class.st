Class {
	#name : #IASTVarEsoAr,
	#superclass : #IASTVarEso,
	#category : #'FortranCamfortImporter-AST-IR'
}

{ #category : #'instance creation' }
IASTVarEsoAr class >> realName [
	^ ''
]

{ #category : #accessing }
IASTVarEsoAr >> accept: aVisitor [

	^ aVisitor visitIASTVarEsoAr: self
]
