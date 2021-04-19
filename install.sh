DEFAULT_INSTALL_PATH="$HOME"

Help()
{
   # Display Help
   echo "Script to clone git repo and create aliases."
   echo
   echo "Syntax: InstallScript [-p|h]"
   echo "options:"
   echo "p     Specify install path (Default: $DEFAULT_INSTALL_PATH)"
   echo "h     Print this Help."
   echo
}


while getopts p:h flag
do
    case "${flag}" in
        p) # read install path
          install_path=${OPTARG};;
        h) # display Help
         Help
         exit;;
       \?) # incorrect option
         echo "Error: Invalid option"
         exit;;
    esac
done


if [ -n "$install_path" ]
then
  echo "Will use ${install_path}"
else
  install_path="${DEFAULT_INSTALL_PATH}"
  echo "Will use ${install_path}"
fi

if [ -d "${install_path}/.dev_environment" ]
then
  rm -rf "${install_path}"/.dev_environment
fi

git clone https://github.com/strpc/dev_environment.git "${install_path}/.dev_environment" &>/dev/null

cd "${install_path}"/.dev_environment
cp .env.example .env
sed "s~install_path~${install_path}/.dev_environment~g" .dev_aliases.sh > "${install_path}"/.dev_aliases.sh

if [ -f "${HOME}/.zshrc" ]
then
   echo "Will create aliases for ZSH"
   echo "source ${install_path}/.dev_aliases.sh" >> "${HOME}"/.zshrc
   echo "Aliases created"
   source "${HOME}"/.zshrc
elif [ -f "${HOME}/.bashrc" ]
then
   echo "Will create aliases for BASH"
   echo "source ${install_path}/.dev_aliases.sh" >> "${HOME}"/.bashrc
   echo "Aliases created"
   source "${HOME}"/.bashrc
else
   echo "Cannot install in auto mode. PLZ mke aliases yourself"
   exit;
fi

echo "Installation Finished"
