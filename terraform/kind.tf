resource "kind_cluster" "store" {
    name = var.cluster_name
    wait_for_ready = true

  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"

    node {
      role = "control-plane"
    }

    node {
      role  = "worker"
      image = "kindest/node:v1.23.4"
    }

    node {
      role  = "worker"
      image = "kindest/node:v1.23.4"
    }

    node {
      role  = "worker"
      image = "kindest/node:v1.23.4"
    }
  }
}
