"
Its the sourceAnchor (position of the token) in the source file (startLine@startColumn)-(endLine@endColumn).
"
Class {
	#name : #FamixF77IndexedFileAnchor,
	#superclass : #FamixF77SourceAnchor,
	#traits : 'FamixTFileNavigation',
	#classTraits : 'FamixTFileNavigation classTrait',
	#category : #'Famix-Fortran77-Entities-Entities'
}

{ #category : #meta }
FamixF77IndexedFileAnchor class >> annotation [

	<FMClass: #IndexedFileAnchor super: #FamixF77SourceAnchor>
	<package: #'Famix-Fortran77-Entities'>
	<generated>
	^ self
]
