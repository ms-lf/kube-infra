 resource "kubernetes_namespace" "namespace" {

  for_each = var.namespaces

  metadata {
     
    name = each.key

    annotations = lookup(each.value, "annotations", {}) 

    labels = lookup(each.value, "labels", {})

  }

} 
