@if(staging)
package releases

// Releases included in this cluster.
releases: [http1, worker1]

http1: #VGSHTTPApp & {
	spec: {
		name: 		"my-app-http"
		values: {
			hpa: enabled: false
			resources: {
				limits: memory:   "256Mi"
				requests: memory: "32Mi"
			}
			environment: {

			}
		}
	}
}

worker1: #VGSWorkerApp & {
	spec: {
		name: 		"my-app-worker"
		values: {
			hpa: enabled: false
			resources: {
				limits: memory:   "256Mi"
				requests: memory: "32Mi"
			}
			environment: {
				LITERAL_ENVIRONMENT:
					value: "bar"
				FOO:
					value: "baz"
			}
		}
	}
}
