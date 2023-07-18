Class {
	#name : #IASTEsopePointer,
	#superclass : #IASTEntityRef,
	#category : #'FortranCamfortImporter-AST-IR'
}

{ #category : #visiting }
IASTEsopePointer >> accept: aVisitor [

	^ aVisitor visitIASTEsopePointer: self
]
