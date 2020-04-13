project = "my-terra-project-9323"
credentials_file = "../Documents/My TERRA Project 9323-dfb7cadc4e50.json"
cidrs = [ "10.0.0.0/16", "10.1.0.0/16" ]

region = "us-central1"

machine_types = {
  dev  = "f1-micro"
  test = "n1-highcpu-32"
  prod = "n1-highcpu-32"
}