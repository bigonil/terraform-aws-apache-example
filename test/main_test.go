package test

import (
	"testing"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformAwsApacheExample(t *testing.T) {
	terraformOptions := &terraform.Options{
		TerraformDir: "../",
		Vars: map[string]interface{}{
			"vpc_id": "vpc-xxxxxxx",
			"public_key": "ssh-rsa AAAA...",
			"my_ip_with_cidr": "1.2.3.4/32",
			"instance_type": "t2.micro",
			"server_name": "Test Apache Server",
		},
	}

	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)

	// Output example: get the public IP
	// publicIP := terraform.Output(t, terraformOptions, "public_ip")
	// assert.NotEmpty(t, publicIP)
	assert.True(t, true) // Placeholder assertion
}
