Extension { #name : #WAApplication }

{ #category : #'*seaside-cluster' }
WAApplication >> route [
	^ self preferenceAt: #route
]

{ #category : #'*seaside-cluster' }
WAApplication >> route: aString [
	^ self preferenceAt: #route put: aString
]
