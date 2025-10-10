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
			spec description: 'Famix Fortran'.

			spec for: #NeedsFamix do: [ self famix: spec ].
			self definePackages: spec.
			self defineGroups: spec ]
]

{ #category : 'accessing' }
BaselineOfFamixFortran >> customProjectAttributes [

	'BaselineOfFamix' asPackageIfAbsent: [ ^ #( #NeedsFamix ) ].
	^ #(  )
]

{ #category : 'baselines' }
BaselineOfFamixFortran >> defineGroups: spec [

	spec
		group: 'default' with: #( 'core' );
		group: 'core' with: #( 'Famix-Fortran77-Entities' 'Famix-FortranUDT-Entities' );
		group: 'all' with: #( 'core' 'Famix-Fortran77-Generator' 'Famix-FortranUDT-Generator' 'Famix-Fortran77-Tests' )
]

{ #category : 'baselines' }
BaselineOfFamixFortran >> definePackages: spec [

	spec
		package: 'Famix-Fortran77-Entities';
		package: 'Famix-Fortran77-Generator';
		package: 'Famix-Fortran77-Tests'
		with: [ spec requires: #( 'Famix-Fortran77-Entities' ) ];
		package: 'Famix-FortranUDT-Entities';
		package: 'Famix-FortranUDT-Generator'.

	spec for: #NeedsFamix do: [
			spec
				package: 'Famix-Fortran77-Entities'
				with: [ spec requires: #( Famix ) ];
				package: 'Famix-Fortran77-Generator'
				with: [ spec requires: #( Famix ) ];
				package: 'Famix-FortranUDT-Entities'
				with: [ spec requires: #( Famix ) ];
				package: 'Famix-FortranUDT-Generator'
				with: [ spec requires: #( Famix ) ] ]
]

{ #category : 'baselines' }
BaselineOfFamixFortran >> famix: spec [

	spec baseline: 'Famix' with: [
			spec
				loads: #( 'Core' 'Minimal' 'Basic' );
				repository: 'github://moosetechnology/Famix' ]
]
