Class {
	#name : #MdBoard,
	#superclass : #Object,
	#instVars : [
		'id',
		'tasks',
		'application'
	],
	#category : #MondayDotCom
}

{ #category : #private }
MdBoard >> addTaskWithID: anInteger [ 

	| task |
	task := MdTask new
		board: self;
		id: anInteger;
		yourself.
		
	^ self tasks add: task
]

{ #category : #accessing }
MdBoard >> application [
	^ application
]

{ #category : #accessing }
MdBoard >> application: anObject [
	application := anObject
]

{ #category : #accessing }
MdBoard >> id [
	^ id
]

{ #category : #accessing }
MdBoard >> id: anObject [
	id := anObject
]

{ #category : #'as yet unclassified' }
MdBoard >> taskWithID: anInteger [ 

	^ self tasks
		detect: [ :t | t id = anInteger ]
		ifNone: [ self addTaskWithID: anInteger ]
]

{ #category : #accessing }
MdBoard >> tasks [

	^ tasks ifNil: [ tasks := OrderedCollection new ]
]

{ #category : #accessing }
MdBoard >> tasks: anObject [
	tasks := anObject
]

{ #category : #'as yet unclassified' }
MdBoard >> tasksGtSearchFor: aSearch [
	<gtSearch>
	^ aSearch list
		title: 'Tasks';
		priority: 200;
		items: [ self tasks ];
		itemName: #displayString;
		matchSubstrings
]

{ #category : #views }
MdBoard >> tasksGtViewFor: aView [
	<gtView>
	tasks ifNil: [ ^ aView empty ].
	^ aView columnedList
		title: 'Tasks';
		items: [ tasks ];
		column: 'Task' text: [ :each | each gtDisplayString ];
		actionUpdateButton
]

{ #category : #'as yet unclassified' }
MdBoard >> url [

	^ self application url  / 'boards' / self id asString
]
