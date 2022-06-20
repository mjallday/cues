package releases

import (
	"github.com/fluxcd/cues/pkg/release"
)

// Environment defines the destination cluster.
env: *"" | string @tag(env,short=staging|production)

// Releases holds the list of releases per env.
releases: [...release.#Release]

// Podinfo base definition.
#VGSHTTPApp: release.#Release & {
	spec: {
		namespace: 	"dev-apps"
		repository: {
			url: "https://github.com/verygood-ops/vgs-charts"
		}
		chart: {
			name: "vgs-app-http"
			version: "6.1.x"
		}
	}
}

// Podinfo base definition.
#VGSWorkerApp: release.#Release & {
	spec: {
		namespace: 	"dev-apps"
		repository: {
			url: "https://github.com/verygood-ops/vgs-charts"
		}
		chart: {
			name: "vgs-app-worker"
			version: "6.1.x"
		}
	}
}
