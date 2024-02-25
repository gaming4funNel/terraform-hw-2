variable "vm_web" {
  type = object({
    name               = string
    platform_id        = string
    zone               = string
    #resources          = object({
    #  cores            = number
    #  memory           = number
    #  core_fraction    = number
    #})
    scheduling_policy = object({
      preemptible      = bool
    })
    network_interface = object({
      nat              = bool
    })
    metadata          = object({
      serial-port-enable = number
    })
  })

  default = {
    name              = "netology-develop-platform-web"
    platform_id       = "standard-v1"
    zone              = "ru-central1-a"
    #resources         = {
    # cores           = 2
    #  memory          = 1
    #  core_fraction   = 5
    #}
    scheduling_policy = {
      preemptible     = true
    }
    network_interface = {
      nat             = true
    }
    metadata          = {
      serial-port-enable = 1
    }
  }
}

variable "vm_db_" {
  type = object({
    name               = string
    platform_id        = string
    zone               = string
    #resources          = object({
    #  cores            = number
    #  memory           = number
    #  core_fraction    = number
    #})
    scheduling_policy = object({
      preemptible      = bool
    })
    network_interface = object({
      nat              = bool
    })
    metadata          = object({
      serial-port-enable = number
    })
  })

  default = {
    name              = "netology-develop-platform-db"
    platform_id       = "standard-v1"
    zone              = "ru-central1-b"
    #resources         = {
    #  cores           = 2
    #  memory          = 2
    #  core_fraction   = 20
    #}
    scheduling_policy = {
      preemptible     = true
    }
    network_interface = {
      nat             = true
    }
    metadata          = {
      serial-port-enable = 1
    }
  }
}

variable "vms_resources" {
  type = map(object({
    cores = number
    memory = number
    core_fraction = number
  }))
  default = {
    web = {
      cores = 2
      memory = 1
      core_fraction = 5
    }
    db = {
      cores = 2
      memory = 2
      core_fraction = 20
    }
  }
}

variable "project" {
  type        = string
  default     = "netology-develop-local-platform"
  description = "Name project"
}

variable "instance" {
  type = object({
    db   = string
    web  = string
  })
  default = {
    db   = "db"
    web  = "web"
  }
  description = "Instances names"
}

variable "metadata" {
  type = map
  default = {
    serial-port-enable = 1
    ssh-keys = "ssh-rsa ----------"
  }
}