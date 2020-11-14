## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

https://github.com/jerrygbotoe/Elk-Stack-Project/blob/main/Diagrams/Redteam_Network_diagram.png

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the _____ file may be used to install only certain pieces of it, such as Filebeat.

- Install-elk.yml
- filebeat_playbook.yml
  

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

- Load balancing ensures that the application will be highly efficient, in addition to restricting traffic to the network.
- The load balancer add additional layers of security to the website without any changes to your application. It protects against DDoS attack, authenticate user access, protect applications from emerging threats, and simplify PCI compliance. It is resilience, scalable and reduce the load on your web servers and optimize traffic for a better user experience. 
The advantage of a Jumpbox is that it is a hardened and monitored device that spans two dissimilar security zones and provides a controlled means of access between them. It is typically placed between a secure zone and a DMZ to provide transparent management of devices on the DMZ once a management session has been established. It acts as a single audit point for traffic and also a single place where user accounts can be managed.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the logs and system files.
- Filebeat watches for log files as well as specific locations. It will collect those logs and send them to Elasticsearch. 
- Metricbeat records metrics from your operating system. 

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.4   | Linux            |
| VM -1    | Web-1    | 10.0.0.5   | Linux            |                  
| VM -2    | Web-2    | 10.0.0.6   | Linux            |                  
| VM -3    | Web-3    | 10.0.0.7   | Linux            |                  

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box  machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- 76.115.3.135

Machines within the network can only be accessed by Jump Box.
- The only machine allow to access ELK VM is the Jump Box. It IP address is 10.0.0.4

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box |     No              |  76.115.3.135        |
|          |                     |                      |
|          |                     |                      |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- The advantage of running the Ansible file is that,  it automatically configures all the machines in a certain group without the need to manually go into each machine and doing it one by one. 
The playbook implements the following tasks:
- Docker.io will be installed
- Install python interpreter
- Download and launch a docker web container



The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

https://github.com/jerrygbotoe/Elk-Stack-Project/blob/main/Diagrams/Docker%20PS.png

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- 10.0.0.5
- 10.0.0.6
- 10.0.0.7

We have installed the following Beats on these machines:
- Filebeats and Metricbeats
- We have installed them on VM-1 -(Web-1), VM-2 -(Web-2),  and VM-3 - (Web-3)

These Beats allow us to collect the following information from each machine:
- Filebeats - Monitors log files and sends them to Logstash
- Metricbeats - Collects metrics from services and the actual operating system runningon the server

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the Install-elk.yml file to /etc/ansible.
- Update the hosts file to include the IP addresses for the ELK VM in the [ELK] Group
- Run the playbook, and navigate to elk_server_ip:5601 to check that the installation worked as expected.

- The playbook is the Install-elk.yml You copy that and install it in /etc/ansible
- You will have to update the Hosts file. When updating the hosts file, you will be able to pick or chose which groups and VMs you want the changes to take effect on.
- You will navigate to this URL  VM_Public_IP:5601/app/kibanado in order to confirm that the ELK server is running

