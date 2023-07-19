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
		with: [ 
			spec repository: 'github://moosetechnology/Famix:development/src' ];
		baseline: 'FamixFortran77'
		with: [ spec repository: 'github://moosetechnology/Famix-Fortran' ];
		baseline: 'NeoJSON'
		with: [ spec repository: 'github://svenvc/NeoJSON' ]
]

{ #category : #baselines }
BaselineOfFamixFortran >> definePackages: spec [

	spec
		repository: 'github://moosetechnology/Famix-Fortran';
		package: 'Famix-Esope-Entities'
		with: [ spec requires: #( FamixFortran77 ) ];
		package: 'Famix-Esope-Generator'
		with: [ spec requires: #( FamixFortran77 ) ];
		package: 'Famix-Esope-Tests'
		with: [ spec requires: #( NeoJSON FamixFortran77 ) ];
		package: 'FamixFortranCamfortImporter'
		with: [ spec requires: #( Famix ) ];
		package: 'FortranCamfortImporter' with: [ 
			spec requires: #( FamixFortranCamfortImporter
				   Famix ) ];
		package: 'FortranCamfortImporter-Tests'
		with: [ spec requires: #( Famix ) ]
]
