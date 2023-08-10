Class {
	#name : #IASTIncludedFile,
	#superclass : #IASTProgramUnit,
	#category : #'FortranCamfortImporter-AST-IR'
}

{ #category : #visiting }
IASTIncludedFile >> accept: aVisitor [

	^ aVisitor visitIASTIncludedFile: self
]
