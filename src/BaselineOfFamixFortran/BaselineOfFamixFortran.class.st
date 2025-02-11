Class {
	#name : 'BaselineOfFamixFortran',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfFamixFortran',
	#package : 'BaselineOfFamixFortran'
}

{ #category : 'baselines' }
BaselineOfFamixFortran >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec blessing: #baseline.
		spec description: 'Famix Fortran'.
		self defineDependencies: spec.
		self definePackages: spec.
		self defineGroups: spec ]
]

{ #category : 'baselines' }
BaselineOfFamixFortran >> defineDependencies: spec [

	spec
		baseline: 'Famix'
		with: [ 
			spec
				loads: #( 'Core' 'Minimal' 'Basic' );
				repository: 'github://moosetechnology/Famix:development/src' ]
]

{ #category : 'baselines' }
BaselineOfFamixFortran >> defineGroups: spec [

	spec
		group: 'default' with: #( core );
		group: 'core' with: #( 'Famix-Fortran77-Entities' 'Famix-FortranUDT-Generator' );
		group: 'all' with: #( 'core' 'Famix-Fortran77-Generator' 'Famix-FortranUDT-Generator' 'Famix-Fortran77-Tests' )
]

{ #category : 'baselines' }
BaselineOfFamixFortran >> definePackages: spec [

	spec
		package: 'Famix-Fortran77-Entities' with: [ spec requires: #( Famix ) ];
		package: 'Famix-Fortran77-Generator' with: [ spec requires: #( Famix ) ];
		package: 'Famix-Fortran77-Tests' with: [ spec requires: #( Famix ) ];
		package: 'Famix-FortranUDT-Generator' with: [ spec requires: #( Famix ) ];
		package: 'Famix-FortranUDT-Entities' with: [ spec requires: #( Famix ) ]
]
