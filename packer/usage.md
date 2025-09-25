1. Export AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY
    ```
    $ export AWS_ACCESS_KEY_ID="YOUR_ACCESS_KEY_ID"
    $ export AWS_SECRET_ACCESS_KEY="YOUR_SECRET_ACCESS_KEY"
    ```
1. Copy variables file
    ```
    $ cp variables.pkrvars.hcl.sample variables.pkrvars.hcl
    ```
1. Set ssh key file path
    ```
    $  vi variables.pkrvars.hcl
    ```
1. Initialize Packer configuration
    ```
    $ packer init .
    ```
1. Validate Packer template
    ```
    $ packer validate -var-file=variables.pkrvars.hcl .
    ```
1. Build Packer image
    ```
    $ packer build -var-file=variables.pkrvars.hcl .
    ```