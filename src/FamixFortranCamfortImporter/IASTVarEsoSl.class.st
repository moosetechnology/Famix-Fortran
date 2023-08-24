Class {
	#name : #IASTVarEsoSl,
	#superclass : #IASTVarEso,
	#category : #'FamixFortranCamfortImporter-IR-AST'
}

{ #category : #'instance creation' }
IASTVarEsoSl class >> realName [
	^ 's__'
]

{ #category : #accessing }
IASTVarEsoSl >> accept: aVisitor [

	^ aVisitor visitIASTVarEsoSl: self
]
