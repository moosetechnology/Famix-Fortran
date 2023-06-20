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
			to:
			self buildName , '/' , (esopeFile basename removeSuffix: '.e')
			, '.f' ]
]

{ #category : #example }
BookstoreExporter class >> buildName [

	^ '/tmp/build'
]

{ #category : #example }
BookstoreExporter class >> buildPath [

	^ self buildName asFileReference ensureCreateDirectory
]

{ #category : #example }
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
	outputFile := '/tmp/build/'
	              , (astFile basename removeSuffix: '.0.f.json') , '.1.e'.

	outputFile asFileReference writeStreamDo: [ :stream | 
		stream truncate.
		stream
		<< (exporter output contents replaceAll: Character cr with: Character lf) ]
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

{ #category : #utilities }
BookstoreExporter class >> f77parser [

	^ 'fortran-src-extras'
]

{ #category : #utilities }
BookstoreExporter class >> f77parserOption [

	^ 'serialize -t json -v77l encode'
]

{ #category : #example }
BookstoreExporter class >> newFromPath: anAbsolutePath [

	^ self new changeDefaultFolderTo: anAbsolutePath
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

{ #category : #example }
BookstoreExporter class >> srcName [

	^ '/tmp/esopeSrc'
]

{ #category : #example }
BookstoreExporter class >> srcPath [

	^ self srcName asFileReference
]
