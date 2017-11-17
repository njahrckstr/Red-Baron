# dns-rdir

Creates a DNS Redirector server in AWS.

# Example

```hcl
module "dns_rdir" {
  source = "./modules/linode/dns-rdir"

  dns_c2_ips = ["192.168.0.1"]
}
```

# Arguments

| Name                      | Required | Value Type | Description
|---------------------------| -------- | ---------- | -----------
|`vpc_id`                   | Yes      | String     | ID of VPC to create instance in.
|`subnet_id`                | Yes      | String     | Subnet ID to create instance in.
|`dns_c2_ips`               | Yes      | List       | List of DNS C2 IPs to redirect DNS traffic to.
|`count`                    | No       | Integer    | Number of instances to launch. Defaults to 1.
|`instance_type`            | No       | String     | Instance type to launch. Defaults to "t2.medium"

# Outputs

| Name                      | Value Type | Description
|---------------------------| ---------- | -----------
|`ips`                      | List       | IPs of created instances.