"
Fortran modules contain definitions that are made accessible to programs, procedures, and other modules through the use statement. They can contain data objects, type definitions, procedures, and interfaces.

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

"
Class {
	#name : #FamixF03Module,
	#superclass : #FamixF77ProgramUnit,
	#instVars : [
		'#users => FMMany type: #FamixF03Use opposite: #used'
	],
	#category : #'Famix-Fortran03-Entities-Entities'
}

{ #category : #meta }
FamixF03Module class >> annotation [

	<FMClass: #Module super: #FamixF77ProgramUnit>
	<package: #'Famix-Fortran03-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FamixF03Module >> addUser: anObject [
	<generated>
	^ self users add: anObject
]

{ #category : #accessing }
FamixF03Module >> users [
	"Relation named: #users type: #FamixF03Use opposite: #used"

	<generated>
	<FMComment: 'All users of this module'>
	<derived>
	^ users
]

{ #category : #accessing }
FamixF03Module >> users: anObject [

	<generated>
	users value: anObject
]
