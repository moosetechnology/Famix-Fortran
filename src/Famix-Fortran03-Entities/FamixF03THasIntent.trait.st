"
Dummy parameter can express his intent amongs: in, out, inout
"
Trait {
	#name : #FamixF03THasIntent,
	#instVars : [
		'#intent => FMProperty'
	],
	#category : #'Famix-Fortran03-Entities-Traits'
}

{ #category : #meta }
FamixF03THasIntent classSide >> annotation [

	<FMClass: #THasIntent super: #Object>
	<package: #'Famix-Fortran03-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixF03THasIntent >> intent [

	<FMProperty: #intent type: #String>
	<generated>
	<FMComment: 'intent of the entity (work only for dummy argument)'>
	^ intent
]

{ #category : #accessing }
FamixF03THasIntent >> intent: anObject [
	<generated>
	intent := anObject
]
