Creating a new machine
======================

# In the GCP Console

## Machine Images
This is a machine image of a fully working Clara SDK setup

Go to: https://console.cloud.google.com/compute/machineImages?project=august-water-273617&instancessize=50&machineImageTablesize=50

## Create a VM from an image
Next to the machine image you want to use to create a VM, click on the three dots on the right and then click on `Create VM`.

## Create an Instance configuration
This only describe options you should adjust:

* Name: set a name for this VM
* Machine Type: This is the size of the machine in terms of CPU and Memory
* CPU Platform and GPU: Change how many GPUs you want to use

## Connecting to the machine

### (Optional) Install gcloud cli
The `gcloud` CLI will help you to ssh into the machine.

Install instructions: https://cloud.google.com/sdk/docs/quickstarts

### Connect to the machine
Go to the VM Instance page: https://console.cloud.google.com/compute/instances?project=august-water-273617&instancessize=50

Click on the name of the machine you have just created.

Near the top there is a ` Remote access` option and the `SSH` has a drop down menu.  Click on the drop down menu.

There are various ways you can "ssh" into the machine.  You can do it via the browser or use the `gcloud` CLI tool.



