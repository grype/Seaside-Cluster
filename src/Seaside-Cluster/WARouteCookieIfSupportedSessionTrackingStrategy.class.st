"
I am a WARouteHandlerTrackingStragety that delegates to a WACookieIfSupportedSessionTrackingStrategy.
"
Class {
	#name : #WARouteCookieIfSupportedSessionTrackingStrategy,
	#superclass : #WARouteHandlerTrackingStragety,
	#category : #'Seaside-Cluster'
}

{ #category : #private }
WARouteCookieIfSupportedSessionTrackingStrategy >> newDelegate [
	^ WACookieIfSupportedSessionTrackingStrategy new
]
