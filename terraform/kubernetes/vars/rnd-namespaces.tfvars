namespaces = {
    monitoring = {
        annotations = {
            "prometheus.io/scrape" = "false"
        }
        labels = {
            "istio-injection" = "disabled"
        }
        helm = [
            "flux",
            "helm-operator"
        ]
    },
    logging = {
        annotations = {
            "prometheus.io/scrape" = "false"
        }
        labels = {
            "istio-injection" = "disabled"
        }
         helm = [
            "flux",
            "helm-operator"
        ]    
    }
}

helm_charts = {
    flux = {
        "chart" = "flux"
        "version" = "1.2.0"
    }
    helm-operator = {
        "chart" = "helm-operator"
        "version" = "0.7.0"
    }
}
