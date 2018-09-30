provider "google" {
    credentials = "${file("${var.account_credentials}")}"
    project = "${var.project_id}"
    region = "${var.region}"
}

data "template_file" "setup_nginx" {
    template = "${file("${var.nginx_setup_file}")}"
}

resource "google_compute_instance" "nginx" {
    name = "nginx-web"
    machine_type = "f1-micro"
    zone = "us-central1-c"
    tags = ["http-server"]

    boot_disk {
        initialize_params {
            image = "${var.image_name}"
        }
    }

    network_interface {
        network = "default"
        access_config {

        }
    }

    metadata_startup_script = "${data.template_file.setup_nginx.rendered}"
}