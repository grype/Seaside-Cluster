"
I track request handlers using a path parameter. This results in URLs looking like this:

/tests/functional;_s=de379kaie13

I am very similar to WAQueryFieldHandlerTrackingStrategy. The only advantage I have is that path parameter don't need to be repeated as hidden elements in forms. Also some load balancers don't understand query fields but do understand path parameters (mostly from the enterprise Java world).
"
Class {
	#name : #WAPathParameterHandlerTrackingStragety,
	#superclass : #WAHandlerTrackingStrategy,
	#category : #'Seaside-Cluster'
}

{ #category : #public }
WAPathParameterHandlerTrackingStragety >> addKey: aString toContext: aRequestContext [
	"Nothing to do, we only add to the URL"
]

{ #category : #public }
WAPathParameterHandlerTrackingStragety >> addKey: aString toUrl: aUrl [
	self addPathParameterWithValue: aString to: aUrl
]

{ #category : #public }
WAPathParameterHandlerTrackingStragety >> keyFromContext: aRequestContext [
	^ self pathParameterKeyFromContext: aRequestContext
]
