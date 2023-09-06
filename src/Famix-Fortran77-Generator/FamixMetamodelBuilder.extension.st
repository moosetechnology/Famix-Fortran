Extension { #name : #FamixMetamodelBuilder }

{ #category : #'*Famix-Fortran77-Generator' }
FamixMetamodelBuilder >> newAbstractClassNamed: aClassName comment: aString [

	^ (self newAbstractClassNamed: aClassName)
		  comment: aString;
		  yourself
]
