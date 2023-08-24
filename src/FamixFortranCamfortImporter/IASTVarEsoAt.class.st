Class {
	#name : #IASTVarEsoAt,
	#superclass : #IASTVarEso,
	#category : #'FamixFortranCamfortImporter-IR-AST'
}

{ #category : #'instance creation' }
IASTVarEsoAt class >> realName [
	^ 'd__'
]

{ #category : #accessing }
IASTVarEsoAt >> accept: aVisitor [

	^ aVisitor visitIASTVarEsoAt: self
]
