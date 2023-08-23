# provider "kubernetes" {
#   config_path    = "~/.kube/config"

# }

data "aws_eks_cluster" "eks_cluster" {
  name = var.cluster-name
}


data "aws_eks_cluster_auth" "eks_auth" {
  name = var.cluster-name
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.eks_cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks_cluster.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.eks_auth.token
}

resource "kubernetes_namespace" "calculator-application" {
  metadata {
    name = var.namespace
  }
}

// Calculator
resource "kubernetes_deployment" "calculator" {
  metadata {
    name = "calculator"
    namespace = kubernetes_namespace.calculator-application.metadata.0.name
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "calculator"
      }
    }

    template {
      metadata {
        labels = {
          app = "calculator"
        }
      }

      spec {
        container {
          name  = "calculator"
          image = "${var.image_name}-calculator:latest" 

          port {
            container_port = 80
          }
        }
      }
    }
  }
}
# output "calculator_loadbalancer" {
#   value  = kubernetes_service.calculator.status.0.load_balancer.ip.0
#   description = "The private IP address of the main server instance."
# }
resource "kubernetes_service" "calculator" {
  metadata {
    name = "calculator"
    namespace = kubernetes_namespace.calculator-application.metadata.0.name
  }

  spec {
    selector = {
      app = "calculator"
    }

    port {
      protocol    = "TCP"
      port        = 80
      target_port = 80
    }
    type = "LoadBalancer"
  }
}


// Addition
resource "kubernetes_deployment" "addition" {
  metadata {
    name = "addition"
    namespace = kubernetes_namespace.calculator-application.metadata.0.name
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "addition"
      }
    }

    template {
      metadata {
        labels = {
          app = "addition"
        }
      }

      spec {
        container {
          name  = "addition"
          image = "${var.image_name}-addition:latest"
          

          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "addition" {
  metadata {
    name = "addition"
    namespace = kubernetes_namespace.calculator-application.metadata.0.name
  }

  spec {
    selector = {
      app = "addition"
    }

    port {
      protocol    = "TCP"
      port        = 80
      target_port = 80
    }
  }
}


// Subtraction
resource "kubernetes_deployment" "subtraction" {
  metadata {
    name = "subtraction"
    namespace = kubernetes_namespace.calculator-application.metadata.0.name
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "subtraction"
      }
    }

    template {
      metadata {
        labels = {
          app = "subtraction"
        }
      }

      spec {
        container {
          name  = "subtraction"
          image = "${var.image_name}-subtraction:latest"

          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "subtraction" {
  metadata {
    name = "subtraction"
    namespace = kubernetes_namespace.calculator-application.metadata.0.name
  }

  spec {
    selector = {
      app = "subtraction"
    }

    port {
      protocol    = "TCP"
      port        = 80
      target_port = 80
    }
  }
}

// Multiplication
resource "kubernetes_deployment" "multiplication" {
  metadata {
    name = "multiplication"
    namespace = kubernetes_namespace.calculator-application.metadata.0.name
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "multiplication"
      }
    }

    template {
      metadata {
        labels = {
          app = "multiplication"
        }
      }

      spec {
        container {
          name  = "multiplication"
          image = "${var.image_name}-multiplication:latest"

          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "multiplication" {
  metadata {
    name = "multiplication"
    namespace = kubernetes_namespace.calculator-application.metadata.0.name
  }

  spec {
    selector = {
      app = "multiplication"
    }

    port {
      protocol    = "TCP"
      port        = 80
      target_port = 80
    }
  }
}

// Division
resource "kubernetes_deployment" "division" {
  metadata {
    name = "division"
    namespace = kubernetes_namespace.calculator-application.metadata.0.name
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "division"
      }
    }

    template {
      metadata {
        labels = {
          app = "division"
        }
      }

      spec {
        container {
          name  = "division"
          image = "${var.image_name}-division:latest"

          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "division" {
  metadata {
    name = "division"
    namespace = kubernetes_namespace.calculator-application.metadata.0.name
  }

  spec {
    selector = {
      app = "division"
    }

    port {
      protocol    = "TCP"
      port        = 80
      target_port = 80
    }
  }
}

// Remainder
resource "kubernetes_deployment" "remainder" {
  metadata {
    name = "remainder"
    namespace = kubernetes_namespace.calculator-application.metadata.0.name
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "remainder"
      }
    }

    template {
      metadata {
        labels = {
          app = "remainder"
        }
      }

      spec {
        container {
          name  = "remainder"
          image = "${var.image_name}-remainder:latest"

          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "remainder" {
  metadata {
    name = "remainder"
    namespace = kubernetes_namespace.calculator-application.metadata.0.name
  }

  spec {
    selector = {
      app = "remainder"
    }

    port {
      protocol    = "TCP"
      port        = 80
      target_port = 80
    }
  }
}

// Client
resource "kubernetes_deployment" "client" {
  metadata {
    name = "client"
    namespace = kubernetes_namespace.calculator-application.metadata.0.name
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "client"
      }
    }

    template {
      metadata {
        labels = {
          app = "client"
        }
      }

      spec {
        container {
          name  = "client"
          image = "${var.image_name}-client:latest"
        }
      }
    }
  }
}

