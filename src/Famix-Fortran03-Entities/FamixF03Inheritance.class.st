"
I an inheritance association

## Relations
======================

### Association source
| Relation | Origin | Opposite | Type | Comment |
|---|
| `subclass` | `FamixTInheritance` | `superInheritances` | `FamixTWithInheritances` | Subclass linked to in this relationship. from-side of the association|

### Association target
| Relation | Origin | Opposite | Type | Comment |
|---|
| `superclass` | `FamixTInheritance` | `subInheritances` | `FamixTWithInheritances` | Superclass linked to in this relationship. to-side of the association|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `next` | `FamixTAssociation` | `previous` | `FamixTAssociation` | Next association in an ordered collection of associations. Currently not supported by the Moose importer|
| `previous` | `FamixTAssociation` | `next` | `FamixTAssociation` | Previous association in an ordered collection of associations. Currently not supported by the Moose importer|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|

"
Class {
	#name : #FamixF03Inheritance,
	#superclass : #FamixF03Entity,
	#traits : 'FamixTInheritance',
	#classTraits : 'FamixTInheritance classTrait',
	#category : #'Famix-Fortran03-Entities-Entities'
}

{ #category : #meta }
FamixF03Inheritance class >> annotation [

	<FMClass: #Inheritance super: #FamixF03Entity>
	<package: #'Famix-Fortran03-Entities'>
	<generated>
	^ self
]
