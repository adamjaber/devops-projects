resource "kubernetes_namespace" "namespace" {
  metadata {
    name = var.namespace
  }
}

// Calculator
resource "kubernetes_deployment" "calculator" {
  metadata {
    name = "calculator"
    namespace = kubernetes_namespace.namespace.metadata.0.name
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
          image = "" # add calculator image

          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "calculator" {
  metadata {
    name = "calculator"
    namespace = kubernetes_namespace.namespace.metadata.0.name
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
  }
}


// Addition
resource "kubernetes_deployment" "addition" {
  metadata {
    name = "addition"
    namespace = kubernetes_namespace.namespace.metadata.0.name
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
          image = "" # add addition image

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
    namespace = kubernetes_namespace.namespace.metadata.0.name
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
    namespace = kubernetes_namespace.namespace.metadata.0.name
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
          image = "" # add subtraction image

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
    namespace = kubernetes_namespace.namespace.metadata.0.name
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
    namespace = kubernetes_namespace.namespace.metadata.0.name
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
          image = "" # add multiplication image

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
    namespace = kubernetes_namespace.namespace.metadata.0.name
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
    namespace = kubernetes_namespace.namespace.metadata.0.name
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
          image = "" # add division image

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
    namespace = kubernetes_namespace.namespace.metadata.0.name
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
    namespace = kubernetes_namespace.namespace.metadata.0.name
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
          image = "" # add division image

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
    namespace = kubernetes_namespace.namespace.metadata.0.name
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
    namespace = kubernetes_namespace.namespace.metadata.0.name
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
          image = "" # add client image
        }
      }
    }
  }
}
