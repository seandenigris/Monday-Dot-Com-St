Class {
	#name : #MdMondayDotCom,
	#superclass : #Object,
	#instVars : [
		'boards',
		'subdomain'
	],
	#classVars : [
		'UniqueInstance'
	],
	#category : #MondayDotCom
}

{ #category : #persistence }
MdMondayDotCom class >> restoreFrom: anObject [

	UniqueInstance := anObject
]

{ #category : #persistence }
MdMondayDotCom class >> spData [

	^ UniqueInstance
]

{ #category : #accessing }
MdMondayDotCom class >> uniqueInstance [

	^ UniqueInstance ifNil: [ UniqueInstance := self new ]
]

{ #category : #accessing }
MdMondayDotCom class >> uniqueInstance: anObject [
	UniqueInstance := anObject
]

{ #category : #'as yet unclassified' }
MdMondayDotCom >> allPosts [

	^ self allTasks flatCollect: #posts
]

{ #category : #'as yet unclassified' }
MdMondayDotCom >> allTasks [

	^ self boards flatCollect: #tasks
]

{ #category : #accessing }
MdMondayDotCom >> boardWithID: anInteger [

	^ self boards detect: [ :b | b id = anInteger ]
]

{ #category : #accessing }
MdMondayDotCom >> boards [

	^ boards ifNil: [ boards := OrderedCollection new ]
]

{ #category : #accessing }
MdMondayDotCom >> boards: anObject [
	boards := anObject
]

{ #category : #views }
MdMondayDotCom >> boardsGtViewwFor: aView [
	<gtView>
	boards ifNil: [ ^ aView empty ].
	^ aView columnedList
		title: 'Boards';
		items: [ boards ];
		column: 'Value' text: [ :each | each gtDisplayString ]
]

{ #category : #accessing }
MdMondayDotCom >> subdomain [
	^ subdomain
]

{ #category : #accessing }
MdMondayDotCom >> subdomain: anObject [
	subdomain := anObject
]

{ #category : #'as yet unclassified' }
MdMondayDotCom >> taskFromString: aString [

	| aUrl board |
	aUrl := aString asUrl.
	board := self boardWithID: aUrl pathSegments second asInteger.
	^ board taskWithID: aUrl pathSegments fourth asInteger
]

{ #category : #'as yet unclassified' }
MdMondayDotCom >> url [

	| baseUrlString |
	baseUrlString := 'https://', self subdomain, '.monday.com'.
	^ baseUrlString asUrl
]
