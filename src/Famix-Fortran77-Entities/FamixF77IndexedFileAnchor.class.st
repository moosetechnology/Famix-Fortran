"
Its the sourceAnchor (position of the token) in the source file (startLine@startColumn)-(endLine@endColumn).

## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `correspondingFile` | `FamixTFile` | nil | File associated to this source anchor|
| `encoding` | `String` | nil | A string representing the encoding of a file|
| `endColumn` | `Number` | nil | Number of the end column|
| `endLine` | `Number` | nil | Number of the end line|
| `fileName` | `String` | nil | Name of the source file|
| `startColumn` | `Number` | nil | Number of the start column|
| `startLine` | `Number` | nil | Number of the start line|

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
