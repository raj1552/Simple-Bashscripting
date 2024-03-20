
#For displying menu
displayMenu(){
    echo "Welcome to Bash Scripting !!"
    echo "1. Create a directory"
    echo "2. List the contents of a directory"
    echo "3. Create an empty file"
    echo "4. Write content to a file"
    echo "5. Display the content of a file"
    echo "6. Delete a file"
    echo "7. Delete a directory"
    echo "8. Exit"
}

#Creating Directory Script
createDirectory() {
  read -p "Enter directory name: " dirName
  if [ ! -d "$dirName" ]; then
    mkdir "$dirName"
    echo "Directory Created Sucessfully"
    return 0
  fi
  echo "Directory already exists"
}

#TO list the contents of directory
listDirectory() {
  read -p "Enter Directory Path: " dirPath
  if [ ! -d "$dirPath" ]; then
    echo "Directory Path Doesn't Exist" 
    return 0
  fi
    ls "$dirPath"
    echo "Above are the list of Directory path: '$dirPath'"
 
}

#To create a file
createFile() {
  read -p "Enter the name of the file: " fileName
  if [ ! -d "$filename" ]; then
    touch "$fileName"
    echo "File Created Sucessfully"
    return 0
  fi

  echo "File already exists"
}

#To write content in a file
writetoFile() {
  echo "The Below are the listed files"
  ls
  read -p "Enter file name: " fileName
  read -p "Enter your full name: " fullName
  echo "$fullName" > "$fileName"
  echo "Content written on file $fileName"
}

#To Display file contents
displayFileContent() {
  read -p "Enter file name: " fileName
  if [ ! -f "$fileName" ]; then 
    echo "File Doesn't Exists"
    return 0
  fi

  files=$(cat "$fileName")
  echo " The content of the file is "$files""
}

#To delete a File
deleteFile() {
  echo "Choose a file you want to delete"
  ls
  read -p "Enter File name: " fileName
  if [ ! -f "$fileName" ]; then
    echo "File doesn't Exists"
    return 0
  fi 

  rm "$fileName"
  echo "File '$fileName' Deleted Sucessfully"
}

#To Delete Directory
deleteDirectory() {
  echo "List of Directory"
  ls 
  read -p "Enter Directory name: " dirName
  if [ ! -d "$dirName" ]; then
    echo "Directory Doesn't Exists"
  fi

  rm -r "$dirName"
  echo "Directory '$dirName' Deleted Sucessfully"
}

programeExit () {
  echo "Exiting!!"
  exit
}
#Main Script
while true; do 
  displayMenu
  read -p "Enter your choice what you want to do: " choice
  
  case $choice in 
    1) createDirectory ;;
    2) listDirectory ;;
    3) createFile ;;
    4) writetoFile ;;
    5) displayFileContent ;;
    6) deleteFile ;;
    7) deleteDirectory ;;
    8) programeExit ;;
    *) echo "Invalid choice choose from number 1-8." ;;
  esac
done


