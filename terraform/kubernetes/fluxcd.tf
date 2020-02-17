 provider "helm" {
} 

 data "helm_repository" "fluxcd" {
    name = "stable"
    url  = "https://charts.fluxcd.io/"
} 


 resource "helm_release" "this" {
  for_each          = var.namespaces
  name              = each.value["fluxcd"]
  cleanup_on_fail   = true
  atomic            = true
  repository        = data.helm_repository.fluxcd.metadata.0.name
  chart             = "flux"
  version           = "1.2.0"
  namespace         = each.key     

  depends_on = [kubernetes_namespace.namespace]

  values = [                   
    "${file("files/${each.key}.yaml")}"
  ]
}


