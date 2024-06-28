Class {
	#name : #FamixFortranUDTGenerator,
	#superclass : #FamixBasicInfrastructureGenerator,
	#instVars : [
		'attribute',
		'type',
		'variable',
		'userDefinedType'
	],
	#category : #'Famix-FortranUDT-Generator'
}

{ #category : #accessing }
FamixFortranUDTGenerator class >> packageName [

	^ #'Famix-FortranUDT-Entities'
]

{ #category : #accessing }
FamixFortranUDTGenerator class >> prefix [

	^ #'FamixFortran'
]

{ #category : #accessing }
FamixFortranUDTGenerator class >> submetamodels [

	^ { FamixFortran77Generator }
]

{ #category : #definition }
FamixFortranUDTGenerator >> commentAttribute [
	^ '# Attribute
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
	
'
]

{ #category : #definition }
FamixFortranUDTGenerator >> defineClasses [

	super defineClasses.

	userDefinedType := self
		                   newAbstractClassNamed: #UserDefinedType
		                   comment: ''.
	attribute := self
		             newClassNamed: #Attribute
		             comment: self commentAttribute.

	type := self remoteEntity: #Type withPrefix: #FamixF77.
	variable := self remoteEntity: #Variable withPrefix: #FamixF77
]

{ #category : #definition }
FamixFortranUDTGenerator >> defineHierarchy [

	super defineHierarchy.

	attribute --|> #TAttribute.
	attribute --|> variable.

	userDefinedType --|> type.
	userDefinedType --|> #TWithAttributes.
]
