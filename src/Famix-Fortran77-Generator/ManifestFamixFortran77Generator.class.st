"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestFamixFortran77Generator',
	#superclass : 'PackageManifest',
	#category : 'Famix-Fortran77-Generator-Manifest',
	#package : 'Famix-Fortran77-Generator',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestFamixFortran77Generator class >> ruleLongMethodsRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#FamixFortran77Generator #defineHierarchy #false)) #'2024-06-10T16:18:04.131591+02:00') )
]
