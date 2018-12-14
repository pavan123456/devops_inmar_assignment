#!/bin/bash
# import multiple remote git repositories to local CODE dir
#git@github.com:pavan123456/books.git
#ssh://git@github.com:pavan123456/ResumeDashboard.git
#remoteRepos=$(ssh -l $remoteUser $remoteHost "ls $remoteDir")
remoteHost="github.com"
remoteUser="pavan123456"
remoteUserEmail="pavankumarkasturi"
remoteEmailHost="@gmail.com"
remoteDir="books.git"

#echo $remoteHost:$remoteUser/$remoteDir/

cloneCmd="git clone ssh://$remoteUser@$remoteHost/$remoteDir"
echo $cloneCmd

remoteRepos=$(ssh -l $remoteUser $remoteHost "ls $remoteDir")
echo $remoteRepos

git config --global user.name $remoteUser
git config --global user.email $remoteUserEmail$remoteEmailHost
git clone $remoteHost:$remoteUser/$remoteDir/  mybooks


#for gitRepo in $remoteRepos
#do
  #localRepoDir=$(echo ${localCodeDir}${gitRepo}|cut -d'.' -f1)
  #if [ -d $localRepoDir ]; then 	
		#echo -e "Directory $localRepoDir already exits, skipping ...\n"
	#else
		#cloneCmd="git clone ssh://$remoteUser@$remoteHost/$remoteDir"
		#cloneCmd=$cloneCmd"$gitRepo $localRepoDir"
		#
		#cloneCmdRun=$($cloneCmd 2>&1)
#
		#echo -e "Running: \n$ $cloneCmd"
		#echo -e "${cloneCmdRun}\n\n"
	#fi
#done

echo "Finished cloning."


#localCodeDir="${HOME}/CODE/"

# settings / change this to your config

#remoteDir="~/books.git/"
#remoteRepos=$(ssh -l $remoteUser $remoteHost "ls $remoteDir")
#localCodeDir="${HOME}/CODE/"
#
## if no output from the remote ssh cmd, bail out
#if [ -z "$remoteRepos" ]; then
    #echo "No results from remote repo listing (via SSH)"
    #exit
#fi
#
## for each repo found remotely, check if it exists locally
## assumption: name repo = repo.git, to be saved to repo (w/o .git)
## if dir exists, skip, if not, clone the remote git repo into it
#for gitRepo in $remoteRepos
#do
  #localRepoDir=$(echo ${localCodeDir}${gitRepo}|cut -d'.' -f1)
  #if [ -d $localRepoDir ]; then 	
		#echo -e "Directory $localRepoDir already exits, skipping ...\n"
	#else
		#cloneCmd="git clone ssh://$remoteUser@$remoteHost/$remoteDir"
		#cloneCmd=$cloneCmd"$gitRepo $localRepoDir"
		#
		#cloneCmdRun=$($cloneCmd 2>&1)
#
		#echo -e "Running: \n$ $cloneCmd"
		#echo -e "${cloneCmdRun}\n\n"
	#fi
#done
