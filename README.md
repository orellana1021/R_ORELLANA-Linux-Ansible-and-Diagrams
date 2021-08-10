# R_ORELLANA-Linux-Ansible-and-Diagrams
Ansible YAML Cloud Security, Bash Scripts Linux System Administration, Diagrams Cloud Security and Networking
## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![TODO: Update the path with the name of your diagram](Images/ROSA ORELLANA Red Team Diagram.jpg)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the _yml_ file may be used to install only certain pieces of it, such as Filebeat.

  - _TODO: Enter the playbook file.

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

Load balancing ensures that the application will be highly __available_, in addition to restricting _access_ to the network.
- _TODO: What aspect of security do load balancers protect? What is the advantage of a jump box?_
Load balancers protect the system from DDoS attacks. The jump box gives access to users from a single node where all admins first connect before launching any administrative tasks which can be secured and monitored.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the _jumpbox_ and system _network_.
- _TODO: What does Filebeat watch for?_Filebeat monitors the log files or locations that you specify, collects log events, and forwards them either to Elasticsearch or Logstash for indexing.
- _TODO: What does Metricbeat record?_It records metrics and statistics from the operating system. 

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.4   | Linux            |
| Web-1    | Subnet   | 10.0.0.5   | Linux            |
| Web-2    | Subnet   | 10.0.0.7   | Linux            |
| Elk      | Server   | 10.1.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the _jumpbox_ machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- _TODO: Add whitelisted IP addresses_172.88.149.32

Machines within the network can only be accessed by _jumpbox_.
- _TODO: Which machine did you allow to access your ELK VM? What was its IP address?_Red Team Jumpbox @ 10.0.0.4

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
- _TODO: What is the main advantage of automating configuration with Ansible?_The main advantage of automating configuration with Ansible is that you save time. With Asnible, you can configure machines of a specific server and reduce configuration errors. 

The playbook implements the following tasks:
- _TODO: In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc._
- Install docker.io
- Install pip3
- Install Docker python module
- Use more memory sysctl
- Download and launch elk container

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![TODO: Update the path with the name of your screenshot of docker ps output](Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- _TODO: List the IP addresses of the machines you are monitoring_ 10.0.0.5, 10.0.0.7, and 10.1.0.4

We have installed the following Beats on these machines:
- _TODO: Specify which Beats you successfully installed_ Filebeat and Metricbeat

These Beats allow us to collect the following information from each machine:
- _TODO: In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc._ Filebeat monitors log files or locations that you specify. Filebeat can handle logs such as audit logs, server logs and slow logs. Metricbeat records metrics and specifics from the operating system. There are various options you can specify with metricbeat such as minimum log level; one for debug, info, warning, or error. 

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the _elk.yml_ file to _/etc/ansible_.
- Update the _hosts_ file to include... the attribute and destination IP
- Run the playbook, and navigate to _http://20.150.143.68:5601/app/kibana_ to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- _Which file is the playbook? Where do you copy it?_elk.yml and copy to /etc/ansible
- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_Update host file to include attribute and destination IP.
- _Which URL do you navigate to in order to check that the ELK server is running? http://20.150.143.68:5601/app/kibana

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._

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


