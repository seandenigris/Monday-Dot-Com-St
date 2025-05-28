Class {
	#name : #MdTask,
	#superclass : #Object,
	#traits : 'DbTDomainObject',
	#classTraits : 'DbTDomainObject classTrait',
	#instVars : [
		'board',
		'id',
		'title',
		'posts'
	],
	#category : #MondayDotCom
}

{ #category : #'as yet unclassified' }
MdTask >> addPostWithID: anInteger [ 

	| task |
	task := MdPost new
		task: self;
		id: anInteger;
		yourself.
		
	^ self posts add: task
]

{ #category : #accessing }
MdTask >> board [
	^ board
]

{ #category : #accessing }
MdTask >> board: anObject [
	board := anObject
]

{ #category : #'as yet unclassified' }
MdTask >> displayStringOn: aStream [

	self title ifNotNil: [ aStream nextPutAll: self title ]
]

{ #category : #accessing }
MdTask >> id [
	^ id
]

{ #category : #accessing }
MdTask >> id: anObject [
	id := anObject
]

{ #category : #'as yet unclassified' }
MdTask >> initialize [

	super initialize.
	self ensureUUID
]

{ #category : #'as yet unclassified' }
MdTask >> postWithID: anInteger [ 

	^ self posts
		detect: [ :t | t id = anInteger ]
		ifNone: [ self addPostWithID: anInteger ]
]

{ #category : #accessing }
MdTask >> posts [
	^ posts ifNil: [ posts := OrderedCollection new ]
]

{ #category : #accessing }
MdTask >> posts: anObject [
	posts := anObject
]

{ #category : #'as yet unclassified' }
MdTask >> presentOnWeb [

	^ self url open
]

{ #category : #'as yet unclassified' }
MdTask >> presentOnWebDescription [
	<magritteActionDescription>
	^ MAActionDescription new
		action: #presentOnWeb;
		gtIcon: BrGlamorousVectorIcons link;
		isLabelVisible: false;
		yourself
]

{ #category : #'as yet unclassified' }
MdTask >> printOn: aStream [

	self printFromDisplayStringOn: aStream
]

{ #category : #accessing }
MdTask >> title [
	^ title
]

{ #category : #accessing }
MdTask >> title: anObject [
	title := anObject
]

{ #category : #accessing }
MdTask >> titleDescription [
	<magritteDescription>
	
	^ MAStringDescription new
		accessor: #title;
		priority: 100;
		yourself
]

{ #category : #'as yet unclassified' }
MdTask >> url [

	^ self board url / 'pulses' / self id asString
]
