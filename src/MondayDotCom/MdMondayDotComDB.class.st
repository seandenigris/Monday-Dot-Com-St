Class {
	#name : #MdMondayDotComDB,
	#superclass : #SpFileDatabase,
	#category : #'MondayDotCom-Persistence'
}

{ #category : #accessing }
MdMondayDotComDB class >> backupDirectoryParent [
	
	^ FileLocator dynabookData / 'Monday Dot Com'
]

{ #category : #'loading/saving' }
MdMondayDotComDB class >> schema [

	^ {
			MdMondayDotCom
		}.
]
