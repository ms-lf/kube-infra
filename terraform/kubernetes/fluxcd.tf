 provider "helm" {
} 

 data "helm_repository" "fluxcd" {
    name = "stable"
    url  = "https://charts.fluxcd.io/"
} 

locals {
  helm_releases = flatten([
    for ns, ns_key in var.namespaces : [
      for r in ns_key.helm : {
        name = r
        namespace = ns
        chart =   var.helm_charts[r].chart
        version = var.helm_charts[r].version
      }
    ]
  ])
}



 resource "helm_release" "this" {

   for_each = {
    for release in local.helm_releases : "${release.name}-${release.namespace}" 
=> release
  }
  name              = each.key
  atomic            = true
  repository        = data.helm_repository.fluxcd.metadata.0.name
  chart             = each.value["chart"]
  version           = each.value["version"]
  namespace         = each.value["namespace"]     
  
  depends_on = [kubernetes_namespace.namespace]

  values = [                   
    "${file("files/${each.key}.yaml")}"
  ]
}


