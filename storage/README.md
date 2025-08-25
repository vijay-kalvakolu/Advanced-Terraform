This module is used to create gcs storage

in the main.tf we have created a cloud storage bucket to store terraform backend remote state file  for state file lock so that state is modified or lost in local system and can be used any devloper and only one can perform the resource creations or any so that state file is not distirbed.


