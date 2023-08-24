Class {
	#name : #IASTVarEsoAr,
	#superclass : #IASTVarEso,
	#category : #'FamixFortranCamfortImporter-IR-AST'
}

{ #category : #'instance creation' }
IASTVarEsoAr class >> realName [
	^ ''
]

{ #category : #accessing }
IASTVarEsoAr >> accept: aVisitor [

	^ aVisitor visitIASTVarEsoAr: self
]
