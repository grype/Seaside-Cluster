"
I am a WARouteHandlerTrackingStragety that delegates to a WARouteHandlerTrackingStragety.
"
Class {
	#name : #WARoutePathParameterHandlerTrackingStragety,
	#superclass : #WARouteHandlerTrackingStragety,
	#category : #'Seaside-Cluster'
}

{ #category : #private }
WARoutePathParameterHandlerTrackingStragety >> newDelegate [
	^ WAPathParameterHandlerTrackingStragety new
]
