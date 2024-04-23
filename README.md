# a_storage_solution

ACIT4430 - Project 2
 

Similarly to the case with Project 1, the following is a list of project options available as Project 2 in ACIT4430. Each group will ONLY CHOSE ONE of these projects. Please remember to adhere to the instructions which are relevant for all projects.

Completing the project constitutes of:

-  Defining and documenting a workflow for all operations involved in deploying a environment of the kind in question

-  Setting up a deployment environment in order to receive deployment requests relative to one of the four alternatives below

-  Completing at least three requests for an environment of the kind you decided on. For example, if you choose alternative 1: A Kubernetes developer environment, you have to deploy that environment three times to be considered successful.

-  Conducting an experiment where two students (a group) will attempt to deploy the environment based on your workflow and written report

-  Writing and submitting the report, documenting the deployment environment as well as the result from completing requests and in line with the instructions below

-  Conducting peer assessment and provide feedback on two student reports
 

General report and submission instructions
HAND IN THE PROJECT AS A GROUP. Create a group under "companies" and use that when handing in your report. Only one of the group members should submit, not both.

The report should not exceed 12 pages, but no strict penalty will be enforced if it does

A note on plagiarism: It is strictly forbidden to reuse other peoples' work without referencing to it! You can't reference each-others' work within this course. It is allowed to use external sources and materials, including tutorials and blogs, but remember to put a reference to the reused text every time it is done so. It is not something new that students attempt to ignore the aforementioned, and every such misconduct will have severe consequences.

The report is to be submitted as a PDF in the hand-in folder in the canvas platform

All reports should contain two following sections:

Workflow design
How the workflow is mapped in KanBan and its justification
As part of the workflow is a technical documentation of the operations. This should be on a level of detail so that a junior could repeat the steps. (This means you can assume some familiarity with the OpenStack cloud, configuration management, virtualization, container orchestration etc.)
Workflow test
The workflow is tested by simulating it three times from start to finish.
A discussion on the implemented solution and whether there were drawbacks and what could be improved?
Looking at the time history of the WIPs belonging to this project, what was the average time for a complete environment deployment?
Experiment result
The result from when two different users attempted to complete the same workflow
Remember that the term workflow refers to the set of operations that go into deploying the environment, not setting up your infrastructure. It should be a guide for a junior sysadmin to follow if they would complete the task for you with as little help from your side as possible. If the junior needs your assistance in the deployment process, this should also be documented into the report.
 

Technical instructions
We assume to find proof of each of the following in the report:

All deployed servers are to be controlled by a central configuration management system (you can use Terraform, Puppet or Ansible to deploy and provision the VMs as per your Project 1 - but you do not need to write and describe your workflow for this because you already did so in Project 1). Tip: You can use Kubernetes "taints" and "tolerations" to decide what is installed and on which node specifically.
All deployed servers should allow key-based login from your master server. Add the following keys in your autorized_keys file so your homework can be inspected: https://github.com/brunodzogovic.keysLinks to an external site. 
The Safespring cloud is to be used for the deployments
You can use online resources as tutorials, but if you explicitly copy-paste text, make sure it's referenced otherwise it will be considered as plagiarism!
There should be namespaces, deployments, configmaps and persistent volumes for your services in the cluster
Each deployed Kubernetes service set, daemon set or replica set etc., should be explained in the report
One should strive to make as much of the deployment managed by the configuration management system or the container orchestrator if you are deploying in microservices model. If some elements are unable to be automated, it should be pointed out in the report. Also, if you manage to deploy some things manually instead, this should also be documented within the report. The most points you get in case when the most of the job done is automated and with as little manual work as possible. 
You will need a Dockerhub account. Create one if you don't in order to push/pull images and save your working configuration in case something goes wrong.
Remember to back up your configuration files, YAML and similar. Even by copy-pasting from the cloud instances to your local notepad in the laptop.
The configuration files should be submitted into the report as an APPENDIX chapter at the end of the file. Failing to do so, will result in rendering the Project 2 invalid.\
REQUIREMENTS:
The deployed Kubernetes environment should be subject to Prometheus monitoring. If you have installed Sensu and monitoring your underlying infrastructure, then integrating the Sensu metrics with Prometheus will give you extra points.
Kubernetes and Docker should be installed automatically using Puppet. For example, adding a class that does this on your Master node and adds the Worker nodes. You can install them manually as well, but most points go to the ones who can manage to automate the process.
All services in the deployed environment should send log messages to a central logging location. Elastic Stack has a flawless integration with Kubernetes and container environments.
Services should have logging separately from your servers (this is when you monitor your containers and applications running within). In Project 2, you do not monitor and log the OpenStack instances, but what's running on top of Kubernetes.
All servers in the deployed environment should be connected to a backup system. There are many tools that work great for Kubernetes like Valero or Kasten K10, you don't have to use Bacula.
 

Experiment instructions
In a group of two students, you will find another group with two students and ask them to complete a deployment in your infrastructure. The case is that they are newly employed sysadmins and are given a task by you to deploy an environment.

Their task is NOT to create a new infrastructure (master, puppet, foreman etc) but to use what you have created by following your documentation on their own infrastructure. Each of the group members will conduct the experiment once for one of the other group members, so that a total of two deployments have taken place and that both group members have tried to be the senior sysadmin.

The experiment will have the following structure:

The junior is handed the task and documentation. They will find the task as a WIP in your trello board (you have to add them). Mark down the time as «START».

The senior will follow and look on as he junior attempts to complete the task. The senior will count every time a question is asked by the junior. The Senior will off course help, but NOT by taking over the keyboard of the junior. Imagine they are in two different locations and will have to find other means to collaborate. The number of questions is recorded as «PREDEPLOY_QUESTIONS».

When the actual deploy has started, the junior will let the senior know and this is recorded as the «DEPLOY_START» time.

If there are any questions during the deployment, this will be dealt with the same way as before, but recorded as «DEPLOY_QUESTIONS»

Once the deploy has been verified as working, the time is recorded as «DEPLOY_STOP»

A short commentary is added at the end where the results are discussed and compared to your own tests before.


**Task**
Alternative 3 - A storage solution
The media department from the company requires a storage solution via Kubernetes. They need:
Ceph storage that can scale, orchestrated with Rook Links to an external site.
Distributed persistent volumes in Kubernetes
Data should be replicated to all worker nodes in the cluster excluding the master node
If you're using the storage solution to save monitoring data from Prometheus/Sensu or adjacent systems, then the Observability Stack Links to an external site. is recommended
