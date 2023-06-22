Class {
	#name : #BookstoreExporter,
	#superclass : #Object,
	#category : #'FortranCamfortImporter-demos'
}

{ #category : #example }
BookstoreExporter class >> annotateEsopeSourcesFrom [

	(self srcPath allChildrenMatching: '*.0.e') do: [ :esopeFile | 
		PPEsopeRewriter
			rewriteFrom: esopeFile
			to: (self rewriterPath / ('' join: { 
						  (esopeFile basename removeSuffix: self esopeSuffix).
						  self fortranSuffix })) pathString ]
]

{ #category : #utilities }
BookstoreExporter class >> buildPath [

	^ (self rootPath / 'build') asFileReference ensureCreateDirectory
]

{ #category : #configuration }
BookstoreExporter class >> esopeSuffix [

	^ '.e'
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
			               (astFile basename removeSuffix: self jsonSuffix).
			               self rewritedEsopeSuffix }).
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

	(self parserPath allChildrenMatching: self jsonFileRegex) do: [ 
		:astFile | self exportAstFrom: astFile ]
]

{ #category : #configuration }
BookstoreExporter class >> f77FileRegex [

	^ '*.0.f'
]

{ #category : #configuration }
BookstoreExporter class >> f77parser [

	^ 'fortran-src-extras serialize -t json -v77l encode'
]

{ #category : #configuration }
BookstoreExporter class >> fortranSuffix [

	^ '.f'
]

{ #category : #example }
BookstoreExporter class >> fromPath: srcPath [

	srcPath exists ifFalse: [ ^ self ].

	self annotateEsopeSourcesFrom.
	self parseAnnotatedFortranSources.
	self exportToEsope
]

{ #category : #configuration }
BookstoreExporter class >> jsonFileRegex [

	^ '*.0.json'
]

{ #category : #configuration }
BookstoreExporter class >> jsonSuffix [

	^ '.0.json'
]

{ #category : #example }
BookstoreExporter class >> parseAnnotatedFortranSources [

	(self rewriterPath allChildrenMatching: self f77FileRegex) do: [ 
		:annotatedFile | self parseToAst: annotatedFile ]
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
BookstoreExporter class >> rewritedEsopeSuffix [

	^ '.1.e'
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

{ #category : #utilities }
BookstoreExporter class >> targetPath [

	^ (self buildPath / 'target') asFileReference ensureCreateDirectory
]
