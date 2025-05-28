Class {
	#name : #MdPost,
	#superclass : #Object,
	#traits : 'DbTDomainObject',
	#classTraits : 'DbTDomainObject classTrait',
	#instVars : [
		'task',
		'id',
		'timestamp'
	],
	#category : #MondayDotCom
}

{ #category : #'as yet unclassified' }
MdPost >> displayStringOn: aStream [

	aStream  nextPutAll: 'post'.
	
	self timestamp ifNotNil: [
		aStream
			nextPutAll: ' at ';
			nextPutAll: self timestamp printUS ].

	self task ifNotNil: [ 
		aStream
			nextPutAll: ' in ';
			display: self task ]
]

{ #category : #accessing }
MdPost >> id [
	^ id
]

{ #category : #accessing }
MdPost >> id: anObject [
	id := anObject
]

{ #category : #'as yet unclassified' }
MdPost >> initialize [

	super initialize.
	self ensureUUID
]

{ #category : #'as yet unclassified' }
MdPost >> presentOnWeb [

	^ self url open
]

{ #category : #'as yet unclassified' }
MdPost >> presentOnWebDescription [
	<magritteActionDescription>
	^ MAActionDescription new
		action: #presentOnWeb;
		gtIcon: BrGlamorousVectorIcons link;
		isLabelVisible: false;
		yourself
]

{ #category : #'as yet unclassified' }
MdPost >> printOn: aStream [

	self printFromDisplayStringOn: aStream
]

{ #category : #accessing }
MdPost >> task [
	^ task
]

{ #category : #accessing }
MdPost >> task: anObject [
	task := anObject
]

{ #category : #accessing }
MdPost >> timestamp [
	^ timestamp
]

{ #category : #accessing }
MdPost >> timestamp: anObject [
	timestamp := anObject
]

{ #category : #'as yet unclassified' }
MdPost >> url [

	^ self task url / 'posts' / self id asString
]
