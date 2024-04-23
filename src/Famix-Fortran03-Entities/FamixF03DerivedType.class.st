"
Im a User-defined-type
```fortran
type [,attribute-list] :: name [(parameterized-declaration-list)]
  [parameterized-definition-statements]
  [private statement or sequence statement]
  [member-variables]
contains
  [type-bound-procedures]
end type
```
		

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `attributes` | `FamixTWithAttributes` | `parentType` | `FamixTAttribute` | List of attributes declared by this type.|
| `methods` | `FamixTWithMethods` | `parentType` | `FamixTMethod` | Methods declared by this type.|



"
Class {
	#name : #FamixF03DerivedType,
	#superclass : #FamixFortranUserDefinedType,
	#traits : 'FamixTWithAttributes + FamixTWithMethods',
	#classTraits : 'FamixTWithAttributes classTrait + FamixTWithMethods classTrait',
	#category : #'Famix-Fortran03-Entities-Entities'
}

{ #category : #meta }
FamixF03DerivedType class >> annotation [

	<FMClass: #DerivedType super: #FamixFortranUserDefinedType>
	<package: #'Famix-Fortran03-Entities'>
	<generated>
	^ self
]
