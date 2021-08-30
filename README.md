# R_ORELLANA-Linux-Ansible-and-Diagrams
Ansible YAML Cloud Security, Bash Scripts Linux System Administration, Diagrams Cloud Security and Networking
## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

!(Images/ROSA ORELLANA Red Team Diagram.jpg)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the yml file may be used to install only certain pieces of it, such as Filebeat.


---
- name: Installing and Launch Filebeat
  hosts: webservers
  become: yes
  tasks:
    # Use command module
  - name: Download filebeat .deb file
    command: curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/f$
    # Use command module
  - name: Install filebeat .deb
    command: dpkg -i filebeat-7.4.0-amd64.deb
    # Use copy module
  - name: Drop in filebeat.yml
    copy:
      src: /etc/ansible/files/filebeat-config.yml
      dest: /etc/filebeat/filebeat.yml
    # Use command module
  - name: Enable and Configure System Module
    command: filebeat modules enable system
    # Use command module
  - name: Setup filebeat
    command: filebeat setup
    # Use command module
  - name: Start filebeat service
    command: service filebeat start
    # Use systemd module
  - name: Enable service filebeat on boot
    systemd:
      name: filebeat
      enabled: yes

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.
- What aspect of security do load balancers protect? What is the advantage of a jump box?
Load balancers protect the system from DDoS attacks. The jump box gives access to users from a single node where all admins first connect before launching any administrative tasks which can be secured and monitored.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the jumpbox and system network.
- What does Filebeat watch for?
Filebeat monitors the log files or locations that you specify, collects log events, and forwards them either to Elasticsearch or Logstash for indexing.
- What does Metricbeat record?
It records metrics and statistics from the operating system. 

The configuration details of each machine may be found below.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.4   | Linux            |
| Web-1    | Subnet   | 10.0.0.5   | Linux            |
| Web-2    | Subnet   | 10.0.0.7   | Linux            |
| Elk      | Server   | 10.1.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the jumpbox machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
172.88.149.32

Machines within the network can only be accessed by jumpbox.
- Which machine did you allow to access your ELK VM? What was its IP address?
Red Team Jumpbox @ 10.0.0.4

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes                 | 10.0.0.5 10.0.0.7    |
| Web-1    | No                  | LB 51.141.186.154    |
| Web-2    | No                  | LB 51.141.186.154    |
|LoadBalancer| Yes               |                      |
| Elk      | Yes                 | 10.0.0.0/16.         |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- What is the main advantage of automating configuration with Ansible?
The main advantage of automating configuration with Ansible is that you save time. With Asnible, you can configure machines of a specific server and reduce configuration errors. 

The playbook implements the following tasks:
- Install docker.io
- Install pip3
- Install Docker python module
- Use more memory sysctl
- Download and launch elk container

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

!(Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
-10.0.0.5, 10.0.0.7, and 10.1.0.4

We have installed the following Beats on these machines:
-Filebeat and Metricbeat

These Beats allow us to collect the following information from each machine:
-Filebeat monitors log files or locations that you specify. Filebeat can handle logs such as audit logs, server logs and slow logs. Metricbeat records metrics and specifics from the operating system. There are various options you can specify with metricbeat such as minimum log level; one for debug, info, warning, or error. 

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the _elk.yml_ file to _/etc/ansible_.
- Update the _hosts_ file to include... the attribute and destination IP
- Run the playbook, and navigate to _http://20.150.143.68:5601/app/kibana_ to check that the installation worked as expected.


-Which file is the playbook? Where do you copy it?
elk.yml and copy to /etc/ansible
-Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?
Update host file to include attribute and destination IP.
-Which URL do you navigate to in order to check that the ELK server is running? 
http://20.150.143.68:5601/app/kibana

_Specific commands the user will need to run to download the playbook and update the files.

Download the Playbook
-SSH into Jumpbox
-Start and Launch Ansible container
-CD to /etc/ansible
-Enter command ansible-playbook elk.yml
Visit http://20.150.143.68:5601/app/kibana to check installation

To Update Playbook
-SSH into Jumpbox
-Start and Launch Ansible container
-CD to /etc/ansible
-Nano elk.yml

<img width="1224" alt="docker_ps_output" src="https://user-images.githubusercontent.com/78942053/128792537-4f3f8976-92b5-4b1f-a273-b99015baacaf.png">
![ROSA ORELLANA Red Team Diagram](https://user-images.githubusercontent.com/78942053/128792540-3bbe9785-1423-452b-8798-f1c5b6989a4f.jpg)


