Class {
	#name : #BookstoreExporter,
	#superclass : #Object,
	#category : #'FortranCamfortImporter-demos'
}

{ #category : #example }
BookstoreExporter class >> annotateEsopeSourcesFrom: srcPath [

	(srcPath allChildrenMatching: '*.0.e') do: [ :esopeFile | 
		PPEsopeRewriter
			rewriteFrom: esopeFile
			to: (self buildPath / ('' join: { 
						  (esopeFile basename removeSuffix: '.e').
						  '.f' })) pathString ]
]

{ #category : #configuration }
BookstoreExporter class >> buildName [

	^ '/tmp/build'
]

{ #category : #utilities }
BookstoreExporter class >> buildPath [

	^ self buildName asFileReference ensureCreateDirectory
]

{ #category : #demos }
BookstoreExporter class >> export [

	<script>
	self exportFromPath: self srcPath
]

{ #category : #example }
BookstoreExporter class >> exportAstFrom: astFile [

	| exporter outputFile |
	exporter := FASTFortranJsonExporterVisitor new.
	exporter visitProgramFile:
		(NeoJSONReader fromString: astFile contents).
	outputFile := self buildPath / ('' join: { 
			               (astFile basename removeSuffix: '.0.f.json').
			               '.1.e' }).
	outputFile asFileReference writeStreamDo: [ :stream | 
		stream truncate.
		stream
		<<
		(exporter output contents
			 replaceAll: Character cr
			 with: Character lf) ]
]

{ #category : #example }
BookstoreExporter class >> exportFromPath: srcPath [

	srcPath exists ifFalse: [ ^ self ].

	self annotateEsopeSourcesFrom: srcPath.
	self parseAnnotatedFortranSources.
	self exportToEsope
]

{ #category : #example }
BookstoreExporter class >> exportToEsope [

	(self buildPath allChildrenMatching: '*.0.f.json') do: [ :astFile | 
		self exportAstFrom: astFile ]
]

{ #category : #configuration }
BookstoreExporter class >> f77parser [

	^ 'fortran-src-extras'
]

{ #category : #configuration }
BookstoreExporter class >> f77parserOption [

	^ 'serialize -t json -v77l encode'
]

{ #category : #example }
BookstoreExporter class >> parseAnnotatedFortranSources [

	(self buildPath allChildrenMatching: '*.0.f') do: [ :annotatedFile | 
		self parseToAst: annotatedFile ]
]

{ #category : #utilities }
BookstoreExporter class >> parseToAst: f77file [

	LibC runCommand:
		('{1} {2} "{3}" > "{3}.json" 2> "{3}.err"' format: { 
				 self f77parser.
				 self f77parserOption.
				 f77file pathString })
]

{ #category : #configuration }
BookstoreExporter class >> srcName [

	^ '/tmp/esopeSrc'
]

{ #category : #utilities }
BookstoreExporter class >> srcPath [

	^ self srcName asFileReference
]
