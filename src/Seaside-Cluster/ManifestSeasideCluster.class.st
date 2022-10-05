"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestSeasideCluster,
	#superclass : #PackageManifest,
	#category : #'Seaside-Cluster-Manifest'
}

{ #category : #'code-critics' }
ManifestSeasideCluster class >> ruleUtilityMethodsRuleV1FalsePositive [
	^ #(#(#(#RGPackageDefinition #(#'Seaside-Cluster')) #'2022-10-04T22:34:37.22437-07:00') )
]
