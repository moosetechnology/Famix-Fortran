Class {
	#name : #BaselineOfFamixFortran77,
	#superclass : #BaselineOf,
	#category : #BaselineOfFamixFortran
}

{ #category : #baselines }
BaselineOfFamixFortran77 >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec blessing: #baseline.
			spec description: 'Famix Fortran'.
			self defineDependencies: spec.
			self definePackages: spec ]
]

{ #category : #baselines }
BaselineOfFamixFortran77 >> defineDependencies: spec [
	spec
		baseline: 'Famix' with: [ spec repository: 'github://moosetechnology/Famix' ];
		baseline: 'NeoJSON' with: [ spec repository: 'github://svenvc/NeoJSON' ]
]

{ #category : #baselines }
BaselineOfFamixFortran77 >> definePackages: spec [
	spec
		repository: 'github://moosetechnology/Famix-Fortran';
		package: 'Famix-Fortran77-Entities' with: [ spec requires: #(Famix) ] ;
		package: 'Famix-Fortran77-Generator' with: [ spec requires: #(Famix) ] ;
		package: 'Famix-Fortran77-Tests' with: [ spec requires: #(Famix NeoJSON) ]

]
