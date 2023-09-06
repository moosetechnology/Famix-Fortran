"
```st
model := FamixF03Model new name: 'F03model'.

int := FamixF77TypeIntrinsic new name: 'integer'; mooseModel: model; yourself.
real := FamixF77TypeIntrinsic new name: 'real'; mooseModel: model; yourself.
void := FamixF77TypeIntrinsic new name: 'void'; mooseModel: model; yourself.

p1 := FamixF77Parameter new name: 'p1'; mooseModel: model; declaredType: int; yourself.
p2 := FamixF77Parameter new name: 'p2'; mooseModel: model; declaredType: real; yourself.

v1 := FamixF77Variable new name: 'v1'; declaredType: int; mooseModel: model; yourself.
v2 := FamixF77Variable new name: 'v2'; declaredType: real; mooseModel: model; yourself.


fct := FamixF77PUFunction new 
			name: 'fct';
			mooseModel: model;
			parameters: { p1. p2 };
			declaredType: int;
			localVariables: { v1 . v2 };
			yourself.

a1 := FamixFortranAttribute new name: 'x'; declaredType: real; mooseModel: model; yourself.
a2 := FamixFortranAttribute new name: 'y'; declaredType: real; mooseModel: model; yourself.

m1 := FamixF03Method new name: 'print'; declaredType: void; parameters: { }; mooseModel: model; yourself.

udt := FamixF03DerivedType new name: 'point'; attributes: { a1 . a2 };  mooseModel: model; yourself.

udt addMethod: m1.

fct addType: udt.

pf := FamixF77ProgramFile new name: 'demo.f'; programUnits: {fct}; mooseModel: model; yourself.

```
"
Class {
	#name : #FamixFortran03Test,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'famixProgFile'
	],
	#category : #'Famix-Fortran03-Tests'
}

{ #category : #running }
FamixFortran03Test >> setUp [

	super setUp.

	"Put here a common initialization logic for tests"
	model := FamixF03Model new name: 'F03model'.
	famixProgFile := FamixF77ProgramFile new
		                 mooseModel: model;
		                 name: 'demo.f90';
		                 filename: 'demo.f90';
		                 yourself
]

{ #category : #tests }
FamixFortran03Test >> testModule [

	| module |
	module := FamixF03Module new
		          name: 'point_mod';
		          mooseModel: model;
		          programFile: famixProgFile;
		          yourself.
		
	self assert: famixProgFile programUnits size equals: 1.
	self assert: famixProgFile programUnits first class equals: FamixF03Module.
	self assert: famixProgFile programUnits first equals: module.
	self assert: famixProgFile programUnits first name equals: 'point_mod'.
	

	
]
