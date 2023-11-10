Class {
	#name : #FamixFortran03Generator,
	#superclass : #FamixBasicInfrastructureGenerator,
	#instVars : [
		'attribute',
		'derivedType',
		'userDefinedType',
		'indexedFileAnchor',
		'inheritance',
		'method',
		'module',
		'programUnit',
		'parameter',
		'tHasIntent',
		'use'
	],
	#category : #'Famix-Fortran03-Generator'
}

{ #category : #accessing }
FamixFortran03Generator class >> packageName [

	^ #'Famix-Fortran03-Entities'
]

{ #category : #accessing }
FamixFortran03Generator class >> prefix [

	^ #'FamixF03'
]

{ #category : #accessing }
FamixFortran03Generator class >> submetamodels [

	^ {
		  FamixFortran77Generator.
		  FamixFortranUDTGenerator }
]

{ #category : #definition }
FamixFortran03Generator >> defineClasses [

	super defineClasses.

	attribute := self remoteEntity: #Attribute withPrefix: #FamixFortran.

	derivedType := builder
		               newClassNamed: #DerivedType
		               comment: self derivedTypeComment.

	indexedFileAnchor := self
		                     remoteEntity: #IndexedFileAnchor
		                     withPrefix: #FamixF77.

	inheritance := builder
		               newClassNamed: #Inheritance
		               comment: 'I an inheritance association'.

	method := builder
		          newClassNamed: #Method
		          comment:
		          'I am a type-bound-procedure in a user-defined-type'.

	module := builder newClassNamed: #Module comment: self moduleComment.

	parameter := self remoteEntity: #Parameter withPrefix: #FamixF77.

	programUnit := self remoteEntity: #ProgramUnit withPrefix: #FamixF77.

	use := builder
		       newClassNamed: #Use
		       comment:
		       'Thanks to me, you can import a procedures, variables, constants,... defined in a module. Im an association between a program unit and a module'.

	userDefinedType := self
		                   remoteEntity: #UserDefinedType
		                   withPrefix: #FamixFortran
]

{ #category : #definition }
FamixFortran03Generator >> defineHierarchy [

	super defineHierarchy.

	attribute --|> #TCanBeFinal.
	attribute --|> #THasVisibility.

	derivedType --|> userDefinedType.
	derivedType --|> #TWithAttributes.
	derivedType --|> #TWithMethods.

	indexedFileAnchor --|> sourceAnchor.
	indexedFileAnchor --|> #TFileNavigation.

	inheritance --|> #TInheritance.

	method --|> #TMethod.

	module --|> programUnit.
	module --|> #TWithTypes.
	
	parameter --|> tHasIntent.

	use --|> #TAssociation
]

{ #category : #definition }
FamixFortran03Generator >> defineProperties [

	super defineProperties.

	(tHasIntent property: #intent type: #String) comment:
		'intent of the entity (work only for dummy argument)'

]

{ #category : #definition }
FamixFortran03Generator >> defineRelations [

	super defineRelations.

	((use property: #used)
		 comment: 'Module used';
		 target)
	*- ((module property: #users) comment: 'All users of this module').

	((use property: #usedBy)
		 comment: 'used by this program unit';
		 source) *- ((programUnit property: #uses) comment:
		 'All uses made by this programUnits')
]

{ #category : #definition }
FamixFortran03Generator >> defineTraits [

	super defineTraits.

	tHasIntent := builder
		              newTraitNamed: #THasIntent
		              comment:
		              'Dummy parameter can express his intent amongs: in, out, inout'
]

{ #category : #definition }
FamixFortran03Generator >> derivedTypeComment [

	^ 'Im a User-defined-type
```fortran
type [,attribute-list] :: name [(parameterized-declaration-list)]
  [parameterized-definition-statements]
  [private statement or sequence statement]
  [member-variables]
contains
  [type-bound-procedures]
end type
```
		'
]

{ #category : #definition }
FamixFortran03Generator >> moduleComment [

	^ 'Fortran modules contain definitions that are made accessible to programs, procedures, and other modules through the use statement. They can contain data objects, type definitions, procedures, and interfaces.

    Modules allow controlled scoping extension whereby entity access is made explicit

    Modules automatically generate explicit interfaces required for modern procedures

    It is recommended to always place functions and subroutines within modules.

### Example:

```fortran
module my_mod
  implicit none

  private  ! All entities are now module-private by default
  public public_var, print_matrix  ! Explicitly export public entities

  real, parameter :: public_var = 2
  integer :: private_var

contains

  ! Print matrix A to screen
  subroutine print_matrix(A)
    real, intent(in) :: A(:,:)  ! An assumed-shape dummy argument

    integer :: i

    do i = 1, size(A,1)
      print *, A(i,:)
    end do

  end subroutine print_matrix

end module my_mod
```
'
]
