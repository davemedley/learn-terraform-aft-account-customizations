# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: MIT-0
variable "vpc" {
  type = object({
    private_subnets    = list(string)
    public_subnets     = list(string)
    enable_nat_gateway = bool
    cidr               = string
  })
  default = {
    private_subnets    = ["10.1.3.0/24", "10.1.4.0/24"]
    public_subnets     = ["10.1.1.0/24", "10.1.2.0/24"]
    enable_nat_gateway = true
    cidr               = "10.1.0.0/16"
  }
}

variable "region" {
  description = "AWS region to use for deployment"
  type        = string
  default     = "us-west-2"
}

variable "embedding_model_id" {
  description = "Model id of the Amazon Bedrock embedding to use for data ingestion"
  type        = string
  default     = "amazon.titan-embed-text-v2:0"
}

variable "text_generation_model_ids" {
  description = "Model ids of the Amazon Bedrock text generation model to use in the retrieval chain"
  type        = list(string)
  default     = [
    "anthropic.claude-3-sonnet-20240229-v1:0"
  ]
}
