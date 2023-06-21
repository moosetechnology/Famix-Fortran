Class {
	#name : #BookstoreExporter,
	#superclass : #Object,
	#category : #'FortranCamfortImporter-demos'
}

{ #category : #example }
BookstoreExporter class >> annotateEsopeSourcesFrom [

	(self srcPath allChildrenMatching: '*.0.e') do: [ 
		:esopeFile | 
		PPEsopeRewriter
			rewriteFrom: esopeFile
			to: (self rewriterPath / ('' join: { 
						  (esopeFile basename removeSuffix: '.e').
						  '.f' })) pathString ]
]

{ #category : #utilities }
BookstoreExporter class >> buildPath [

	^ (self rootPath / 'build') asFileReference ensureCreateDirectory
]

{ #category : #demos }
BookstoreExporter class >> export [

	<script>
	self fromPath: self srcPath
]

{ #category : #example }
BookstoreExporter class >> exportAstFrom: astFile [

	| exporter outputFile |
	exporter := FASTFortranJsonExporterVisitor new.
	exporter visitProgramFile:
		(NeoJSONReader fromString: astFile contents).
	outputFile := self targetPath / ('' join: { 
			               (astFile basename removeSuffix: '.0.json').
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
BookstoreExporter class >> exportToEsope [

	(self parserPath allChildrenMatching: '*.0.json') do: [ :astFile | 
		self exportAstFrom: astFile ]
]

{ #category : #configuration }
BookstoreExporter class >> f77parser [

	^ 'fortran-src-extras serialize -t json -v77l encode'
]

{ #category : #example }
BookstoreExporter class >> fromPath: srcPath [

	srcPath exists ifFalse: [ ^ self ].

	self annotateEsopeSourcesFrom.
	self parseAnnotatedFortranSources.
	self exportToEsope
]

{ #category : #example }
BookstoreExporter class >> parseAnnotatedFortranSources [

	(self rewriterPath allChildrenMatching: '*.0.f') do: [ :annotatedFile | 
		self parseToAst: annotatedFile ]
]

{ #category : #utilities }
BookstoreExporter class >> parseToAst: f77file [

	| outputFile |
	outputFile := self parserPath
	              / (f77file basename removeSuffix: '.0.f').
	LibC runCommand: ('{1} "{2}" > "{3}.0.json" 2> "{3}.0.err"' format: { 
				 self f77parser.
				 f77file pathString.
				 outputFile pathString })
]

{ #category : #configuration }
BookstoreExporter class >> parserPath [

	^ (self buildPath / 'parser') asFileReference ensureCreateDirectory
]

{ #category : #configuration }
BookstoreExporter class >> rewriterPath [

	^ (self buildPath / 'rewriter') asFileReference ensureCreateDirectory
]

{ #category : #configuration }
BookstoreExporter class >> rootName [

	^ '/tmp'
]

{ #category : #utilities }
BookstoreExporter class >> rootPath [

	^ self rootName asPath
]

{ #category : #utilities }
BookstoreExporter class >> srcPath [

	^ (self rootPath / 'esopeSrc') asFileReference
]

{ #category : #configuration }
BookstoreExporter class >> targetPath [

	^ (self buildPath / 'target') asFileReference ensureCreateDirectory
]
