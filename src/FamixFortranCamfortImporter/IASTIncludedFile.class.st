Class {
	#name : #IASTIncludedFile,
	#superclass : #IASTProgramUnit,
	#category : #'FamixFortranCamfortImporter-IR-AST'
}

{ #category : #visiting }
IASTIncludedFile >> accept: aVisitor [

	^ aVisitor visitIASTIncludedFile: self
]
