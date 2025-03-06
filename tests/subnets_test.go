package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

type subnet struct {
	name        string
	description string
	newbits     int
	netnum      int
}

func TestTerraformSubnets(t *testing.T) {

	// TODO
	// subnets := []subnet{
	// 	{
	// 		name:        "subnet1",
	// 		description: "First subnet",
	// 		newbits:     12,
	// 		netnum:      4091,
	// 	},
	// 	{
	// 		name:        "subnet2",
	// 		description: "Second subnet",
	// 		newbits:     12,
	// 		netnum:      4092,
	// 	},
	// 	{
	// 		name:        "subnet3",
	// 		description: "Third subnet",
	// 		newbits:     12,
	// 		netnum:      4093,
	// 	},
	// }

	// retryable errors in terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../example/",
		// Vars: map[string]interface{}{
		// 	"subnets_list": subnets,
		// },
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	output := terraform.Output(t, terraformOptions, "subnets")
	assert.Contains(t, output, "subnet-test-4091")
}
