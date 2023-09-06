Class {
	#name : #BaselineOfFamixFortran,
	#superclass : #BaselineOf,
	#category : #BaselineOfFamixFortran
}

{ #category : #baselines }
BaselineOfFamixFortran >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec blessing: #baseline.
		spec description: 'Famix Fortran'.
		self defineDependencies: spec.
		self definePackages: spec ]
]

{ #category : #baselines }
BaselineOfFamixFortran >> defineDependencies: spec [

	spec
		baseline: 'Famix'
		with: [ spec repository: 'github://moosetechnology/Famix:development/src' ]
]

{ #category : #baselines }
BaselineOfFamixFortran >> definePackages: spec [

	spec
		package: 'Famix-Fortran77-Entities' with: [ spec requires: #( Famix ) ];
		package: 'Famix-Fortran77-Generator' with: [ spec requires: #( Famix ) ];
		package: 'Famix-Fortran77-Tests' with: [ spec requires: #( Famix ) ];
		package: 'Famix-FortranUDT-Generator' with: [ spec requires: #( Famix ) ];
		package: 'Famix-FortranUDT-Entities' with: [ spec requires: #( Famix ) ];
		package: 'Famix-Fortran03-Entities' with: [ spec requires: #( Famix 'Famix-FortranUDT-Entities') ];
		package: 'Famix-Fortran03-Generator' with: [ spec requires: #( Famix 'Famix-FortranUDT-Entities') ];
		package: 'Famix-Fortran03-Tests' with: [ spec requires: #( Famix ) ]
]
