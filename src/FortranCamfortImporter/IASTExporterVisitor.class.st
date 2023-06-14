Class {
	#name : #IASTExporterVisitor,
	#superclass : #IASTToFamixVisitor,
	#instVars : [
		'output'
	],
	#category : #'FortranCamfortImporter-Visitor'
}

{ #category : #visiting }
IASTExporterVisitor >> initialize [ 
	super initialize .
	
	output := String new writeStream
]

{ #category : #accessing }
IASTExporterVisitor >> output [

	^ output
]

{ #category : #accessing }
IASTExporterVisitor >> output: anObject [

	output := anObject
]

{ #category : #visiting }
IASTExporterVisitor >> visitIASTMainProgram: aMainProgram [

	output 
		<< '      ' ;
		<< 'program ' ;
		<< aMainProgram entityName ;
		cr.

	aMainProgram body ifNotNil: [ :body | body accept: self].
	
	output
		<<  '      ' ;
		<< 'end' ;
		cr
	
]

{ #category : #visiting }
IASTExporterVisitor >> visitIASTProgramFile: aProgramFile [

	aProgramFile progUnits do: [ :progUnit | 
		progUnit accept: self ].
	^ output contents
]
