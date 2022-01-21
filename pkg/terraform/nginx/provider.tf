terraform {
  required_providers {
    nginx = {
      source  = "getstackhead/nginx"
      version = "1.3.2"
    }

    sys = {
      source  = "mildred/sys"
      version = "1.3.33"
    }
  }
}

