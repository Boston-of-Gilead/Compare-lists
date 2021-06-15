#Compares list1 to list2, creates list3 from matches

#2/22/21 this works, leave alone

$list1 = "C:\path_to\List1.csv" #ref obj, Wonderware
$list2 = "C:\path_to\List2.csv" #diff obj, Get-WUList
$list3 = "C:\path_to\List3.csv" #output list

Compare-Object -IncludeEqual -ExcludeDifferent -passthru -ReferenceObject (Get-Content -Path $list1) -DifferenceObject (Get-Content -Path $list2) | Out-File -FilePath $list3

forEach ($i in $list3){
    Get-WindowsUpdate -KBArticleID $i -Install 
}