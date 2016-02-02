WF=$1  #blueprint type 1:container per task, 2:container per WF

#install wget
Wget=$(which wget)
#echo "${Dock}"
if [[ -z ${Wget} ]]; then
   echo "wget installation"
   sudo apt-get install -y wget
fi

# docker installation
Dock=$(which docker)
echo "${Dock}"
if [[ -z ${Dock} ]]; then
   echo "Docker installation"
   if [ ! -f temp-install/docker-installation.sh ]; then
      wget -O temp-install/docker-installation.sh https://github.com/WorkflowCenter-Repositories/ToolsInstallationScripts/raw/master/docker-installation.sh
      chmod u+x temp-install/docker-installation.sh
   fi
   ./temp-install/docker-installation.sh
fi

#Cloudify configuration and installation

if [[ ! -d ~/WF-Cloudify ]]; then
   echo "Cloudify installation"
   mkdir temp-install
   wget -O temp-install/cloudify-install.sh https://github.com/WorkflowCenter-Repositories/ToolsInstallationScripts/raw/master/cloudify-install.sh
   chmod u+x ~temp-install/cloudify-install.sh
   . ./temp-install/cloudify-install.sh
else 
   source ~/WF-Cloudify/bin/activate
fi

