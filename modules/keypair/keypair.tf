resource "aws_key_pair" "generated" {
  key_name   = "vijaykey1"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAlBiVOg5OSTh9dpc/wZbTv6K0NGX8Ojso1UDnvhrivm+LCTniJVFVFnICsl9XVGzelHYmFBfRLjhVt+AoYOSUNmSAERpI7ELAserKM2r2e2yWkd56UfQaqMfukgZpb63A0rdQKj7BqNauINF72y/zftNudwsqtrZJPte6FWVk0r4xpafAEPomPAZpfUuoNvxqJuSgRMdzoR1L/H6aQFPuA01eGcxnHM+qODheY8mfkQvNMhdoDr6mqdnzG9BTd4N9FrQwA7IBAljUYTC7E8601KYBB76P1nZEHZedDkALgTLOOCUS9wIQSJkT15ZciECbDQr8RUwO2jLwQM5DX5BG6w== rsa-key-20201221"
}

output "keypairid" {
  value = "vijaykey1"
}
