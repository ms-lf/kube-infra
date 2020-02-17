namespaces = {
    monitoring = {
        annotations = {
            "prometheus.io/scrape" = "false"
        }
        labels = {
            "istio-injection" = "disabled"
        }
        "fluxcd" = "flux-monitoring"
    },
    logging = {
        annotations = {
            "prometheus.io/scrape" = "false"
        }
        labels = {
            "istio-injection" = "disabled"
        }
        "fluxcd" = "flux-logging"
    }
}


