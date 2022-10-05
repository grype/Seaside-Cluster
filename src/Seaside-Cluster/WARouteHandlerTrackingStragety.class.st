"
I am the abstract base class for tracking strategies that add a route (image id) to the session key. This allows a stateless load balance to find the image on which a session is stored. I just add and remove the route and then delegate to an actual route implementation.

Instance Variables:
	delegate	<WAHandlerTrackingStrategy>
		
delegate
	- the actual route that does the work.
"
Class {
	#name : #WARouteHandlerTrackingStragety,
	#superclass : #WAHandlerTrackingStrategy,
	#instVars : [
		'delegate'
	],
	#category : #'Seaside-Cluster'
}

{ #category : #testing }
WARouteHandlerTrackingStragety class >> isAbstract [
	^ self name = #WARouteHandlerTrackingStragety
]

{ #category : #public }
WARouteHandlerTrackingStragety >> addKey: aString toContext: aRequestContext [
	delegate
		addKey: (self addRouteToKey: aString context: aRequestContext)
		toContext: aRequestContext
]

{ #category : #public }
WARouteHandlerTrackingStragety >> addKey: aString toUrl: aUrl [
	delegate
		addKey: (self addRouteToKey: aString)
		toUrl: aUrl
]

{ #category : #private }
WARouteHandlerTrackingStragety >> addRouteToKey: aString [
	| route |
	route := self route.
	^ route isEmptyOrNil
		ifTrue: [ aString ]
		ifFalse: [ aString, '.', route ]
]

{ #category : #private }
WARouteHandlerTrackingStragety >> addRouteToKey: aString context: aRequestContext [
	| route |
	route := self routeFrom: aRequestContext.
	^ route isEmptyOrNil
		ifTrue: [ aString ]
		ifFalse: [ aString, '.', route ]
]

{ #category : #initialization }
WARouteHandlerTrackingStragety >> initialize [
	super initialize.
	delegate := self newDelegate
]

{ #category : #public }
WARouteHandlerTrackingStragety >> keyFromContext: aRequestContext [
	^ self removeRouteFromKey: (delegate keyFromContext: aRequestContext)
]

{ #category : #private }
WARouteHandlerTrackingStragety >> newDelegate [
	self subclassResponsibility
]

{ #category : #public }
WARouteHandlerTrackingStragety >> noHandlerFoundForKey: aString in: anApplication context: aRequestContext [
	delegate
		noHandlerFoundForKey: (self addRouteToKey: aString context: aRequestContext)
		in: anApplication
		context: aRequestContext
]

{ #category : #private }
WARouteHandlerTrackingStragety >> removeRouteFromKey: aString [
	^ aString isNil ifFalse: [ aString copyUpTo: $. ]
]

{ #category : #private }
WARouteHandlerTrackingStragety >> route [
	^ WACurrentRequestContext value application route
	
]

{ #category : #private }
WARouteHandlerTrackingStragety >> routeFrom: aContext [
	^ aContext application route
	
]
