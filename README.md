# flugel-application
To run the project you must have Terraform 1.0.5 and go 1.17 or later.

Pre-Conditions-1: Ensure you have default-vpc in that respective region
Pre-Conditions-2: Ensure AMI you are provisioning exists in that region if not update AMI ID in `module/ec2/main.tf`
Pre-Conditions-3: Verify your AWS Credentials in $HOME/.aws/credentials

into test folder and run:
```
go test
```

## Project structure
```
/main -> uses module to create a main environment resources
/module -> defines simple parametrized modules
/test -> contains tests for main environment
```
