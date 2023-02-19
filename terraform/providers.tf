
provider "kind" {}

provider "kubectl" {
  host                   = kind_cluster.store.endpoint
  cluster_ca_certificate = kind_cluster.store.cluster_ca_certificate
  client_certificate     = kind_cluster.store.client_certificate
  client_key             = kind_cluster.store.client_key
}

provider "helm" {
  kubernetes {
    host                   = kind_cluster.store.endpoint
    cluster_ca_certificate = kind_cluster.store.cluster_ca_certificate
    client_certificate     = kind_cluster.store.client_certificate
    client_key             = kind_cluster.store.client_key
  }
}
