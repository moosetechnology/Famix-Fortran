Class {
	#name : #IASTVarEsoSl,
	#superclass : #IASTVarEso,
	#category : #'FortranCamfortImporter-AST-IR'
}

{ #category : #'instance creation' }
IASTVarEsoSl class >> realName [
	^ 's__'
]

{ #category : #accessing }
IASTVarEsoSl >> accept: aVisitor [

	^ aVisitor visitIASTVarEsoSl: self
]
