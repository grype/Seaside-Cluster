"
This configuration class holds attributes needed for sticky sessions by WAClusteredApplication.

"
Class {
	#name : #WAClusterConfiguration,
	#superclass : #WASystemConfiguration,
	#category : #'Seaside-Cluster'
}

{ #category : #description }
WAClusterConfiguration >> describeOn: config [
	(config string: #route)
		group: #server;
		comment: 'The route added to the session key for sticky sessions.'.
]
