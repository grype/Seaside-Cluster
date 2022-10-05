"
I am a WARouteHandlerTrackingStragety that delegates to a WARouteCookieOrPathParameterTrackingStrategy.
"
Class {
	#name : #WARouteCookieOrPathParameterTrackingStrategy,
	#superclass : #WARouteHandlerTrackingStragety,
	#category : #'Seaside-Cluster'
}

{ #category : #private }
WARouteCookieOrPathParameterTrackingStrategy >> newDelegate [
	^ WACookieOrPathParameterTrackingStrategy new
]
