Class {
	#name : #IASTEsopePointer,
	#superclass : #IASTEntityRef,
	#category : #'FamixFortranCamfortImporter-IR-AST'
}

{ #category : #visiting }
IASTEsopePointer >> accept: aVisitor [

	^ aVisitor visitIASTEsopePointer: self
]
