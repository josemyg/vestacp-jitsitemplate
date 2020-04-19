# Jitsi Template for VestaCP

VestaCP templates files to install Jitsi Meet on Ubuntu Server

## Requeriments

* *Ubuntu Server 18.04* (should works on *Debian 9/10* but is not tested)
* *VestaCP*
* *Nginx*
* *Apache2* (Optional)


## Instalation of Jitsi on Ubuntu Server 18.04 with VestaCP

### Create the domain

Create the web domain on VestaCP and select SSL Let's encrypt Support (Only this, don't configure anything else)

### Update & Configuring Operation System

`sudo apt-get update && sudo apt-get full-upgrade`

Install apt-transport-https

`sudo apt-get install apt-transport-https`

Activate proxy_http module on apache (if not already set)

`a2enmod proxy_http`

Activate headers module on apache (if not already set)

`a2enmod headers`

Create generic folders of nginx

`cd /etc/nginx`  
`sudo mkdir sites-available && sudo mkdir sites-enabled`

Create the generic files for the Jitsi's domain

`sudo touch /etc/nginx/sites-available/<jitsi_domain>.conf`  
`sudo ln -s /etc/nginx/sites-available/<jitsi_domain>.conf /etc/nginx/sites-enabled/<jitsi_domain>.conf`

Enter to web templates folder

`cd /usr/local/vesta/data/templates/web/`

Download the Jitsi templates

`sudo wget https://github.com/josemyg/vestacp-jitsitemplate/raw/master/jitsi_vesta_template.tar.gz`

Extract the file

`sudo tar -xzvf jitsi_vesta_template.tar.gz`

Delete the unecessary archive file

`sudo rm jitsi_vesta_template.tar.gz`

Open 10000 UDP port on Firewall

## Jitsi's Installation

Set the Oficial Repository of Jitsi ([Source](https://github.com/jitsi/jitsi-meet/blob/master/doc/quick-install.md))

`echo 'deb https://download.jitsi.org stable/' >> /etc/apt/sources.list.d/jitsi-stable.list`
`wget -qO -  https://download.jitsi.org/jitsi-key.gpg.key | sudo apt-key add -`

Run the Jitsi's installation

`sudo apt-get -y update && sudo apt-get -y install jitsi-meet`

During the installation, select *"Own certificate"* option and insert the path of certificates

Key

`/home/<username>/conf/web/ssl.<jitsi_domain>.key`

Certificate

`/home/<username>/conf/web/ssl.<jitsi_domain>.crt`

NAT configuration (Only if necessary)

`sudo nano /etc/jitsi/videobridge/sip-communicator.properties`

Add the lines

`org.ice4j.ice.harvest.NAT_HARVESTER_LOCAL_ADDRESS=<Local.IP.Address>`  
`org.ice4j.ice.harvest.NAT_HARVESTER_PUBLIC_ADDRESS=<Public.IP.Address>`

Change the template on Jitsi's domain to Jitsi in VestaCP

It's done!
