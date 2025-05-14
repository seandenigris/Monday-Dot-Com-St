Class {
	#name : #BaselineOfMondayDotCom,
	#superclass : #BaselineOf,
	#category : #BaselineOfMondayDotCom
}

{ #category : #baseline }
BaselineOfMondayDotCom >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		spec 
			package: #'MondayDotCom' ].
]

{ #category : #accessing }
BaselineOfMondayDotCom >> customProjectAttributes [
	^ self isGTImage
			ifFalse: [ #(notGToolkit) ]
			ifTrue: [ #(GToolkit) ]
]

{ #category : #testing }
BaselineOfMondayDotCom >> isGTImage [
	
	^ RPackageOrganizer default packageNames anySatisfy: [ :pn | pn beginsWith: 'Lepiter-' ].
	"Implementation note: used to check for GToolkit prefix, but P7 has a GToolkit-Examples package. Lepiter, OTOH, could only be loaded in a GT image"
]
