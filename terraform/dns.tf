resource "aws_route53_record" "server" {
  zone_id = data.aws_route53_zone.dexcraft_net.id
  name    = "server.dexcraft.net"
  type    = "A"
  ttl     = "300"
  records = [aws_eip.fixed_ip.public_ip]
}

data "aws_route53_zone" "dexcraft_net" {
  name = "dexcraft.net."
}

resource "aws_eip" "fixed_ip" {
  instance = local.server_id
  vpc      = true
}