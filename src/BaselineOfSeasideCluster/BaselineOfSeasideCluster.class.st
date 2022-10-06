Class {
	#name : #BaselineOfSeasideCluster,
	#superclass : #BaselineOf,
	#category : #BaselineOfSeasideCluster
}

{ #category : #baselines }
BaselineOfSeasideCluster >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec
			package: 'Seaside-Cluster'
			with: [ spec requires: #( 'Seaside3' ) ].
		spec
			baseline: 'Seaside3'
			with: [ spec repository: 'github://SeasideSt/Seaside' ].
		spec group: 'default' with: #( 'Seaside-Cluster' ) ]
]
