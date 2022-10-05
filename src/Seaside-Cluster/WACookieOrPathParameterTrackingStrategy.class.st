"
I use cookies to track sessions if the browser supports it and use path parameters (;_s=key) otherwise. I keep adding the session cookie and the session query field until the session cookie shows up in the request. Then I stop adding the query field.
"
Class {
	#name : #WACookieOrPathParameterTrackingStrategy,
	#superclass : #WACookieSessionTrackingStrategy,
	#category : #'Seaside-Cluster'
}

{ #category : #public }
WACookieOrPathParameterTrackingStrategy >> addKey: aString toUrl: aUrl [
	"Only add a query field if there isn't already a cookie"
	self
		cookieFromContext: self requestContext
		ifAbsent: [ self addPathParameterWithValue: aString to: aUrl ]
]

{ #category : #public }
WACookieOrPathParameterTrackingStrategy >> keyFromContext: aRequestContext [

	"If a query field is present it overrides a cookie.
	In the case of a document handler both a cookie and a query field are present with different values
	(the cookie 'pointing' to the session and the query field 'pointing' to the document handler).
	We have to take the document handler in this case."

	| key |
	key := self pathParameterKeyFromContext: aRequestContext.
	^ key
		  ifNil: [ 
		  (self cookieFromContext: aRequestContext ifAbsent: [ ^ nil ])
			  value ]
		  ifNotNil: [ :value | value ]
]

{ #category : #public }
WACookieOrPathParameterTrackingStrategy >> noHandlerFoundForKey: aString in: anApplication context: aRequestContext [

	| queryFieldKey |
	queryFieldKey := self pathParameterKeyFromContext: aRequestContext.
	queryFieldKey
		ifNil: [ 
			| cookie |
			"there is no query field -> a cookie was used for the look up -> delete it"
			cookie := self cookieFromContext: aRequestContext ifAbsent: [ nil ].
			cookie notNil ifTrue: [ "If there is a cookie delete it.
				Unfortunately if the browser doesn't support cookies then an expired document handler will result in the session cookie being deleted." 
				self deleteSessionCookieOf: anApplication from: aRequestContext ] ]
		ifNotNil: [ :value | 
			| cookie |
			cookie := self cookieFromContext: aRequestContext ifAbsent: [ nil ].
			(cookie notNil and: [ cookie value = value ]) ifTrue: [ "A query field was used for the look up but there is also a cookie with the same value -> delete it" 
				self deleteSessionCookieOf: anApplication from: aRequestContext ] ].
	super
		noHandlerFoundForKey: aString
		in: anApplication
		context: aRequestContext
]
