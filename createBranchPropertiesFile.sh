# this is used to create the list to select from branches or tags it creates a properties   file /r sucks
JOB_NAME=$1
JENKINS_HOME=$2
echo "hello"
branchList="Branches="

ProcessBranchLine()
{
        line=$1
        line=${line%%\\n}
        # delete the shortest match of / from the string
        line=",${line#remotes/}"
        branchList+=$line
}

ProcessTagLine()
{
        line=$1
        line=${line%%\\n}
        # delete the longest match of / from the string
        line=",${line#tags/}"
        branchList+=$line
}

git branch -a > ./${JOB_NAME}temp.txt
while read line
do
    if [[ $line == *ASP_9* ]]; then
        ProcessBranchLine $line
    elif [[ $line == *ho* ]]; then 
        ProcessBranchLine $line
    elif [[ $line == *ASP_10* ]]; then
        ProcessBranchLine $line
    elif [[ $line == *scm* ]]; then
        ProcessBranchLine $line   
    # I don't have a lot of branches, get em all    
 		elif [[ $line == * ]]; then
        ProcessBranchLine $line             
    fi
done < ${JOB_NAME}temp.txt


echo " this is my $branchList"
echo $branchList > ${JENKINS_HOME}/jobs/${JOB_NAME}/Branches.properties

git ls-remote --tags > ./${JOB_NAME}temp.txt
while read line
do
		# here I would put in the tag discrimination, for tags they don't want to see
		# I am taking them all
    if [[ $line == * ]]; then

    	# here I would put in the tag discrimination, for tags they don't want to see
		  # I am taking them all
		  echo THIS IS THE LINE $line
      #line=${line%%\\n}
      # delete the longest match of / from the string
      line=",${line#*tags/}"
      echo this is the new line $line
      branchList+=$line		          
    fi
done < ${JOB_NAME}temp.txt

echo " this is my $tag list $branchList"
echo $branchList >> ${JENKINS_HOME}/jobs/${JOB_NAME}/Branches.properties
