"
An IASTExporterVisitorTest is a test class for testing the behavior of IASTExporterVisitor
"
Class {
	#name : #IASTExporterVisitorTest,
	#superclass : #IASTToFamixVisitorTest,
	#category : #'FortranCamfortImporter-Tests-Visitor'
}

{ #category : #initialization }
IASTExporterVisitorTest >> setUp [
	super setUp.
	
	visitor := IASTExporterVisitor new.
]

{ #category : #tests }
IASTExporterVisitorTest >> testCreateFamixFortran77PUMain [

	| code |
	programFile progUnits: { IASTMainProgram new
			 entityName: 'main';
			 yourself }.

	code := programFile accept: visitor.

	self
		assert: code
		equals: '      program main
      end
'
]
