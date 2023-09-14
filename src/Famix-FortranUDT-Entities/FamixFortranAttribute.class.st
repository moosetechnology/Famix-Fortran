"
# Attribute
Im a attribute for user defined type:
	- Segment component
	- Derived type component

A `segment` or DerivedType entity is a grouping of Fortran variables defined by the programmer.
This such of variable called `attribute`

In the follow example:
```fortran77
c        1         2         3         4         5         6         7
c23456789012345678901234567890123456789012345678901234567890123456789012
c     a example of segment definition
      segment myseg
            integer scalar, array(size), matrix(row, col)
            real x, xx(n)
            real*8 Y, YY(3, MM)
            character*nbca icha(8, ik), chai 
      end segment
```
the segment `myseg` have the following attributes: `scalar`, `array`, `matrix`, `x`, `xx`, `Y`,  `YY`,  `icha`, `chai`, 
	

"
Class {
	#name : #FamixFortranAttribute,
	#superclass : #FamixF77Variable,
	#traits : 'FamixTAttribute',
	#classTraits : 'FamixTAttribute classTrait',
	#instVars : [
		'#userDefinedType => FMOne type: #FamixFortranUserDefinedType opposite: #attributes'
	],
	#category : #'Famix-FortranUDT-Entities-Entities'
}

{ #category : #meta }
FamixFortranAttribute class >> annotation [

	<FMClass: #Attribute super: #FamixF77Variable>
	<package: #'Famix-FortranUDT-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixFortranAttribute >> userDefinedType [
	"Relation named: #userDefinedType type: #FamixFortranUserDefinedType opposite: #attributes"

	<generated>
	<container>
	^ userDefinedType
]

{ #category : #accessing }
FamixFortranAttribute >> userDefinedType: anObject [

	<generated>
	userDefinedType := anObject
]

{ #category : #navigation }
FamixFortranAttribute >> userDefinedTypeGroup [
	<generated>
	<navigation: 'UserDefinedType'>
	^ MooseSpecializedGroup with: self userDefinedType
]
