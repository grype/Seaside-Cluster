Extension { #name : #WAAdmin }

{ #category : #'*Seaside-Cluster' }
WAAdmin class >> makeAllClusteredWithRoute: aRouteString trackingStrategy: aTrackingStragetyclass [
	"self makeAllClusteredWithRoute: '33' trackingStrategy: WAPathParameterHandlerTrackingStragety"
	
	self registerRoute: aRouteString.
	self registerSessionTrackingStrategy: aTrackingStragetyclass
]

{ #category : #'*Seaside-Cluster' }
WAAdmin class >> registerAsRoot: aComponentClass [
	"Use this to programatically register a component the sole application for all adapors.
	No other applications will be registered."

	| application |
	application := WAApplication new.
	self configureNewApplication: application.
	application preferenceAt: #rootClass put: aComponentClass.
	WAServerManager default adaptors do: [ :each |
		each requestHandler: application ]
]

{ #category : #'*Seaside-Cluster' }
WAAdmin class >> registerRoute: aString [
	WAUserConfiguration allInstancesDo: [ :each |
		each clearSearchContexts ].
	self applicationDefaults addParent: WAClusterConfiguration instance.
	self applicationDefaults
		at: #route
		put: aString
]

{ #category : #'*Seaside-Cluster' }
WAAdmin class >> registerSessionTrackingStrategy: aClass [
	"self registerSessionTrackingStrategy: WARoutePathParameterHandlerTrackingStragety"
	self applicationDefaults
		at: #trackingStrategy
		put: aClass new
]

{ #category : #'*Seaside-Cluster' }
WAAdmin class >> removeRoute [
	self applicationDefaults
		 removeExpressionAt: #route;
		removeParent: WAClusterConfiguration instance
]

{ #category : #'*Seaside-Cluster' }
WAAdmin class >> route [
	^ self applicationDefaults at: #route
]
