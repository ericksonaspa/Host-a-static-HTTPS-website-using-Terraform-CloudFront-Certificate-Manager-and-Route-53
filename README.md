# Host-a-static-HTTPS-website-using-Terraform-CloudFront-Certificate-Manager-and-Route-53

In this project, we will be hosting a static website on AWS. 

- Automate S3 bucket creation and file uploads for website pages
- Create a domain name and hosted zone with Route 53 
- Request a public certificate for the website using AWS Certificate Manager (ACM)
- Create CloudFront distribution to secure the website in HTTPS
- Configure Route 53 to link the domain name to the CloudFront distribution

Prerequisites: 

- AWS Account
- Terraform installed on your computer
- Visual Studio Code application installed on your computer

For our architecture diagram, kindly refer below: 

![image](https://github.com/ericksonaspa/Host-a-static-HTTPS-website-using-Terraform-CloudFront-Certificate-Manager-and-Route-53/assets/77118362/9914247b-1260-4e53-8de0-a4ddf06e635d)

## Automate S3 bucket creation and file uploads for website pages

1. Download the Terraform (.tf) files from this repository.
2. Open the .tf files with Visual Studio Code application installed on your computer.

![image](https://github.com/ericksonaspa/Host-a-static-HTTPS-website-using-Terraform-CloudFront-Certificate-Manager-WAF-and-Route-53/assets/77118362/b955065d-73d4-44de-b97b-aef8441473a1)

3. Once you are ready, run the terraform init command to initialize our working directory containing Terraform configuration files. This is the first command that should be run after writing a new Terraform configuration or cloning an existing one from version control.

![image](https://github.com/ericksonaspa/Host-a-static-HTTPS-website-using-Terraform-CloudFront-Certificate-Manager-WAF-and-Route-53/assets/77118362/eb689401-6222-4cc6-81a9-a66cf5cb51bd)

4. After the Terraform was successfully initialized, run the **terraform plan** command which creates an execution plan, and lets you preview the changes that Terraform plans to make to your infrastructure.

![image](https://github.com/ericksonaspa/Host-a-static-HTTPS-website-using-Terraform-CloudFront-Certificate-Manager-WAF-and-Route-53/assets/77118362/9b66e4ba-6269-4ad2-8262-238c209d250a)

5. Next, run the **terraform apply** command. This executes the actions proposed in our Terraform plan. To automatically approve the plan that the terraform apply command will generate, you need to pass it the **-auto-approve** flag as an argument when you enter the command.

![image](https://github.com/ericksonaspa/Host-a-static-HTTPS-website-using-Terraform-CloudFront-Certificate-Manager-WAF-and-Route-53/assets/77118362/b3c1db94-5f38-4c94-a978-a4821d452084)

6. If the apply is complete without any issues, let's proceed with checking the resources created. As you can see, the bucket is created. 

![image](https://github.com/ericksonaspa/Host-a-static-HTTPS-website-using-Terraform-CloudFront-Certificate-Manager-WAF-and-Route-53/assets/77118362/4ca6021c-4836-4e8c-a449-bd5c233b5e6d)

See below for your reference of our code: 

![image](https://github.com/ericksonaspa/Host-a-static-HTTPS-website-using-Terraform-CloudFront-Certificate-Manager-WAF-and-Route-53/assets/77118362/8b5c51a2-eed3-495d-b179-ed7e8836d0cf)

![image](https://github.com/ericksonaspa/Host-a-static-HTTPS-website-using-Terraform-CloudFront-Certificate-Manager-WAF-and-Route-53/assets/77118362/639825f2-678c-45b1-b807-c2b7cd70d9e3)

Note: The bucket name was intended to be in a website form in order to work with static website hosting. 

7. Checking on the bucket objects, our two (2) html files were created. 

![image](https://github.com/ericksonaspa/Host-a-static-HTTPS-website-using-Terraform-CloudFront-Certificate-Manager-WAF-and-Route-53/assets/77118362/d98294f1-fbb8-4287-b28a-c2946b5067f9)

See below for your reference of our code: 

![image](https://github.com/ericksonaspa/Host-a-static-HTTPS-website-using-Terraform-CloudFront-Certificate-Manager-WAF-and-Route-53/assets/77118362/e99941f8-92c2-4d29-855f-c936fda309a1)

8. Checking on the Permissions tab, the access was set for **Public** read, and **Block all public access** was set to **Off**. 

![image](https://github.com/ericksonaspa/Host-a-static-HTTPS-website-using-Terraform-CloudFront-Certificate-Manager-WAF-and-Route-53/assets/77118362/fb63ddc7-fc16-4942-a3dd-4d475746c776)

See below for your reference of our code: 

![image](https://github.com/ericksonaspa/Host-a-static-HTTPS-website-using-Terraform-CloudFront-Certificate-Manager-WAF-and-Route-53/assets/77118362/7d3a2173-b022-4fd9-bbbd-de06652fdedb)

![image](https://github.com/ericksonaspa/Host-a-static-HTTPS-website-using-Terraform-CloudFront-Certificate-Manager-WAF-and-Route-53/assets/77118362/30d815b8-9277-43b5-90db-d125a4713bc6)

9. If you scroll down, you'll see that the **Object Ownership** was set to **Bucket owner preferred**. 

![image](https://github.com/ericksonaspa/Host-a-static-HTTPS-website-using-Terraform-CloudFront-Certificate-Manager-WAF-and-Route-53/assets/77118362/5a7a0959-cb67-489d-a7ec-3345fec83506)

See below for your reference of our code: 

![image](https://github.com/ericksonaspa/Host-a-static-HTTPS-website-using-Terraform-CloudFront-Certificate-Manager-WAF-and-Route-53/assets/77118362/a23c495d-2e4d-4d13-b0d2-5cb0e8468baf)

10. Now, go to the **Properties** tab and then scroll down until you reach the bottom. 

![image](https://github.com/ericksonaspa/Host-a-static-HTTPS-website-using-Terraform-CloudFront-Certificate-Manager-WAF-and-Route-53/assets/77118362/961e6ff1-2f3c-4f8f-9c3c-1d8a14fc7a82)

Copy the link provided for our static website: 

![image](https://github.com/ericksonaspa/Host-a-static-HTTPS-website-using-Terraform-CloudFront-Certificate-Manager-WAF-and-Route-53/assets/77118362/0a22d6b2-93bc-4457-992c-32a35cfe3574)

11. On the new tab, paste the link. As you can see, we have successfully created our static website: 

![image](https://github.com/ericksonaspa/Host-a-static-HTTPS-website-using-Terraform-CloudFront-Certificate-Manager-WAF-and-Route-53/assets/77118362/93fd9e1d-ab02-4002-8c3b-d98f5b19b58d)

## Create a domain name and hosted zone with Route 53 

For the step-by-step instructions on how to create and register a new domain with Route 53, you may refer to the AWS Documentation: [Registering a new domain](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/domain-register.html)

In my case, my registered domain is the same as my S3 bucket name: 

![image](https://github.com/ericksonaspa/Host-a-static-HTTPS-website-using-Terraform-CloudFront-Certificate-Manager-WAF-and-Route-53/assets/77118362/103657cb-4c6d-4a90-b0cd-e8c4c1d61cb3)

## Request a public certificate for the website using AWS Certificate Manager (ACM)

For the step-by-step instructions on how to request a public certificate for your website, you may refer to the AWS Documentation: [Request a public certificate using the console](https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-request-public.html)

In my case, I have already requested a public certificate for my website. 

![image](https://github.com/ericksonaspa/Host-a-static-HTTPS-website-using-Terraform-CloudFront-Certificate-Manager-WAF-and-Route-53/assets/77118362/9e306648-1b55-450f-87fd-a35697e6aef1)

![image](https://github.com/ericksonaspa/Host-a-static-HTTPS-website-using-Terraform-CloudFront-Certificate-Manager-WAF-and-Route-53/assets/77118362/e72a57bd-3129-4de8-9ac1-7e8a48143945)

![image](https://github.com/ericksonaspa/Host-a-static-HTTPS-website-using-Terraform-CloudFront-Certificate-Manager-WAF-and-Route-53/assets/77118362/c0770c56-5cd0-45b9-8736-e61d050167b6)

## Create CloudFront distribution to secure the website in HTTPS

1. From your console, search for the **CloudFront** and then open it in a new tab. 

![image](https://github.com/ericksonaspa/Host-a-static-HTTPS-website-using-Terraform-CloudFront-Certificate-Manager-WAF-and-Route-53/assets/77118362/64c67e36-0835-4ddf-92ec-bd397b96de18)

2. On the Amazon CloudFront, click on the **Create CloudFront distribution**. 

![image](https://github.com/ericksonaspa/Host-a-static-HTTPS-website-using-Terraform-CloudFront-Certificate-Manager-WAF-and-Route-53/assets/77118362/2917d963-7263-416f-9d30-fecaa97c3bd3)

3. On the **Origin domain** field, enter our s3 static website link (but only copy after the 2 slashes). Go back to the S3, **Properties > Static website hosting**. 

![image](https://github.com/ericksonaspa/Host-a-static-HTTPS-website-using-Terraform-CloudFront-Certificate-Manager-WAF-and-Route-53/assets/77118362/7edfecd2-f253-4c83-83b8-654d290e8482)

![image](https://github.com/ericksonaspa/Host-a-static-HTTPS-website-using-Terraform-CloudFront-Certificate-Manager-WAF-and-Route-53/assets/77118362/ca458474-5fdc-493a-919b-cd1197375a01)

4. On the **Default cache behavior**, look for **Viewer protocol policy**. Select the **Redirect HTTP to HTTPS**.

![image](https://github.com/ericksonaspa/Host-a-static-HTTPS-website-using-Terraform-CloudFront-Certificate-Manager-WAF-and-Route-53/assets/77118362/ec5886c9-dda6-443c-8420-0ff20e76b96b)

5. Scroll down, under **Settings**, look for the **Alternate domain name (CNAME) - optional** and then click the **Add item**. Add the registered domain for your website. 

![image](https://github.com/ericksonaspa/Host-a-static-HTTPS-website-using-Terraform-CloudFront-Certificate-Manager-WAF-and-Route-53/assets/77118362/47d01e81-cd54-49cf-bdf5-d257f10f39ad)

6. Under the **Custom SSL certificate - optional**, choose the public certificate we requested with the AWS Certificate Manager earlier. 

![image](https://github.com/ericksonaspa/Host-a-static-HTTPS-website-using-Terraform-CloudFront-Certificate-Manager-WAF-and-Route-53/assets/77118362/496db8d9-5033-486f-a7ef-8a018bcb335d)

![image](https://github.com/ericksonaspa/Host-a-static-HTTPS-website-using-Terraform-CloudFront-Certificate-Manager-WAF-and-Route-53/assets/77118362/095c8307-f68a-4a2f-b0c0-e0dbe79c4a33)

7. Scroll down and then hit the **Create distribution**. 

![image](https://github.com/ericksonaspa/Host-a-static-HTTPS-website-using-Terraform-CloudFront-Certificate-Manager-WAF-and-Route-53/assets/77118362/c4fd7735-afd5-4607-b85b-38e640e4c250)

8. You have successfully created your CloudFront distribution with AWS WAF (Web Application Firewall).

![image](https://github.com/ericksonaspa/Host-a-static-HTTPS-website-using-Terraform-CloudFront-Certificate-Manager-WAF-and-Route-53/assets/77118362/7745a9de-7a02-4988-a85e-a565f9c1b9d2)

9. Wait for a few minutes until the **Last modified** status changes from **Deploying** to the current date and time. 

![image](https://github.com/ericksonaspa/Host-a-static-HTTPS-website-using-Terraform-CloudFront-Certificate-Manager-WAF-and-Route-53/assets/77118362/b2a1f7a8-a8e8-431f-961a-1309e007f23f)

Copy the Distribution domain name in a new browser tab, it should work and appear like this. 

![image](https://github.com/ericksonaspa/Host-a-static-HTTPS-website-using-Terraform-CloudFront-Certificate-Manager-WAF-and-Route-53/assets/77118362/82b1cae1-8b5c-4508-a0fd-e0f5114b0300)

The next thing that we would have to do is to link or associate our registered domain to our CloudFront distribution. 

## Configure Route 53 to link the domain name to the CloudFront distribution

1. Go back to the **Route 53 > Hosted zones**, click your registered domain. 

![image](https://github.com/ericksonaspa/Host-a-static-HTTPS-website-using-Terraform-CloudFront-Certificate-Manager-WAF-and-Route-53/assets/77118362/76d0e29b-7f4d-4208-889a-b44b405fa773)

2. Under Records, click **Create Record**. 

![image](https://github.com/ericksonaspa/Host-a-static-HTTPS-website-using-Terraform-CloudFront-Certificate-Manager-WAF-and-Route-53/assets/77118362/de692f79-9ab6-46f2-bb7f-7280263fbf3d)

3. On the Routing policy, select the **Simple routing** and click **Next**. 

![image](https://github.com/ericksonaspa/Host-a-static-HTTPS-website-using-Terraform-CloudFront-Certificate-Manager-WAF-and-Route-53/assets/77118362/0de8e8b3-3a69-460a-8b96-5c2a443ec2d2)

4. On the **Configure records > Simple routing records to add to (your registered domain...)**, click the **Define simple record**. 

![image](https://github.com/ericksonaspa/Host-a-static-HTTPS-website-using-Terraform-CloudFront-Certificate-Manager-WAF-and-Route-53/assets/77118362/1d809c36-c39b-4792-8bea-5f3f021dc8c0)

5. Leave the subdomain field blank and the default value for the **Record type**. On the **Value/Route traffic to**, select **Alias to CloudFront distribution**. Under the **Choose distribution**, select the cloudfront distribution link we created earlier. Once done, click the **Define simple record**. 

![image](https://github.com/ericksonaspa/Host-a-static-HTTPS-website-using-Terraform-CloudFront-Certificate-Manager-WAF-and-Route-53/assets/77118362/cf14e1f7-5517-4518-8375-2bcbfa947e72)

6. Back on the **Configure records > Simple routing records to add to (your registered domain...)**, click the **Create records**. 

![image](https://github.com/ericksonaspa/Host-a-static-HTTPS-website-using-Terraform-CloudFront-Certificate-Manager-WAF-and-Route-53/assets/77118362/dae4f09a-e9a6-4ffe-823b-104b425ef9b3)

7. We have successfully created the record for our website with our cloudfront distribution. 

![image](https://github.com/ericksonaspa/Host-a-static-HTTPS-website-using-Terraform-CloudFront-Certificate-Manager-WAF-and-Route-53/assets/77118362/72167607-04fc-4ad8-84d0-7ca22ab830ef)

8. To test, open a new browser tab and enter the domain of your website. 

![image](https://github.com/ericksonaspa/Host-a-static-HTTPS-website-using-Terraform-CloudFront-Certificate-Manager-WAF-and-Route-53/assets/77118362/345cbfc8-837f-40da-995b-bad2e0b09497)

Congratulations! You have finished this project and learned the uses of multiple AWS services. Don't forget to delete the resources we have created with AWS WAF, Route 53, and Cloudfront. 

To remove or delete the resources we have made with Terraform, just go back to your Visual Studio Code and then enter the **terraform apply -destroy** command. 

![image](https://github.com/ericksonaspa/Host-a-static-HTTPS-website-using-Terraform-CloudFront-Certificate-Manager-WAF-and-Route-53/assets/77118362/f2a6d9d1-40c6-4b68-8f4a-cdbcd479fb08)

Confirm with **yes**. 

![image](https://github.com/ericksonaspa/Host-a-static-HTTPS-website-using-Terraform-CloudFront-Certificate-Manager-WAF-and-Route-53/assets/77118362/72f5912b-ec4a-432f-bf53-24a714f28be0)

A confirmation should show that the apply is completed and the resources are destroyed. 

![image](https://github.com/ericksonaspa/Host-a-static-HTTPS-website-using-Terraform-CloudFront-Certificate-Manager-WAF-and-Route-53/assets/77118362/870d99dc-08bd-4208-8d96-d97ecefa9228)

Checking on the Amazon S3, our bucket should be deleted with its objects. 

![image](https://github.com/ericksonaspa/Host-a-static-HTTPS-website-using-Terraform-CloudFront-Certificate-Manager-WAF-and-Route-53/assets/77118362/1a03ee97-b5f1-433b-aec7-f6e9a6d41f36)
